#ifndef TWODMODEL_H
#define TWODMODEL_H

#include "Model.h"

typedef struct pos{
	double x;
	double v;
	pos(double _x = 0, double _v = 0): x(_x), v(_v) {}
}pos;

class TwoDModel : public Model
{
  public:
	  
      TwoDModel();
      
      double getCStateTransProb(const CState &x_next, const DState &q_next, 
	                            const CState &x_k) const;

      double getDStateTransProb(const DState &q_next, const DState &q_k, 
	                            const DControl &simga_k) const;

      double getDiscreteObsProb(const DObs &zq_k, const DState &q_k) const;

      double getReward(const DState& q, const CState &x, const DControl &sigma) const;

	  double getCost(const DState& q, const CState &x, const DControl &sigma) const;


      double sample(const DState &q_k, const CState &x_k, const DControl &sigma_k, 
	                DState &q_next, CState &x_next, DObs &obs_out) const;
	  
	  CState getNextCStateNoNoise(const DState &q_next, const CState &x_k) const;

	  MatrixXd get1stDerivative(const DState &q, const CState &x) const;
	  
  	  VectorXd getReward1stDeri(const DState &q, const CState &x, const DControl &sigma) const;
	
  	  MatrixXd getReward2ndDeri(const DState &q, const CState &x, const DControl &sigma) const;
	
	  vector<vector<vector<double> > >  getRewardCoeff() const;
	  
	  vector<MatrixXd> getCovariance() const;
	  
	  MatrixXd getCovMatrix(const DState &q) const;

  private:
      double deltaT;
      double noisemean;
      double awakenoisestddev;
	  double drowsynoisestddev;
	  double k1;
	  double k2;
//      double c;
      double obserr;

	  vector<vector<vector<double> > > RewardCoeff; //RewardCoeff[sigma][q][coeff];

	  DState sampleDState(const DState &q, const DControl &sigma) const;
	  CState sampleCState(const DState &q_next, const CState &x) const;
	  DObs sampleDObs(const DState &q_next) const;
            
};

#endif // DROWSYDRIVERMODEL_H