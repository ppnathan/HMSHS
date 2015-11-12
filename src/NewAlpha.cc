#include "NewAlpha.h"
#include "Utilities.h"
#include "random"
#include <iostream>
#include <cfloat>

using namespace std;

NewAlpha::NewAlpha(int nDState, int nCState, double discount_factor) :
    numDState(nDState), gamma(discount_factor) {

    vector<MatrixXd> initCoeff;
    initCoeff.push_back(MatrixXd::Zero(1, 1));
    initCoeff.push_back(MatrixXd::Zero(nCState, 1));
    initCoeff.push_back(MatrixXd::Zero(nCState, nCState));
    for(int i = 0; i < numDState; i++) {
        mCoeff.push_back(initCoeff);
    }
};

double NewAlpha::getdist(const CState& x1, const CState& x2) {
    VectorXd diff = x1 - x2;
    return sqrt(diff.squaredNorm());
};

double NewAlpha::AlphaValue(const DState& q, const CState& x) const {
    MatrixXd first_order_term = mCoeff[q][1].transpose() * (x - mLocalx);
    MatrixXd second_order_term = (x - mLocalx).transpose() * mCoeff[q][2] * (x - mLocalx);
    return mCoeff[q][0](0) + first_order_term(0) + second_order_term(0);
};

double NewAlpha::ExpectedAlphaValue(const DState& q, const CState& x,
                                    const MatrixXd& cov_matrix) const {

    MatrixXd first_order_term = mCoeff[q][1].transpose() * (x - mLocalx);
    MatrixXd second_order_term = (x - mLocalx).transpose() * mCoeff[q][2] * (x - mLocalx);

    return mCoeff[q][0](0) + first_order_term(0) + second_order_term(0) +
           (mCoeff[q][2] * cov_matrix).trace();
};

double NewAlpha::calvalue(const Model& currModel, const Belief& b) const {
    double sum  = 0;

    for (int q = 0; q < currModel.getNumDState(); q++) {
        MatrixXd first_order_term = mCoeff[q][1].transpose() * (b.cstate - mLocalx);
        MatrixXd second_order_term = (b.cstate - mLocalx).transpose() * mCoeff[q][2] *
                                     (b.cstate - mLocalx);
        sum += (mCoeff[q][0](0) + first_order_term(0) + second_order_term(0)) * b.DStateProb[q];
    }

    return sum;
};

double NewAlpha::initSigma(const Model& currModel, Belief& initBelief) {
    double J_sigma;
    double J_star = -DBL_MAX; // for reward

    mLocalx = initBelief.cstate;

    for (DControl DCrl = 0; DCrl < currModel.getNumDControls(); DCrl++) {
        J_sigma = 0;
        for (int q = 0; q < currModel.getNumDState(); q++) {
            J_sigma += currModel.getReward(q, initBelief.cstate, DCrl) * initBelief.DStateProb[q];
        }

        if (J_sigma > J_star) {
            J_star = J_sigma;
            mSigma = DCrl;
        }
    }

    for (DState q = 0; q < currModel.getNumDState(); q++) {
        mCoeff[q][0](0, 0) = currModel.getReward(q, initBelief.cstate, mSigma);
        mCoeff[q][1] = currModel.getReward1stDeri(q, initBelief.cstate, mSigma);
        mCoeff[q][2] = 0.5 * currModel.getReward2ndDeri(q, initBelief.cstate, mSigma);
    }

    return J_star;
};

void NewAlpha::calCoeff(const Model& currModel, NewAlphaSet& alphaset,
                        vector<vector<int> >& optalpha, DControl& sigma_star,
                        Belief& currBelief) {
    vector<MatrixXd> cov = currModel.getCovariance();

    for (int q = 0; q < currModel.getNumDState(); q++) {
        double constterm = 0;
        VectorXd firstorderterm = VectorXd::Zero(currModel.getNumCStateVar());
        MatrixXd secondorderterm =
            MatrixXd::Zero(currModel.getNumCStateVar(), currModel.getNumCStateVar());

        for (int qq = 0; qq < currModel.getNumDState(); qq++) {
            CState x_next = currModel.getNextCStateNoNoise(qq, currBelief.cstate);
            MatrixXd firstderi = currModel.get1stDerivative(qq, currBelief.cstate);

            for (int zq = 0; zq < currModel.getNumDObs(); zq++) {
                NewAlpha& alpha_star = alphaset[optalpha[sigma_star][zq]];
                constterm += currModel.getDiscreteObsProb(zq, qq) *
                             alpha_star.ExpectedAlphaValue(qq, x_next, cov[qq]) *
                             currModel.getDStateTransProb(qq, q, sigma_star);
                firstorderterm += currModel.getDiscreteObsProb(zq, qq) *
                                  currModel.getDStateTransProb(qq, q, sigma_star) *
                                  (firstderi.transpose() * alpha_star.mCoeff[qq][1] +
                                   2 * firstderi.transpose() * alpha_star.mCoeff[qq][2] *
                                   (x_next - alpha_star.mLocalx));
                secondorderterm += currModel.getDiscreteObsProb(zq, qq) *
                                   currModel.getDStateTransProb(qq, q, sigma_star) *
                                   (2 * firstderi.transpose() * alpha_star.mCoeff[qq][2] *
                                    firstderi);
            }
        }

        mCoeff[q][0](0, 0) = constterm * gamma +
                             currModel.getReward(q, currBelief.cstate, sigma_star);
        mCoeff[q][1] = firstorderterm * gamma +
                       currModel.getReward1stDeri(q, currBelief.cstate, sigma_star);
        mCoeff[q][2] = 0.5 * (secondorderterm * gamma +
                              currModel.getReward2ndDeri(q, currBelief.cstate, sigma_star));
    }
};


double NewAlpha::backup(const Model& currModel, NewAlphaSet& alphaset, Belief& currBelief,
                        double thresholddist, vector<int>& optimalalphaidx) {
    double indivmaxvalue;
    vector<vector<int> > optalpha(currModel.getNumDState(),
                                  vector<int>(currModel.getNumDObs(), -1));
    vector<double> J_sigma(currModel.getNumDControls(), 0);

    DControl sigma_star;
    double J_star = -DBL_MAX; // for reward
//    double J_star = DBL_MAX;     // for cost
    vector<MatrixXd> covariance = currModel.getCovariance();

    //-------------------------------End Initialization------------------------------------------

    //-------------------------------Finding optimal sigma---------------------------------------

    for (DControl DCrl = 0; DCrl < currModel.getNumDControls(); DCrl++) {
//        cout<<"DCrl = " <<DCrl<<endl;
        J_sigma[DCrl] = 0;

        for (DObs zq = 0; zq < currModel.getNumDObs(); zq++) {

            indivmaxvalue= -DBL_MAX; //999999999; // for reward
            double numalphaselected = 0;
            for (int j = 0; j < alphaset.size(); j++) {   // may not loop through the \alpha set
                if (getdist(alphaset[j].mLocalx, currBelief.cstate) < thresholddist) {
//              if((getdist(currModel.getNextCStateNoNoise(0, currBelief.cstate),
//                   alphaset[j].mLocalx) < thresholddist) ||
//              (getdist(currModel.getNextCStateNoNoise(1, currBelief.cstate),
//                  alphaset[j].mLocalx) < thresholddist) )

                    numalphaselected++;

                    double sum_qq = 0;
                    for (int qq = 0; qq < numDState; qq++) {
                        double sum_q = 0;
                        for (int q = 0; q < numDState; q++) {
                            sum_q += currModel.getDStateTransProb(qq, q, DCrl) *
                                     currBelief.DStateProb[q];
                        }
                        CState meanx_next = currModel.getNextCStateNoNoise(qq, currBelief.cstate);
                        sum_qq += alphaset[j].ExpectedAlphaValue(qq, meanx_next, covariance[qq]) *
                                  currModel.getDiscreteObsProb(zq, qq) *
                                  sum_q;
                    }

                    if (sum_qq > indivmaxvalue) {
                        indivmaxvalue = sum_qq;
                        optalpha[DCrl][zq] = j;
                    }
                }
            }

            cout << "zq = " << zq << "; numalphaselected = " << numalphaselected << endl;

            J_sigma[DCrl] += indivmaxvalue;
//                cout<< indivmaxvalue<<"   "<<eta[DCrl][i]<<endl;
        }

        J_sigma[DCrl] *= gamma;

//      cout<<"J_sigma["<<DCrl<<"]  = "<<J_sigma[DCrl]<<endl;

        for (int i = 0; i < currModel.getNumDState(); i++)
            J_sigma[DCrl] += currModel.getReward(i, currBelief.cstate, DCrl) *
                             currBelief.DStateProb[i];

        if (J_sigma[DCrl] > J_star) {
            J_star = J_sigma[DCrl];
            sigma_star = DCrl;
        }
    }

    this->mSigma = sigma_star;
    this->mLocalx = currBelief.cstate;
    optimalalphaidx.clear();

    for (int zq = 0; zq < currModel.getNumDObs(); zq++)
        optimalalphaidx.push_back(optalpha[sigma_star][zq]);

    //----------------------------End finding optimal sigma------------------------------------

    // Calculate mCoeff
    calCoeff(currModel, alphaset, optalpha, sigma_star, currBelief);

    cout<<"test3"<<endl;

    return J_star;

}

