#ifndef SIMPLEMODEL_H
#define SIMPLEMODEL_H

#include "Model.h"


class SimpleModel : public Model
{
  public:
      SimpleModel();
      
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
      double noisestddev;
      double c;
	  double a;
      double obserr;
	  vector<vector<vector<double> > > RewardCoeff; // RewardCoeff[DControl][DState][0~2]

	  DState sampleDState(const DState& q, const DControl& sigma) const;
	  CState sampleCState(const DState& q_next, const CState& x) const;
	  DObs sampleDObs(const DState& q_next) const;
            
};

#endif // SIMPLEMODEL_H