#ifndef NEWALPHA_H
#define NEWALPHA_H

#include "Model.h"
#include "Belief.h"
#include <vector>
#include <eigen3/Eigen/Dense>

using namespace Eigen;

class NewAlpha;

typedef std::vector<NewAlpha> NewAlphaSet;

class NewAlpha {

public:
    NewAlpha(int nDState, int nCState, double discount_factor);

    // Calculate alpha(q, x)
    double AlphaValue(const DState& q, const CState& x) const;
    double ExpectedAlphaValue(const DState& q, const CState& x, const MatrixXd& cov_matrix) const;

    // Calculate the intermediate alpha(q, x) =
    //                               Sigma_{qq}alpha_t(qq, zx)Omega(zq|qq)Tx(zx|qq,x)Tq(qq|q,sigma)
    // double calIntermediateValue(const Model& currModel,Belief& b, DControl& DCrl,
    //                               DObs& zq, CState& zx);

    // Calculate J(b) = Sigma_q alpha(q,x)b(q,x)
    double calvalue(const Model& currModel, const Belief& b) const;

    // Perform backup({alpha_j}_j, b)
    double backup(const Model &currModel, NewAlphaSet &alphaset, Belief &currBelief,
                  double thresholddist, vector<int> &optimalalphaidx);

    // Initialize sigma for a belief
    double initSigma(const Model& currModel, Belief &initBelief);

    ~NewAlpha(){};

//  vector<vector<double> > coeff;// coeff[q][coeff] should be private, public for debug
    vector<vector<MatrixXd> > mCoeff; // coeff[q][coefficient]
    DControl mSigma;
    CState mLocalx;

private:
    int numDState;
    double gamma;

    // vector<double> zx_tmp_for_testing;
    double getdist(const CState& x1, const CState& x2);
    void calCoeff(const Model& currModel, NewAlphaSet& alphaset, vector<vector<int> >& optalpha,
                  DControl& sigma_star, Belief& currBelief);
};

#endif