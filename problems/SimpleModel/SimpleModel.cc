#include "SimpleModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

//const int seed_SM = 87192837;//time(0);
//std::default_random_engine generator_SM(seed_SM);

/**
   Constants and types used in corridor model.
*/
const double Discount_SimMdl = 0.95;

const int NumCStateVar_SimMdl = 1;  // number of continuous state variables
const int NumDState_SimMdl = 2;     //number of discrete states
const int NumCObsVar_SimMdl = 1;    // number of continuous observation variables
const int NumDObs_SimMdl = 2;       //number of discrete observations
const int NumDControls_SimMdl = 2;  // number of discrete controls


DState SimpleModel::sampleDState(const DState& q, const DControl& sigma) const{
    array<double,2> init = {this->getDStateTransProb(0, q, sigma), this->getDStateTransProb(1, q, sigma)};

    discrete_distribution<int> distribution(init.begin(), init.end());
    
    return distribution(generator);  
};

CState SimpleModel::sampleCState(const DState& q_next, const CState& x) const {
//    int seed = 1; //time(0);
//    default_random_engine generator(seed);
    normal_distribution<double> normalRand(this->noisemean, this->noisestddev);
    double noise = normalRand(generator);
    CState x_next;
    
    if(q_next == 0) {
        x_next.push_back(x[0] + (this->deltaT)*(-a*x[0]+noise));
//        cout<<"noise = "<<noise<<"   ";
    }
    else {
//        x_next.push_back(x[0] + (this->deltaT)*( (x[0]>0)*c  - (x[0]<0)*c+ noise));
        x_next.push_back(x[0] + (this->deltaT)*(2.0/(1+exp(-5*x[0])) - 1 + noise));
//        cout<<"noise = "<<noise<<"   ";
    }
    
    return x_next;
    
};

DObs SimpleModel::sampleDObs(const DState& q_next) const {
//    int seed = 2; //time(0);
//    default_random_engine generator(seed);
    bernoulli_distribution bernlRand(1 - this->obserr);
    if(bernlRand(generator))
        return q_next;
    else
        return (q_next == 0)? 1:0;
         
};

SimpleModel::SimpleModel():Model(NumCStateVar_SimMdl, NumDState_SimMdl,NumCObsVar_SimMdl, NumDObs_SimMdl, NumDControls_SimMdl, Discount_SimMdl),
                    deltaT(1),noisemean(0), noisestddev(0.5), c(1.0), a(1), obserr(0.1)
{
    double rewardcoefficient[NumDControls_SimMdl][3] = {{500, 0, -1},
                                                        {495, 0, -1} };
									  
	vector<vector<double> > emptyvector(NumDState_SimMdl, vector<double>(3, 0));

    for(int i =0; i<NumDControls_SimMdl; i++){
		for(int j =0; j<NumDState_SimMdl; j++) {
        	for(int k =0; k<3; k++){
            	emptyvector[j][k] = rewardcoefficient[i][k];
        	}
		}
        RewardCoeff.push_back(emptyvector);
    }
}

double SimpleModel::getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const {
    if(q_next == 0) {
        double difference = (x_next[0] - x_k[0])/deltaT - (-a*x_k[0]);
        return 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(noisestddev*noisestddev));
    }
    else if(q_next == 1) {
        double difference = (x_next[0] - x_k[0])/deltaT - (2.0*c/(1+exp(-5*x_k[0])) - c);
        return 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference-noisemean)*(difference-noisemean)/(noisestddev*noisestddev));
    }
    else {
        printf("q_next out of domain\n");
        exit(1);
    }
};

CState SimpleModel::getNextCStateNoNoise(const DState& q_next, const CState& x_k) const{
    CState x_next;

    if(q_next == 0) {
        x_next.push_back(x_k[0] + (this->deltaT)*(-a*x_k[0]));
    //        cout<<"noise = "<<noise<<"   ";
    }
    else {
//        x_next.push_back(x[0] + (this->deltaT)*( (x[0]>0)*c  - (x[0]<0)*c+ noise));
		        x_next.push_back(x_k[0] + (this->deltaT)*(2.0*c/(1+exp(-5*x_k[0])) - c));
//		x_next.push_back(x_k[0] + (this->deltaT)*( (x_k[0]>0)*c  - (x_k[0]<0)*c));
//        cout<<"noise = "<<noise<<"   ";
    }
    
    return x_next;
};

vector<double> SimpleModel::get1stDerivative(const DState& q, const CState& x) const {
    if(q == 0){
        return vector<double>(1, (1-(this->deltaT)*a));
    }
    else{
        return vector<double>( 1, 1+10.0*exp(-5*x[0])/((1+exp(-5*x[0]))*(1+exp(-5*x[0]))) );
		//return vector<double>(1, 1);
    }
    
};


vector<double> SimpleModel::get2ndDerivative(const DState& q, const CState& x) const {
    if(q == 0) {
        return vector<double>(1, 0);
    }
    else {
        //return -50*exp(-5*x[0])/((1+exp(-5*x[0]))*(1+exp(-5*x[0]))) + 100*exp(-10*x[0])/pow(1+exp(-5*x[0]), 3);
    	return vector<double>(1, 0);
	}
    
};

double SimpleModel::getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& sigma_k) const {
    double sigma0[2][2] = { {0.9, 0.1}, 
                            {0.1, 0.9} };
    double sigma1[2][2] = { {0.9, 0.8},
                            {0.1, 0.2}};
    
    if(sigma_k == 0)
        return sigma0[q_next][q_k];
    else
        return sigma1[q_next][q_k];
};

double SimpleModel::getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const {
    if(zq_k == q_k)
        return 1-obserr;
    else
        return obserr;
};

double SimpleModel::getReward(DState const& q, CState const& x, DControl const& sigma) const {
    double R_sigma[2] = {0,-5};
    return (500 - (x[0]*x[0]))+R_sigma[sigma];
};

vector<vector<vector<double> > >  SimpleModel::getRewardCoeff() const {
    return RewardCoeff;  
};

vector<vector<double> >SimpleModel::getCovariance() const {
	vector<vector<double> > covariance(2, vector<double>(1, noisestddev*noisestddev));
	return covariance;
}

double SimpleModel::getCost(const DState& q, const CState& x, const DControl& sigma) const {
    double R_sigma[2] = {0, 5};
    return x[0]*x[0]+ R_sigma[sigma];
}

double SimpleModel::sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next[0] = "<<x_next[0]<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k)* this->getCStateTransProb(x_next, q_next, x_k) * this->getDiscreteObsProb(q_next, obs_out);
}




















