#ifndef NEWALPHA_H
#define NEWALPHA_H

#include "Model.h"
#include "Belief.h"
#include <vector>

class NewAlpha;

typedef std::vector<NewAlpha> NewAlphaSet;

class NewAlpha {
	
public:
	NewAlpha(int nDState, double discount_factor);
	
	/*	Calculate alpha(q, x)	*/
	double AlphaValue(DState& q, CState& x);
	double ExpectedAlphaValue(DState& q, CState& x, vector<double>& cov);
	
	/*	Calculate the intermediate alpha(q, x) = Sigma_{qq}alpha_t(qq, zx)Omega(zq|qq)Tx(zx|qq,x)Tq(qq|q,sigma)	*/
//	double calIntermediateValue(const Model& currModel,Belief& b, DControl& DCrl, DObs& zq, CState& zx);
	
	/*	Calculate J(b) = Sigma_q alpha(q,x)b(q,x)	*/
	double calvalue(const Model& currModel, Belief& b);
	
	
	
	/*	Perform backup({alpha_j}_j, b)	*/
	double backup(const Model& currModel, NewAlphaSet& alphaset, Belief& currBelief, double thresholddist, vector<int>& optimalalphaidx);
	
	/*	Initialize sigma for a belief*/
	double initSigma(const Model& currModel, Belief& initBelief);
	 
	~NewAlpha(){};
	
	vector<vector<double> > coeff;// coeff[q][coeff] should be private, public for debug 
	DControl sigma;
	CState localx;
private:
	
//	vector<DObs> zq_sample;
//	vector<CObs> zx_sample;
//	DControl sigma;
	int numDState;
//	int numDObs;
	double gamma;
	
	//vector<double> zx_tmp_for_testing;
	double getdist(const CState& x1, const CState& x2);
	void calNewCoeff(const Model& currModel, NewAlphaSet& alphaset, vector<vector<int> >& optalpha, DControl& sigma_star, Belief& currBelief);
	void calNewCoeff2D(const Model& currModel, NewAlphaSet& alphaset, vector<vector<int> >& optalpha, DControl& sigma_star, Belief& currBelief);
//	void sampleX_next(CState& meanx, vector<double>& stddev, vector<CObs>& x_next, vector<double>& prob, vector<CObs>& zx_samples, double zxinterval);
	
			
};



#endif