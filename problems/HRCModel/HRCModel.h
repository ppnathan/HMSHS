#ifndef HRCMODEL_H
#define HRCMODEL_H

#include "Model.h"

typedef struct pos{
	double x;
	double y;
	pos(double _x = 0, double _y = 0): x(_x), y(_y) {}
}pos;

class HRCModel : public Model
{
  public:
      HRCModel();
      
      double getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const;
      double getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& simga_k) const;

      double getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const;

      double getReward(const DState& q, const CState& x, const DControl& sigma) const;

	  double getCost(const DState& q, const CState& x, const DControl& sigma) const;


      double sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const;
          
  private:
      double deltaT;
      double noisemean;
      double noisestddev;
      double c;
	  double v_h;
	  double v_r;
	  double Rgoal;
	  double beta;
	  vector<pos> goal;
	  pos H_initpos;
	  pos R_initpos;
//      double obserr;

	  DState sampleDState(const DState& q, const DControl& sigma) const;
	  CState sampleCState(const DState& q_next, const CState& x) const;
	  DObs sampleDObs(const DState& q_next) const;
	  vector<double> P_theta(int g, pos Hpos) const ;
            
};

#endif // HRCMODEL_H