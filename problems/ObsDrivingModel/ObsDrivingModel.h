#ifndef OBSDRIVINGMODEL_H
#define OBSDRIVINGMODEL_H

#include "Model.h"

typedef struct pos{
	double x;
	double v;
	pos(double _x = 0, double _v = 0): x(_x), v(_v) {}
}pos;

class ObsDrivingModel : public Model
{
  public:
      ObsDrivingModel();
      
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
	  
      double AttStraightNoiseStdDev;
	  double AttTurnNoiseStdDev;
	  double DisStraightNoiseStdDev;
	  double DisTurnNoiseStdDev;
	  
	  double AttCarDistNoiseStdDev;
	  double DisCarDistNoiseStdDev;
	  
	  double AttTurnConst;
	  double DisTurnConst;
	  
	  double AttRelSpd;
	  double DisRelSpd;
	  
	  double c;
	  

	  vector<vector<vector<double> > > RewardCoeff; //RewardCoeff[sigma][q][coeff];

	  DState sampleDState(const DState& q, const DControl& sigma) const;
	  CState sampleCState(const DState& q_next, const CState& x) const;
	  DObs sampleDObs(const DState& q_next) const;
            
};

#endif // OBSDRIVINGMODEL_H