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
      
      double getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const;
      double getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& simga_k) const;

      double getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const;

      double getReward(const DState& q, const CState& x, const DControl& sigma) const;

	  double getCost(const DState& q, const CState& x, const DControl& sigma) const;


      double sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const;
	  
	  CState getNextCStateNoNoise(const DState& q_next, const CState& x_k) const;

	  vector<double> get1stDerivative(const DState& q, const CState& x) const;

	  vector<double> get2ndDerivative(const DState& q, const CState& x) const;
	
	  vector<vector<vector<double> > >  getRewardCoeff() const;
	  
	  vector<vector<double> > getCovariance() const;
          
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

	  DState sampleDState(const DState& q, const DControl& sigma) const;
	  CState sampleCState(const DState& q_next, const CState& x) const;
	  DObs sampleDObs(const DState& q_next) const;
            
};

#endif // DROWSYDRIVERMODEL_H