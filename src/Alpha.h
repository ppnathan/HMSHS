#ifndef ALPHA_H
#define ALPHA_H

#include "Model.h"
#include "Belief.h"
#include <vector>

class Alpha;

typedef std::vector<Alpha> AlphaSet;

class Alpha {
	
public:
	Alpha(int nDState, int nDObs, int nSamples, double discount_factor);
	
	/*	Calculate alpha(q, x)	*/
	double AlphaValue(const Model& currModel, DState& q, CState& x);
	
	/*	Calculate J(b) = Sigma_q alpha(q,x)b(q,x)	*/
	double calvalue(const Model& currModel, Belief& b);
	
	
	/*	Set zx_sample*/
	void setzx_sample(vector<CObs>& zx);    //should be modified
	
	/*	Perform backup({alpha_j}_j, b)	*/
	double backup(const Model& currModel, AlphaSet& alphaset, Belief& currBelief, vector<CObs>& zx_samples, double zxinterval);
	
	/*	Initialize sigma for a belief*/
	double initSigma(const Model& currModel, Belief& initBelief);
	 
	~Alpha(){};
	
	vector<vector<vector<double> > > beta;// should be private, public for debug
	DControl sigma;
private:
	
//	vector<DObs> zq_sample;
	vector<CObs> zx_sample;
//	DControl sigma;
	int numDState;
	int numDObs;
	int numSamples;
	double gamma;
	
	//vector<double> zx_tmp_for_testing;
	
	void sampleX_next(CState& meanx, vector<double>& stddev, vector<CObs>& x_next, vector<double>& prob, vector<CObs>& zx_samples, double zxinterval);
	/*	Calculate the intermediate alpha(q, x) = Sigma_{qq}alpha_t(qq, zx)Omega(zq|qq)Tx(zx|qq,x)Tq(qq|q,sigma)	*/
	double calIntermediateValue(const Model& currModel,Belief& b, DControl& DCrl, DObs& zq, CState& zx);
			
};



#endif