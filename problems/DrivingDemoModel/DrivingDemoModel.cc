#include "DrivingDemoModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_DrDemoMdl = 0.95;

const int NumCStateVar_DrDemoMdl = 1;  // number of continuous state variables
const int NumDState_DrDemoMdl = 8;     //number of discrete states
const int NumCObsVar_DrDemoMdl = 1;    // number of continuous observation variables
const int NumDObs_DrDemoMdl = 3;       //number of discrete observations
const int NumDControls_DrDemoMdl = 4;  // number of discrete controls

enum { ASC0 = 0, ASC1 = 1, ATC0 = 2, ATC1 = 3, DSC0 = 4, DSC1 = 5, DTC0 = 6, DTC1 = 7}; // q: AC0:(Attentive, Controller 0); AC1:(Attentive, Controller 1); DC0:(Distracted, Controller 0); DC1:(Distracted, Controller 1);
   //(q>>2: 0=Attentive or 1=Distracted), (q & 0x02: 0=Straight or 1=Turn), (q & 0x01: 0 = C0 or 1 = C1)
enum {V00 = 0, V01 = 1, V10 = 2, V11 = 3}; // sigma: V00:(Reminder off, Execute C0); V01:(Reminder off, Execute C1); V10:(Reminder on, Execute C0); V11:(Reminder on, Execute C1); 
   //((sigma>>1): 0 = Reminder off or 1 = Reminder on; (sigma & 0x01): 0 = Controller0 or 1 = Controller1)

DrivingDemoModel::DrivingDemoModel():Model(NumCStateVar_DrDemoMdl, NumDState_DrDemoMdl,NumCObsVar_DrDemoMdl, NumDObs_DrDemoMdl, NumDControls_DrDemoMdl, Discount_DrDemoMdl),
                    noisemean(0), AttStraightNoiseStdDev(0.05), AttTurnNoiseStdDev(0.05), DisStraightNoiseStdDev(0.05),
					DisTurnNoiseStdDev(0.05), DisStraightConst(0.03), AttTurnConst(0.0117), DisTurnConst(0.0065), a(0.0432)
					//AttStraightNoiseStdDev(0.0179), AttTurnNoiseStdDev(0.0539), DisStraightNoiseStdDev(0.0179),
					//DisTurnNoiseStdDev(0.0678), AttTurnConst(0.0117), DisTurnConst(0.0065), a(0.0012)
					//AttStraightNoiseStdDev(0.2216), AttTurnNoiseStdDev(0.0539), DisStraightNoiseStdDev(0.1884),
					 //DisTurnNoiseStdDev(0.0678), AttTurnConst(0.0117), DisTurnConst(0.0065), a(0.0432)
{ 
	const int coeflength = 3;
    double rewardcoefficient[NumDControls_DrDemoMdl][coeflength] = {{50, 0, -1}, //0 + 0x +0x^2 + 0xy + 0y + y^2
                                                          			{49, 0, -1},
                                                          		  	{45, 0, -1}, 
                                                          		  	{44, 0, -1} };
	double attturnrewardcoefficient[NumDControls_DrDemoMdl][coeflength] = {{50, 0, 0}, //0 + 0x +0x^2 + 0xy + 0y + y^2
                                                                  		   {49, 0, 0},
                                                                  		   {45, 0, 0},
                                                                   		   {44, 0, 0} };								  
	vector<vector<double> > tmpvector(NumDState_DrDemoMdl, vector<double>(3, 0));

    for(int i =0; i<NumDControls_DrDemoMdl; i++){
		for(int j =0; j<NumDState_DrDemoMdl; j++) {
        	for(int k =0; k<coeflength; k++){
				if(j>>1 == 1)
					tmpvector[j][k] = attturnrewardcoefficient[i][k];
				else
            		tmpvector[j][k] = rewardcoefficient[i][k];
        	}
		}
        RewardCoeff.push_back(tmpvector);
    }
};
          

DState DrivingDemoModel::sampleDState(const DState& q, const DControl& sigma) const{
    array<double,8> init = {this->getDStateTransProb(ASC0, q, sigma), this->getDStateTransProb(ASC1, q, sigma), 
                            this->getDStateTransProb(ATC0, q, sigma), this->getDStateTransProb(ATC1, q, sigma), 
                            this->getDStateTransProb(DSC0, q, sigma), this->getDStateTransProb(DSC1, q, sigma), 
                            this->getDStateTransProb(DTC0, q, sigma), this->getDStateTransProb(DTC1, q, sigma)  };

    discrete_distribution<int> distribution(init.begin(), init.end());

    return distribution(generator);
};

CState DrivingDemoModel::sampleCState(const DState& q_next, const CState& x_k) const {

    normal_distribution<double> attStraightNormalRand(this->noisemean, this->AttStraightNoiseStdDev);
	normal_distribution<double> attTurnNormalRand(this->noisemean, this->AttTurnNoiseStdDev);
    normal_distribution<double> disStraightNormalRand(this->noisemean, this->DisStraightNoiseStdDev);
	normal_distribution<double> disTurnNormalRand(this->noisemean, this->DisTurnNoiseStdDev);

	
	
    double attStraightNoise = attStraightNormalRand(generator);
	double attTurnNoise = attTurnNormalRand(generator);
    double disStraightNoise = disStraightNormalRand(generator); 
	double disTurnNoise = disTurnNormalRand(generator); 
	   
    CState x_next;
	switch(q_next){
		case ASC0:
			x_next.push_back(x_k[0] - a*x_k[0] + attStraightNoise);
			break;
		
		case ASC1:
			x_next.push_back(x_k[0] - 2*a*x_k[0] + attStraightNoise);
			break;
		
		case ATC0:
			x_next.push_back(x_k[0] + AttTurnConst + attTurnNoise);
			break;
		
		case ATC1:
			x_next.push_back(x_k[0] - a*x_k[0] + AttTurnConst + attTurnNoise);
			break;
		
		case DSC0:
			x_next.push_back(x_k[0] + (x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst +disStraightNoise);
			break;
		
		case DSC1:
			x_next.push_back(x_k[0] + (x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst - a*x_k[0] + disStraightNoise);
			break;
        	
		case DTC0:
			x_next.push_back(x_k[0] + DisTurnConst + disTurnNoise);
			break;
    		
		case DTC1:
			x_next.push_back(x_k[0] - a*x_k[0] + DisTurnConst + disTurnNoise);
			break;
			
		default:
        	printf("q_next out of domain\n");
        	exit(1);
	}
    
    return x_next;
};

DObs DrivingDemoModel::sampleDObs(const DState& q_next) const {
	double ObsProb[3][4] = { {0.5, 0.1, 0.1, 0.4},
							 {0.4, 0.8, 0.4, 0.1}, 
						     {0.1, 0.1, 0.5, 0.5} };
							
	array<double,3> init = {ObsProb[1][q_next>>1], ObsProb[2][q_next>>1], ObsProb[3][q_next>>1]};

	discrete_distribution<int> distribution(init.begin(), init.end());
	
	return distribution(generator);

};
          

double DrivingDemoModel::getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const {
	double difference;
	double p1;
	switch(q_next){
		case ASC0:
			difference = (x_next[0] - x_k[0]) - (-a*x_k[0]);
			p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
        	return p1;
		
		case ASC1:
        	difference = (x_next[0] - x_k[0]) - (-2*a*x_k[0]);
		    p1 = 1.0/(AttStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(AttStraightNoiseStdDev*AttStraightNoiseStdDev));
        	return p1;
		
		case ATC0:
			difference = x_next[0] - x_k[0] - AttTurnConst;
			p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
    		return p1;
		
		case ATC1:
			difference = x_next[0] - x_k[0] - AttTurnConst - (-a*x_k[0]);
			p1 = 1.0/(AttTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(AttTurnNoiseStdDev*AttTurnNoiseStdDev));
			return p1;
		
		case DSC0:
        	difference = x_next[0] - x_k[0] - ((x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst);
			p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
        	return p1;
		
		case DSC1:
        	difference = x_next[0] -x_k[0] - ((x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst) - (-a*x_k[0]);
			p1 = 1.0/(DisStraightNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(DisStraightNoiseStdDev*DisStraightNoiseStdDev));
        	return p1;
		
		case DTC0:
    		difference = x_next[0] - x_k[0] - DisTurnConst;
			p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
    		return p1;
		
		case DTC1:
			difference = x_next[0] - x_k[0] - DisTurnConst - (-a*x_k[0]);
			p1 = 1.0/(DisTurnNoiseStdDev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(DisTurnNoiseStdDev*DisTurnNoiseStdDev));
			return p1;
		
		default:
        	printf("q_next out of domain\n");
        	exit(1);
		
	}
    
};

double DrivingDemoModel::getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& sigma_k) const {
    double sigma0[2][2] = { {0.95, 0.05}, 
                            {0.05, 0.95} };
    double sigma1[2][2] = { {0.95, 0.8},
                            {0.05, 0.2}};
	double P_att_S2T = 0.0377;
	double P_dis_S2T = 0.0377; //0.2797; 
	
	double transprob_sigma0[4][4] = { { sigma0[0][0]*(1-P_att_S2T), sigma0[0][0]*P_att_S2T    , sigma0[0][1]*(1-P_dis_S2T), sigma0[0][1]*P_dis_S2T    },
									  { sigma0[0][0]*P_att_S2T    , sigma0[0][0]*(1-P_att_S2T), sigma0[0][1]*P_dis_S2T    , sigma0[0][1]*(1-P_dis_S2T)},
								      { sigma0[1][0]*(1-P_att_S2T), sigma0[1][0]*P_att_S2T    , sigma0[1][1]*(1-P_dis_S2T), sigma0[1][1]*P_dis_S2T    },
								      { sigma0[1][0]*P_att_S2T    , sigma0[1][0]*(1-P_att_S2T), sigma0[1][1]*P_dis_S2T    , sigma0[1][1]*(1-P_dis_S2T)}   };

	double transprob_sigma1[4][4] = { { sigma1[0][0]*(1-P_att_S2T), sigma1[0][0]*P_att_S2T    , sigma1[0][1]*(1-P_dis_S2T), sigma1[0][1]*P_dis_S2T    },
									  { sigma1[0][0]*P_att_S2T    , sigma1[0][0]*(1-P_att_S2T), sigma1[0][1]*P_dis_S2T    , sigma1[0][1]*(1-P_dis_S2T)},
								      { sigma1[1][0]*(1-P_att_S2T), sigma1[1][0]*P_att_S2T    , sigma1[1][1]*(1-P_dis_S2T), sigma1[1][1]*P_dis_S2T    },
								      { sigma1[1][0]*P_att_S2T    , sigma1[1][0]*(1-P_att_S2T), sigma1[1][1]*P_dis_S2T    , sigma1[1][1]*(1-P_dis_S2T)}   };
    
	// double transprob_sigma0[4][4] = { { sigma0[0][0]*(1-P_att_S2T), 0           , sigma0[0][1]             , 0            },
	// 								  { sigma0[0][0]*P_att_S2T    , sigma0[0][0], 0                        , sigma0[0][1] },
	// 							      { sigma0[1][0]              , 0           , sigma0[1][1]*(1-P_dis_S2T), 0            },
	// 							      { 0                         , sigma0[1][0], sigma0[1][1]*P_dis_S2T    , sigma0[1][1] }   };
	//
	// double transprob_sigma1[4][4] = { { sigma1[0][0]*(1-P_att_S2T), 0           , sigma1[0][1]             , 0            },
	// 								  { sigma1[0][0]*P_att_S2T    , sigma1[0][0], 0                        , sigma1[0][1] },
	// 							      { sigma1[1][0]              , 0           , sigma1[1][1]*(1-P_dis_S2T), 0            },
	// 							      { 0                         , sigma1[1][0], sigma1[1][1]*P_dis_S2T    , sigma1[1][1] }   };
    if((sigma_k>>1) == 0) // (sigma_k == V00) || (sigma_k == V01)
    {
        return transprob_sigma0[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
    else // (sigma_k == V10) || (sigma_k == V11)
    {
        return transprob_sigma1[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
};


double DrivingDemoModel::getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const {
	double ObsProb[3][4] = { {0.8, 0.1, 0.1, 0.4},
							 {0.1, 0.8, 0.4, 0.1}, 
						     {0.1, 0.1, 0.5, 0.5} };
							
	return ObsProb[zq_k][q_k>>1];
};

CState DrivingDemoModel::getNextCStateNoNoise(const DState& q_next, const CState& x_k) const{
    CState x_next;
	
	switch(q_next){
		case ASC0:
			x_next.push_back(x_k[0]-a*x_k[0]);
			break;
		
		case ASC1:
			x_next.push_back(x_k[0]-2*a*x_k[0]);
			break;
		
		case ATC0:
			x_next.push_back(x_k[0] + AttTurnConst);
			break;
		
		case ATC1:
			x_next.push_back(x_k[0] + AttTurnConst - a*x_k[0]);
			break;
		
		case DSC0:
			x_next.push_back(x_k[0]+ (x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst);
			break;
		
		case DSC1:
			x_next.push_back(x_k[0] + (x_k[0]>0)*DisStraightConst - (x_k[0]<0)*DisStraightConst - a*x_k[0]);
			break;
        	
		case DTC0:
			x_next.push_back(x_k[0] + DisTurnConst);
			break;
    		
		case DTC1:
			x_next.push_back(x_k[0] + DisTurnConst - a*x_k[0]);
			break;
			
		default:
        	printf("q_next out of domain\n");
        	exit(1);
	}
	
    return x_next;
};

vector<double> DrivingDemoModel::get1stDerivative(const DState& q, const CState& x) const {
    vector<double> firstderivative;
	
    CState x_next;
	
	switch(q){
		case ASC0:
			firstderivative.push_back(1-a);
			break;
		
		case ASC1:
			firstderivative.push_back(1-2*a);
			break;
		
		case ATC0:
			firstderivative.push_back(1);
			break;
		
		case ATC1:
			firstderivative.push_back(1-a);
			break;
		
		case DSC0:
			firstderivative.push_back(1);
			break;
		
		case DSC1:
			firstderivative.push_back(1-a);
			break;
        	
		case DTC0:
			firstderivative.push_back(1);
			break;
    		
		case DTC1:
			firstderivative.push_back(1-a);
			break;
			
		default:
        	printf("q_next out of domain\n");
        	exit(1);
	}
	
	return firstderivative;
};

vector<double> DrivingDemoModel::get2ndDerivative(const DState& q, const CState& x) const{
    
	return vector<double>(1, 0);
};


double DrivingDemoModel::getReward(DState const& q, CState const& x, DControl const& sigma) const {
	
	return RewardCoeff[sigma][q][0] + RewardCoeff[sigma][q][1]*x[0] + RewardCoeff[sigma][q][2]*x[0]*x[0];
};

vector<vector<vector<double> > >  DrivingDemoModel::getRewardCoeff() const {
    return RewardCoeff;
};

vector<vector<double> > DrivingDemoModel::getCovariance() const {
	vector<vector<double> > covariance;
	
	for(DState q =0; q<NumDState_DrDemoMdl; q++) {
		
		vector<double> cov_tmp;
		
		if (q>>1 == 0 ){ //AS
			cov_tmp.push_back(AttStraightNoiseStdDev*AttStraightNoiseStdDev);
		}
		else if(q>>1 ==1 ){ //AT
			cov_tmp.push_back(AttTurnNoiseStdDev*AttTurnNoiseStdDev);
		}
		else if(q>>1 == 2){ //DS
			cov_tmp.push_back(DisStraightNoiseStdDev*DisStraightNoiseStdDev);
		}
		else{ //DT
			cov_tmp.push_back(DisTurnNoiseStdDev*DisTurnNoiseStdDev);
		}
		
		covariance.push_back(cov_tmp);
	}
	
	return covariance;
}

double DrivingDemoModel::getCost(const DState& q, const CState& x, const DControl& sigma) const {
    double R_sigma1[2] = {0, 5};
    double R_sigma2[2] = {0, 5};
    return x[0]*x[0] + R_sigma1[sigma>>1] + R_sigma2[sigma&0x01];
};

double DrivingDemoModel::sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next[0] = "<<x_next[0]<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k)* this->getCStateTransProb(x_next, q_next, x_k) * this->getDiscreteObsProb(q_next, obs_out);
};

























