#include "ObsDrivingModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_ObsDrMdl = 0.95;

const int NumCStateVar_ObsDrMdl = 2;  // number of continuous state variables
const int NumDState_ObsDrMdl = 8;     //number of discrete states
const int NumCObsVar_ObsDrMdl = 2;    // number of continuous observation variables
const int NumDObs_ObsDrMdl = 3;       //number of discrete observations
const int NumDControls_ObsDrMdl = 4;  // number of discrete controls

enum { ASC0 = 0, ASC1 = 1, ATC0 = 2, ATC1 = 3, DSC0 = 4, DSC1 = 5, DTC0 = 6, DTC1 = 7}; // q: AC0:(Attentive, Controller 0); AC1:(Attentive, Controller 1); DC0:(Distracted, Controller 0); DC1:(Distracted, Controller 1);
   //(q>>2: 0=Attentive or 1=Distracted), (q & 0x02: 0=Straight or 1=Turn), (q & 0x01: 0 = C0 or 1 = C1)
enum {V00 = 0, V01 = 1, V10 = 2, V11 = 3}; // sigma: V00:(Reminder off, Execute C0); V01:(Reminder off, Execute C1); V10:(Reminder on, Execute C0); V11:(Reminder on, Execute C1); 
   //((sigma>>1): 0 = Reminder off or 1 = Reminder on; (sigma & 0x01): 0 = Controller0 or 1 = Controller1)

ObsDrivingModel::ObsDrivingModel():Model(NumCStateVar_ObsDrMdl, NumDState_ObsDrMdl,NumCObsVar_ObsDrMdl, NumDObs_ObsDrMdl, NumDControls_ObsDrMdl, Discount_ObsDrMdl),
                    deltaT(1),noisemean(0), AttStraightNoiseStdDev(0.0361), AttTurnNoiseStdDev(0.0539), DisStraightNoiseStdDev(0.0548),
					 DisTurnNoiseStdDev(0.0678), AttCarDistNoiseStdDev(0.2555), DisCarDistNoiseStdDev(0.2337), AttTurnConst(0.0117), 
					 DisTurnConst(0.0065), AttRelSpd(-0.1767), DisRelSpd(-0.2012), c(0.25)
{ 
    double rewardcoefficient[NumDControls_ObsDrMdl][6] = {{0, 0, 0, 0, 1, 0}, //0 + 0x +0x^2 + 0xy + 0y + y^2
                                                          {0, 0, 0, 0, 1, -0.01},
                                                          {0, 0, 0, 0, 1, -0.01}, 
                                                          {0, 0, 0, 0, 1, -0.02} };
	double attentiverewardcoefficient[NumDControls_ObsDrMdl][6] = {{15, 0, 0, 0, 1, 0}, //0 + 0x +0x^2 + 0xy + 0y + y^2
                                                                   {15, 0, 0, 0, 1, -0.02},
                                                                   {15, 0, 0, 0, 1, -0.02},
                                                                   {15, 0, 0, 0, 1, -0.04} };								  
	vector<vector<double> > tmpvector(NumDState_ObsDrMdl, vector<double>(6, 0));

    for(int i =0; i<NumDControls_ObsDrMdl; i++){
		for(int j =0; j<NumDState_ObsDrMdl; j++) {
        	for(int k =0; k<6; k++){
				if(j>>2 == 0)
					tmpvector[j][k] = attentiverewardcoefficient[i][k];
				else
            		tmpvector[j][k] = rewardcoefficient[i][k];
        	}
		}
        RewardCoeff.push_back(tmpvector);
    }
};
          

DState ObsDrivingModel::sampleDState(const DState& q, const DControl& sigma) const{
    array<double,8> init = {this->getDStateTransProb(ASC0, q, sigma), this->getDStateTransProb(ASC1, q, sigma), 
                            this->getDStateTransProb(ATC0, q, sigma), this->getDStateTransProb(ATC1, q, sigma), 
                            this->getDStateTransProb(DSC0, q, sigma), this->getDStateTransProb(DSC1, q, sigma), 
                            this->getDStateTransProb(DTC0, q, sigma), this->getDStateTransProb(DTC1, q, sigma)  };

    discrete_distribution<int> distribution(init.begin(), init.end());

    return distribution(generator);
};

CState ObsDrivingModel::sampleCState(const DState& q_next, const CState& x_k) const {

    normal_distribution<double> attStraightNormalRand(this->noisemean, this->AttStraightNoiseStdDev);
	normal_distribution<double> attTurnNormalRand(this->noisemean, this->AttTurnNoiseStdDev);
    normal_distribution<double> disStraightNormalRand(this->noisemean, this->DisStraightNoiseStdDev);
	normal_distribution<double> disTurnNormalRand(this->noisemean, this->DisTurnNoiseStdDev);
	
	normal_distribution<double> attCarDistNormalRand(this->noisemean, this->AttCarDistNoiseStdDev);
	normal_distribution<double> disCarDistNormalRand(this->noisemean, this->DisCarDistNoiseStdDev);
	
	
    double attStraightNoise = attStraightNormalRand(generator);
	double attTurnNoise = attTurnNormalRand(generator);
    double disStraightNoise = disStraightNormalRand(generator); 
	double disTurnNoise = disTurnNormalRand(generator); 
	
	double attCarDistNoise = attCarDistNormalRand(generator);
	double disCarDistNoise = disCarDistNormalRand(generator); 
	   
    CState x_next;
	switch(q_next){
		case ASC0:
			x_next.push_back(x_k[0] + attStraightNoise);
			x_next.push_back(x_k[1] + AttRelSpd + attCarDistNoise);
			break;
		
		case ASC1:
			x_next.push_back(x_k[0] + attStraightNoise);
			x_next.push_back(x_k[1] + AttRelSpd + c + attCarDistNoise);
			break;
		
		case ATC0:
			x_next.push_back(x_k[0] + AttTurnConst + attTurnNoise);
			x_next.push_back(x_k[1] + AttRelSpd + attCarDistNoise);
			break;
		
		case ATC1:
			x_next.push_back(x_k[0] + AttTurnConst + attTurnNoise);
			x_next.push_back(x_k[1] + AttRelSpd + c + attCarDistNoise);
			break;
		
		case DSC0:
			x_next.push_back(x_k[0] + disStraightNoise);
			x_next.push_back(x_k[1] + DisRelSpd + disCarDistNoise);
			break;
		
		case DSC1:
			x_next.push_back(x_k[0] + disStraightNoise);
			x_next.push_back(x_k[1] + DisRelSpd + c + disCarDistNoise);
			break;
        	
		case DTC0:
			x_next.push_back(x_k[0] + DisTurnConst + disTurnNoise);
			x_next.push_back(x_k[1] + DisRelSpd + disCarDistNoise);
			break;
    		
		case DTC1:
			x_next.push_back(x_k[0] + DisTurnConst + disTurnNoise);
			x_next.push_back(x_k[1] + DisRelSpd + c + disCarDistNoise);
			break;
			
		default:
        	printf("q_next out of domain\n");
        	exit(1);
	}
    
    return x_next;
};

DObs ObsDrivingModel::sampleDObs(const DState& q_next) const {
	double ObsProb[3][2] = { {0.7617, 0.0145},
							 {0.2225, 0.42},
							 {0.0158, 0.5655} };
							
	array<double,3> init = {ObsProb[1][q_next>>2], ObsProb[2][q_next>>2], ObsProb[3][q_next>>2]};

	discrete_distribution<int> distribution(init.begin(), init.end());
	
	return distribution(generator);
    // bernoulli_distribution bernlRand(1 - this->obserr);
    // if(bernlRand(generator))
    //     return q_next>>1;
    // else
    //     return ((q_next>>1) == 0)? 1:0;
};
          

double ObsDrivingModel::getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const {
	double difference[2];
	double p1, p2;
	switch(q_next){
		case ASC0:
			difference[0] = x_next[0] - x_k[0];
			difference[1] = x_next[1] - x_k[1] - AttRelSpd;
			p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
			p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
        	return p1*p2;
		
		case ASC1:
        	difference[0] = x_next[0] - x_k[0];
			difference[1] = x_next[1]  -x_k[1] - AttRelSpd - c;
		    p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
			p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
        	return p1*p2;
		
		case ATC0:
			difference[0] = x_next[0] - x_k[0] - AttTurnConst;
			difference[1] = x_next[1] - x_k[1] - AttRelSpd;
			p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
			p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
    		return p1*p2;
		
		case ATC1:
			difference[0] = x_next[0] - x_k[0] - AttTurnConst;
			difference[1] = x_next[1] - x_k[1] - AttRelSpd - c;
			p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
			p2 = 1.0/(AttCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev));
			return p1*p2;
		
		case DSC0:
        	difference[0] = x_next[0] - x_k[0];
			difference[1] = x_next[1] - x_k[1] - DisRelSpd;
			p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
			p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
        	return p1*p2;
		
		case DSC1:
        	difference[0] = x_next[0] -x_k[0];
			difference[1] = x_next[1] -x_k[1]- DisRelSpd -c;
			p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
			p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
        	return p1*p2;
		
		case DTC0:
    		difference[0] = x_next[0] - x_k[0] - DisTurnConst;
			difference[1] = x_next[1] - x_k[1] - DisRelSpd;
			p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
			p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
    		return p1*p2;
		
		case DTC1:
			difference[0] = x_next[0] - x_k[0] - DisTurnConst;
			difference[1] = x_next[1] - x_k[1] - DisRelSpd - c;
			p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[0]-noisemean)*(difference[0]-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
			p2 = 1.0/(DisCarDistNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference[1]-noisemean)*(difference[1]-noisemean)/(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev));
			return p1*p2;
		
		default:
        	printf("q_next out of domain\n");
        	exit(1);
		
	}
    
};

double ObsDrivingModel::getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& sigma_k) const {
    double sigma0[2][2] = { {0.95, 0.05}, 
                            {0.05, 0.95} };
    double sigma1[2][2] = { {0.95, 0.8},
                            {0.05, 0.2}};
	double P_att_S2T = 0.0377;
	double P_dis_S2T = 0.2797; 
    
	double transprob_sigma0[4][4] = { { sigma0[0][0]*(1-P_att_S2T), 0           , sigma0[0][1]             , 0            }, 
									  { sigma0[0][0]*P_att_S2T    , sigma0[0][0], 0                        , sigma0[0][1] },
								      { sigma0[1][0]              , 0           , sigma0[1][1]*(1-P_dis_S2T), 0            },
								      { 0                         , sigma0[1][0], sigma0[1][1]*P_dis_S2T    , sigma0[1][1] }   };
									  
	double transprob_sigma1[4][4] = { { sigma1[0][0]*(1-P_att_S2T), 0           , sigma1[0][1]             , 0            }, 
									  { sigma1[0][0]*P_att_S2T    , sigma1[0][0], 0                        , sigma1[0][1] },
								      { sigma1[1][0]              , 0           , sigma1[1][1]*(1-P_dis_S2T), 0            },
								      { 0                         , sigma1[1][0], sigma1[1][1]*P_dis_S2T    , sigma1[1][1] }   };
    if((sigma_k>>1) == 0) // (sigma_k == V00) || (sigma_k == V01)
    {
        return transprob_sigma0[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
    else // (sigma_k == V10) || (sigma_k == V11)
    {
        return transprob_sigma1[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
};


double ObsDrivingModel::getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const {
	double ObsProb[3][2] = { {0.7617, 0.0145},
							 {0.2225, 0.42},
							 {0.0158, 0.5655} };
							
	return ObsProb[zq_k][q_k>>2];
};

CState ObsDrivingModel::getNextCStateNoNoise(const DState& q_next, const CState& x_k) const{
    CState x_next;
	
	switch(q_next){
		case ASC0:
			x_next.push_back(x_k[0]);
			x_next.push_back(x_k[1] + AttRelSpd);
			break;
		
		case ASC1:
			x_next.push_back(x_k[0]);
			x_next.push_back(x_k[1] + AttRelSpd+c);
			break;
		
		case ATC0:
			x_next.push_back(x_k[0]+AttTurnConst);
			x_next.push_back(x_k[1] + AttRelSpd);
			break;
		
		case ATC1:
			x_next.push_back(x_k[0]+AttTurnConst);
			x_next.push_back(x_k[1] + AttRelSpd+c);
			break;
		
		case DSC0:
			x_next.push_back(x_k[0]);
			x_next.push_back(x_k[1] + DisRelSpd);
			break;
		
		case DSC1:
			x_next.push_back(x_k[0]);
			x_next.push_back(x_k[1] + DisRelSpd+c);
			break;
        	
		case DTC0:
			x_next.push_back(x_k[0] + DisTurnConst);
			x_next.push_back(x_k[1] + DisRelSpd);
			break;
    		
		case DTC1:
			x_next.push_back(x_k[0] + DisTurnConst);
			x_next.push_back(x_k[1] + DisRelSpd+c);
			break;
			
		default:
        	printf("q_next out of domain\n");
        	exit(1);
	}
	
    return x_next;
};

vector<double> ObsDrivingModel::get1stDerivative(const DState& q, const CState& x) const {
    vector<double> firstderivative;
	
	firstderivative.push_back(1);
	firstderivative.push_back(0);
	firstderivative.push_back(0);
	firstderivative.push_back(1);
	
	return firstderivative;
};

vector<double> ObsDrivingModel::get2ndDerivative(const DState& q, const CState& x) const{
    
	return vector<double>(1, 0);
};


double ObsDrivingModel::getReward(DState const& q, CState const& x, DControl const& sigma) const {
	
	return RewardCoeff[sigma][q][0] + RewardCoeff[sigma][q][1]*x[0] + RewardCoeff[sigma][q][2]*x[0]*x[0] +
		   RewardCoeff[sigma][q][3]*x[0]*x[1] + RewardCoeff[sigma][q][4]*x[1] + RewardCoeff[sigma][q][5]*x[1]*x[1];
};

vector<vector<vector<double> > >  ObsDrivingModel::getRewardCoeff() const {
    return RewardCoeff;
};

vector<vector<double> > ObsDrivingModel::getCovariance() const {
	vector<vector<double> > covariance;
	
	for(DState q =0; q<NumDState_ObsDrMdl; q++) {
		
		vector<double> cov_tmp;
		
		if (q>>1 ==0 ){ //AS
			cov_tmp.push_back(AttStraightNoiseStdDev*AttStraightNoiseStdDev);
			cov_tmp.push_back(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev);
		}
		else if(q>>1 ==1 ){ //AT
			cov_tmp.push_back(AttTurnNoiseStdDev*AttTurnNoiseStdDev);
			cov_tmp.push_back(AttCarDistNoiseStdDev*AttCarDistNoiseStdDev);
		}
		else if(q>>1 == 2){ //DS
			cov_tmp.push_back(DisStraightNoiseStdDev*DisStraightNoiseStdDev);
			cov_tmp.push_back(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev);
		}
		else{ //DT
			cov_tmp.push_back(DisTurnNoiseStdDev*DisTurnNoiseStdDev);
			cov_tmp.push_back(DisCarDistNoiseStdDev*DisCarDistNoiseStdDev);
		}
		
		covariance.push_back(cov_tmp);
	}
	
	return covariance;
}

double ObsDrivingModel::getCost(const DState& q, const CState& x, const DControl& sigma) const {
    double R_sigma1[2] = {0, 5};
    double R_sigma2[2] = {0, 5};
    return x[0]*x[0] + R_sigma1[sigma>>1] + R_sigma2[sigma&0x01];
};

double ObsDrivingModel::sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next[0] = "<<x_next[0]<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k)* this->getCStateTransProb(x_next, q_next, x_k) * this->getDiscreteObsProb(q_next, obs_out);
};

























