#include "NoObsDrivingModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_NoObsDrMdl = 0.95;

const int NumCStateVar_NoObsDrMdl = 1;  // number of continuous state variables
const int NumDState_NoObsDrMdl = 4;     //number of discrete states
const int NumCObsVar_NoObsDrMdl = 1;    // number of continuous observation variables
const int NumDObs_NoObsDrMdl = 3;       //number of discrete observations
const int NumDControls_NoObsDrMdl = 4;  // number of discrete controls

enum { AC0 = 0, AC1 = 1, DC0 = 2, DC1 = 3}; // q: AC0:(Awake, Controller 0); AC1:(Awake, Controller 1); DC0:(Drowsy, Controller 0); DC1:(Drowsy, Controller 1); 
enum {V00 = 0, V01 = 1, V10 = 2, V11 = 3}; // sigma: V00:(Reminder off, Execute C0); V01:(Reminder off, Execute C1); V10:(Reminder on, Execute C0); V11:(Reminder on, Execute C1);

NoObsDrivingModel::NoObsDrivingModel():Model(NumCStateVar_NoObsDrMdl, NumDState_NoObsDrMdl, NumCObsVar_NoObsDrMdl, NumDObs_NoObsDrMdl, NumDControls_NoObsDrMdl, Discount_NoObsDrMdl),
                    deltaT(1),noisemean(0), attentivenoisestddev(0.2216), distractednoisestddev(0.1884), a(0.0432)
{
    double rewardcoefficient[NumDControls_NoObsDrMdl][3] = {{50, 0, -1},
                                                        {47, 0, -1},
                                                        {46, 0, -1}, 
                                                        {43, 0, -1} };
									  
	vector<vector<double> > emptyvector(NumDState_NoObsDrMdl, vector<double>(3, 0));

    for(int i = 0; i<NumDControls_NoObsDrMdl; i++){
		for(int j =0; j<NumDState_NoObsDrMdl; j++) {
        	for(int k =0; k<3; k++){
            	emptyvector[j][k] = rewardcoefficient[i][k];
        	}
		}
        RewardCoeff.push_back(emptyvector);
    }
    
};
          

DState NoObsDrivingModel::sampleDState(const DState& q, const DControl& sigma) const{
    array<double,4> init = {this->getDStateTransProb(AC0, q, sigma), this->getDStateTransProb(AC1, q, sigma), 
                            this->getDStateTransProb(DC0, q, sigma), this->getDStateTransProb(DC1, q, sigma) };

    discrete_distribution<int> distribution(init.begin(), init.end());

    return distribution(generator);
};

CState NoObsDrivingModel::sampleCState(const DState& q_next, const CState& x) const {

    normal_distribution<double> awakenormalRand(this->noisemean, this->attentivenoisestddev);
    normal_distribution<double> drowsynormalRand(this->noisemean, this->distractednoisestddev);
    double awakenoise = awakenormalRand(generator);
    double drowsynoise = drowsynormalRand(generator);
    CState x_next;
    
    if(q_next == AC0) {
        x_next.push_back(x[0] + (this->deltaT)*(-a*x[0]+awakenoise));
//        cout<<"noise = "<<noise<<"   ";
    }
    else if(q_next == AC1) {
        x_next.push_back(x[0] + (this->deltaT)*( -2*a*x[0] + awakenoise));
//        cout<<"noise = "<<noise<<"   ";
    }
    else if(q_next == DC0) {
        x_next.push_back(x[0] + (this->deltaT)*drowsynoise);
//        cout<<"noise = "<<noise<<"   ";
    }
    else if(q_next == DC1) {
        x_next.push_back(x[0] + (this->deltaT)*( -a*x[0]+ drowsynoise));
//        cout<<"noise = "<<noise<<"   ";
    }
    
    return x_next;
};

DObs NoObsDrivingModel::sampleDObs(const DState& q_next) const {
	double ObsProb[3][2] = { {0.7617, 0.0145},
							 {0.2225, 0.42},
							 {0.0158, 0.5655} };
							
							
	array<double,3> init = {ObsProb[1][q_next>>1], ObsProb[2][q_next>>1], ObsProb[3][q_next>>1]};

	discrete_distribution<int> distribution(init.begin(), init.end());
	
	return distribution(generator);
    // bernoulli_distribution bernlRand(1 - this->obserr);
    // if(bernlRand(generator))
    //     return q_next>>1;
    // else
    //     return ((q_next>>1) == 0)? 1:0;
};
          

double NoObsDrivingModel::getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const {
    if(q_next == AC0) {
        double difference = (x_next[0] - x_k[0])/deltaT - (-a*x_k[0]);
        return 1.0/(attentivenoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(attentivenoisestddev*attentivenoisestddev));
    }
    else if(q_next == AC1) {
        double difference = (x_next[0] - x_k[0])/deltaT - (-2*a*x_k[0]);
        return 1.0/(attentivenoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(attentivenoisestddev*attentivenoisestddev));
    }
    else if(q_next == DC0) {
        double difference = (x_next[0] - x_k[0])/deltaT;
        return 1.0/(distractednoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(distractednoisestddev*distractednoisestddev));
    }
    else if(q_next == DC1) {
        double difference = (x_next[0] - x_k[0])/deltaT - (-a*x_k[0]);
        return 1.0/(distractednoisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(distractednoisestddev*distractednoisestddev));
    }
    else {
        printf("q_next out of domain\n");
        exit(1);
    }
};

double NoObsDrivingModel::getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& sigma_k) const {
    double sigma0[2][2] = { {0.95, 0.05}, 
                            {0.05, 0.95} };
    double sigma1[2][2] = { {0.95, 0.8},
                            {0.05, 0.2}};
    
    if((sigma_k>>1) == 0) // (sigma_k == V00) || (sigma_k == V01)
    {
        return sigma0[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
    else // (sigma_k == V10) || (sigma_k == V11)
    {
        return sigma1[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
};


double NoObsDrivingModel::getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const {
	double ObsProb[3][2] = { {0.7617, 0.0145},
							 {0.2225, 0.42},
							 {0.0158, 0.5655} };
							
	return ObsProb[zq_k][q_k>>1];
};

CState NoObsDrivingModel::getNextCStateNoNoise(const DState& q_next, const CState& x_k) const{
    CState x_next;
    
    if(q_next == AC0) {
        x_next.push_back(x_k[0] + (this->deltaT)*(-a*x_k[0]));
    }
    else if(q_next == AC1) {
        x_next.push_back(x_k[0] + (this->deltaT)*( -2*a*x_k[0] ));
    }
    else if(q_next == DC0) {
        x_next.push_back(x_k[0]);
    }
    else if(q_next == DC1) {
        x_next.push_back(x_k[0] + (this->deltaT)*( -a*x_k[0]));
    }

    return x_next;
};

vector<double> NoObsDrivingModel::get1stDerivative(const DState& q, const CState& x) const {
    
    if(q == AC0) {
        return vector<double>(1, 1+(this->deltaT)*(-a));
    }
    else if(q == AC1) {
        return vector<double>(1, 1+(this->deltaT)*(-2*a));
    }
    else if(q == DC0) {
        return vector<double>(1, 1);
    }
    else { //if(q_next == DC1) 
        return vector<double>(1, 1+(this->deltaT)*(-a));
    }
    
};

vector<double> NoObsDrivingModel::get2ndDerivative(const DState& q, const CState& x) const{
    
    if(q == AC0) {
         return vector<double>(1, 0);
     }
     else if(q == AC1) {
         return vector<double>(1, 0);
     }
     else if(q == DC0) {
         return vector<double>(1, 0);
     }
     else {  // if(q_next == DC1)
         return vector<double>(1, 0);
     }
    
};

vector<vector<double> > NoObsDrivingModel::getCovariance() const {
	vector<vector<double> > covariance;
	
	for(DState q =0; q<NumDState_NoObsDrMdl; q++) {
		vector<double> cov_tmp;
		if (q>>1 ==0 ){
			cov_tmp.push_back(attentivenoisestddev*attentivenoisestddev);
		}
		else {
			cov_tmp.push_back(distractednoisestddev*distractednoisestddev);
		}
		covariance.push_back(cov_tmp);
	}
	
	return covariance;
}


double NoObsDrivingModel::getReward(DState const& q, CState const& x, DControl const& sigma) const {
    //double R_sigma1[2] = {0,-3};
    //double R_sigma2[2] = {0,-3};
    //return (100 - (x[0]*x[0]))+ R_sigma1[sigma>>1] + R_sigma2[sigma&0x01];
	return RewardCoeff[sigma][q][0] + RewardCoeff[sigma][q][1]*x[0] + RewardCoeff[sigma][q][2]*x[0]*x[0];
};

vector<vector<vector<double> > >  NoObsDrivingModel::getRewardCoeff() const {
    return RewardCoeff;
};

double NoObsDrivingModel::getCost(const DState& q, const CState& x, const DControl& sigma) const {
    double R_sigma1[2] = {0, 5};
    double R_sigma2[2] = {0, 5};
    return x[0]*x[0] + R_sigma1[sigma>>1] + R_sigma2[sigma&0x01];
};

double NoObsDrivingModel::sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next[0] = "<<x_next[0]<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k)* this->getCStateTransProb(x_next, q_next, x_k) * this->getDiscreteObsProb(q_next, obs_out);
};

























