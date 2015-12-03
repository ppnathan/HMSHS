#include "TwoDModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_2DMdl = 0.95;
const int NumCStateVar_2DMdl = 2;  // number of continuous state variables
const int NumDState_2DMdl = 4;     // number of discrete states
const int NumCObsVar_2DMdl = 1;    // number of continuous observation variables
const int NumDObs_2DMdl = 2;       // number of discrete observations
const int NumDControls_2DMdl = 4;  // number of discrete controls

// q: AC0:(Awake, Controller 0); AC1:(Awake, Controller 1); DC0:(Drowsy, Controller 0); DC1:(Drowsy, Controller 1); 
enum { AC0 = 0, AC1 = 1, DC0 = 2, DC1 = 3}; 

// sigma: V00:(Reminder off, Execute C0); V01:(Reminder off, Execute C1); V10:(Reminder on, Execute C0); V11:(Reminder on, Execute C1);
enum {V00 = 0, V01 = 1, V10 = 2, V11 = 3}; 

TwoDModel::TwoDModel() : Model(NumCStateVar_2DMdl, NumDState_2DMdl, NumCObsVar_2DMdl, 
                               NumDObs_2DMdl, NumDControls_2DMdl, Discount_2DMdl),
                    deltaT(1), noisemean(0), awakenoisestddev(0.2), drowsynoisestddev(1), 
                    k1(0.0796), k2(0.4068), obserr(0.05)
{
                                                      //500 + 0x - x^2 + 0xy + 0y - 0.1y^2
    double rewardcoefficient[NumDControls_2DMdl][6] = {{500, 0, -1, 0, 0, -0.1}, 
                                                       {495, 0, -1, 0, 0, -0.1},
                                                       {495, 0, -1, 0, 0, -0.1}, 
                                                       {490, 0, -1, 0, 0, -0.1}};   
                                  
    vector<vector<double> > tmpvector(NumDState_2DMdl, vector<double>(6, 0));

    for (int i = 0; i < NumDControls_2DMdl; i++) {
        for (int j = 0; j < NumDState_2DMdl; j++) {
            for (int k = 0; k < 6; k++) {
                tmpvector[j][k] = rewardcoefficient[i][k];
            }
        }
        RewardCoeff.push_back(tmpvector);
    }
};

DState TwoDModel::sampleDState(const DState &q, const DControl &sigma) const{
    array<double,4> init = {this->getDStateTransProb(AC0, q, sigma),
                            this->getDStateTransProb(AC1, q, sigma), 
                            this->getDStateTransProb(DC0, q, sigma),
                            this->getDStateTransProb(DC1, q, sigma)};

    discrete_distribution<int> distribution(init.begin(), init.end());

    return distribution(generator);
};

CState TwoDModel::sampleCState(const DState &q_next, const CState &x_k) const {
    normal_distribution<double> awakenormalRand(this->noisemean, this->awakenoisestddev);
    normal_distribution<double> drowsynormalRand(this->noisemean, this->drowsynoisestddev);
    double awakenoise = awakenormalRand(generator);
    double drowsynoise = drowsynormalRand(generator);    
    CState x_next(x_k.size());

    if (q_next == AC0) {
        x_next(0) = (1 - this->deltaT * this->deltaT / 2 * k1) * x_k(0) + 
                    (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1) + 
                    awakenoise;
        x_next(1) = -(this->deltaT) * k1 * x_k(0) + (1 - this->deltaT * k2) * x_k(1);
    } else if (q_next == AC1) {
        x_next(0) = (1 - this->deltaT * this->deltaT / 2 * 2 * k1) * x_k(0) +
                    (this->deltaT - this->deltaT * this->deltaT / 2 * 2 * k2) * x_k(1) +
                    awakenoise;
        x_next(1) = -(this->deltaT) * 2 * k1 * x_k(0) + (1 - this->deltaT * 2 * k2) * x_k(1);
    } else if (q_next == DC0) {
        x_next(0) = x_k(0) + this->deltaT * x_k(1) + drowsynoise;
        x_next(1) = x_k(1);
    } else if (q_next == DC1) {
        x_next(0) = (1 - this->deltaT * this->deltaT / 2 * k1) * x_k(0) + 
                    (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1) + drowsynoise;
        x_next(1) = -this->deltaT * k1 * x_k(0) + (1 - this->deltaT * k2) * x_k(1);
    }
    
    return x_next;
};

DObs TwoDModel::sampleDObs(const DState &q_next) const {

    bernoulli_distribution bernlRand(1 - this->obserr);
    if(bernlRand(generator))
        return q_next>>1;
    else
        return ((q_next>>1) == 0)? 1:0;
};

double TwoDModel::getCStateTransProb(CState const &x_next, 
                                     DState const &q_next, 
                                     CState const &x_k) const {
    double difference[2];
    if(q_next == AC0) {
        difference[0] = x_next(0) - (1 - this->deltaT * this->deltaT / 2 * k1) * x_k(0) - 
                        (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1);
        difference[1] = x_next(1)  - (-(this->deltaT) * k1 * x_k(0) + 
                        (1 - this->deltaT * k2 * x_k(1)));
        double p1 = 1.0 / (awakenoisestddev * sqrt(2 * PI)) * 
                    exp(-0.5 * (difference[0] - noisemean) * (difference[0] - noisemean) /
                        (awakenoisestddev * awakenoisestddev));
        double p2 = 1.0 / (0.1 * sqrt(2 * PI)) * 
                    exp(-0.5 * (difference[1] - noisemean) * (difference[1] - noisemean) /
                        (0.1 * 0.1));
        
        return p1 * p2;

    }
    else if (q_next == AC1) {
        difference[0] = x_next(0) - (1 - this->deltaT * this->deltaT / 2 * 2 * k1) * x_k(0) -
                        (this->deltaT - this->deltaT * this->deltaT / 2 * 2 * k2) * x_k(1);
        difference[1] = x_next(1)  - (-this->deltaT * 2 * k1 * x_k(0) +
                        (1 - this->deltaT* 2 * k2 * x_k(1)));
        double p1 = 1.0 / (awakenoisestddev * sqrt( 2 * PI)) *
                    exp(-0.5 * (difference[0] - noisemean) * (difference[0] - noisemean) /
                        (awakenoisestddev * awakenoisestddev));
        double p2 = 1.0 / (0.1 * sqrt(2 * PI)) *
                    exp(-0.5 * (difference[1] - noisemean) * (difference[1] - noisemean) /
                        (0.1 * 0.1));
        
        return p1*p2;
    }
    else if(q_next == DC0) {
        difference[0] = x_next(0) - x_k(0) - this->deltaT * x_k(1);
        difference[1] = x_next(1) - x_k(1);
        double p1 = 1.0 / (drowsynoisestddev * sqrt(2 * PI)) *
                    exp(-0.5 * (difference[0] - noisemean) * (difference[0] - noisemean) /
                        (drowsynoisestddev * drowsynoisestddev));
        double p2 = 1.0 / (0.1 * sqrt(2 * PI)) *
                    exp(-0.5 * (difference[1] - noisemean) * (difference[1] - noisemean) /
                        (0.1 * 0.1));
        
        return p1*p2;
    }
    else if(q_next == DC1) {
        difference[0] = x_next(0) - (1 - this->deltaT * this->deltaT / 2 * k1) * x_k(0) -
                        (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1);
        difference[1] = x_next(1)  - (-this->deltaT * k1 * x_k(0) +
                        (1 - this->deltaT * k2 * x_k(1)));
        double p1 = 1.0 / (drowsynoisestddev * sqrt(2 * PI)) *
                    exp(-0.5 * (difference[0] - noisemean) * (difference[0] - noisemean) /
                        (drowsynoisestddev * drowsynoisestddev));
        double p2 = 1.0 / (0.1 * sqrt(2 * PI)) *
                    exp(-0.5 * (difference[1] - noisemean) * (difference[1] - noisemean) /
                        (0.1 * 0.1));
        
        return p1 * p2;
    }
    else {
        printf("q_next out of domain\n");
        exit(1);
    }
};

double TwoDModel::getDStateTransProb(DState const &q_next, 
                                     DState const &q_k,
                                     DControl const &sigma_k) const {
    double sigma0[2][2] = { {0.95, 0.05}, 
                            {0.05, 0.95} };
    double sigma1[2][2] = { {0.95, 0.8},
                            {0.05, 0.2}};
    
    if((sigma_k>>1) == 0) // (sigma_k == V00) || (sigma_k == V01)
    {
        return sigma0[q_next >> 1][q_k >> 1] * ((q_next & 0x01) == (sigma_k & 0x01));
    }
    else // (sigma_k == V10) || (sigma_k == V11)
    {
        return sigma1[q_next >> 1][q_k >> 1] * ((q_next & 0x01) == (sigma_k & 0x01));
    }
};

double TwoDModel::getDiscreteObsProb(DObs const &zq_k, DState const &q_k) const {
    if(zq_k == (q_k >> 1))
        return 1 - obserr;
    else
        return obserr;
};

CState TwoDModel::getNextCStateNoNoise(const DState &q_next, const CState &x_k) const{
    CState x_next(this->getNumCStateVar());
    
    if(q_next == AC0) {
        x_next(0) = (1- this->deltaT * this->deltaT / 2 * k1) * x_k(0) +
                    (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1);
        x_next(1) = -this->deltaT * k1 * x_k(0) + (1 - this->deltaT * k2) * x_k(1);
    }
    else if(q_next == AC1) {
        x_next(0) = (1- this->deltaT * this->deltaT / 2 * 2 * k1) * x_k(0) +
                    (this->deltaT - this->deltaT * this->deltaT / 2 * 2 * k2) * x_k(1);
        x_next(1) = -this->deltaT * 2 * k1 * x_k(0) + (1 - this->deltaT * 2 * k2) * x_k(1);
    }
    else if(q_next == DC0) {
        x_next(0) = x_k(0) + this->deltaT * x_k(1);
        x_next(1) = x_k(1);
    }
    else if(q_next == DC1) {
        x_next(0) = (1 - this->deltaT * this->deltaT / 2 * k1) * x_k(0) +
                    (this->deltaT - this->deltaT * this->deltaT / 2 * k2) * x_k(1);
        x_next(1) = -this->deltaT * k1 * x_k(0) + (1 - this->deltaT * k2) * x_k(1);
    }

    return x_next;
};

MatrixXd TwoDModel::get1stDerivative(const DState &q, const CState &x) const {
    MatrixXd firstderivative(this->getNumCStateVar(), this->getNumCStateVar());
    if(q == AC0) {
        firstderivative(0, 0) = 1 - this->deltaT * this->deltaT / 2 * k1;
        firstderivative(0, 1) = this->deltaT - this->deltaT * this->deltaT / 2 * k2;
        firstderivative(1, 0) = -this->deltaT * k1;
        firstderivative(1, 1) = 1 - this->deltaT * k2;
        return firstderivative;
    }
    else if(q == AC1) {
        firstderivative(0, 0) = 1 - (this->deltaT) * (this->deltaT)/ 2 * 2 * k1;
        firstderivative(0, 1) = this->deltaT - (this->deltaT) * (this->deltaT) / 2 * 2 * k2;
        firstderivative(1, 0) = -(this->deltaT) * 2 * k1;
        firstderivative(1, 1) = 1 - (this->deltaT) * 2 * k2;
        return firstderivative;
    }
    else if(q == DC0) {
        firstderivative(0, 0) = 1;
        firstderivative(0, 1) = this->deltaT;
        firstderivative(1, 0) = 0;
        firstderivative(1, 1) = 1;
        return firstderivative;
    }
    else { //if(q_next == DC1) 
        firstderivative(0, 0) = 1 - (this->deltaT) * (this->deltaT) / 2 * k1;
        firstderivative(0, 1) = this->deltaT - (this->deltaT) * (this->deltaT) / 2 * k2;
        firstderivative(1, 0) = -(this->deltaT) * k1;
        firstderivative(1, 1) = 1 - (this->deltaT) * k2;
        return firstderivative;
    }
    
};

double TwoDModel::getReward(const DState &q, const CState &x, const DControl &sigma) const {
    
    return (RewardCoeff[sigma][q][0] + 
            RewardCoeff[sigma][q][1] * x(0) + 
            RewardCoeff[sigma][q][2] * x(0) * x(0) +
            RewardCoeff[sigma][q][3] * x(0) * x(1) +
            RewardCoeff[sigma][q][4] * x(1) + 
            RewardCoeff[sigma][q][2] * x(1) * x(1));
    // double R_sigma1[2] = {0,-5};
//     double R_sigma2[2] = {0,-5};
//     return (500 - (x(0)*x(0)) - 0.1*(x(1)*x(1))) + R_sigma1[sigma>>1] + R_sigma2[sigma&0x01];
};

VectorXd TwoDModel::getReward1stDeri(const DState &q, const CState &x, 
                                                      const DControl &sigma) const {
    VectorXd reward1stDeri(this->getNumCStateVar());
    
    reward1stDeri(0) = RewardCoeff[sigma][q][1] + 
                       2 * RewardCoeff[sigma][q][2] * x(0) +
                       RewardCoeff[sigma][q][3] * x(1);
    reward1stDeri(1) = RewardCoeff[sigma][q][4] +
                       2 * RewardCoeff[sigma][q][5] * x(1) +
                       RewardCoeff[sigma][q][3] * x(0);

    return reward1stDeri;
};

MatrixXd TwoDModel::getReward2ndDeri(const DState &q, const CState &x, 
                                                      const DControl &sigma) const {
    MatrixXd Reward2ndDeri(this->getNumCStateVar(), this->getNumCStateVar());
    
    Reward2ndDeri(0, 0) = 2 * RewardCoeff[sigma][q][2];
    Reward2ndDeri(0, 1) = RewardCoeff[sigma][q][3];
    Reward2ndDeri(1, 0) = RewardCoeff[sigma][q][3];
    Reward2ndDeri(1, 1) = 2 * RewardCoeff[sigma][q][5];
    
    return Reward2ndDeri;
};

vector<MatrixXd> TwoDModel::getCovariance() const {
    MatrixXd cov_tmp(this->getNumCStateVar(), this->getNumCStateVar());
    vector<MatrixXd> covariance;
    for (DState q = 0; q < NumDState_2DMdl; q++) {      
        if (q >> 1 == 0 ) { //A
            cov_tmp(0, 0) = awakenoisestddev*awakenoisestddev;
        }
        else { //D
            cov_tmp(0, 0) = drowsynoisestddev*drowsynoisestddev;
        }
        cov_tmp(0, 1) = 0;
        cov_tmp(1, 0) = 0;
        cov_tmp(1, 1) = 0;
        
        covariance.push_back(cov_tmp);
    }
    
    return covariance;
};

MatrixXd TwoDModel::getCovMatrix(const DState &q) const {
    MatrixXd CovMatrix(this->getNumCStateVar(), this->getNumCStateVar());
    
    if (q >> 1 == 0 ) { //A
        CovMatrix(0, 0) = awakenoisestddev*awakenoisestddev;
        CovMatrix(0, 1) = 0;
        CovMatrix(1, 0) = 0;
        CovMatrix(1, 1) = 0;
    }
    else { //D
        CovMatrix(0, 0) = drowsynoisestddev*drowsynoisestddev;
        CovMatrix(0, 1) = 0;
        CovMatrix(1, 0) = 0;
        CovMatrix(1, 1) = 0;
    }
    return CovMatrix; 
};

double TwoDModel::sample(const DState &q_k, const CState &x_k, const DControl &sigma_k,
                         DState &q_next, CState &x_next, DObs &obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next(0) = "<<x_next(0)<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k) *
           this->getCStateTransProb(x_next, q_next, x_k) *
           this->getDiscreteObsProb(q_next, obs_out);
};
