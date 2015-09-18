#include "HRCModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_HRCMdl = 0.95;

const int NumCStateVar_HRCMdl = 4;  // number of continuous state variables
const int NumDState_HRCMdl = 4;     //number of discrete states
const int NumCObsVar_HRCMdl = 4;    // number of continuous observation variables
const int NumDObs_HRCMdl = 1;       //number of discrete observations
const int NumDControls_HRCMdl = 4;  // number of discrete controls
const int NumHtheta_HRCMdl = 8;
const double h_theta[] = {0, PI/4, PI/2, PI*3/4, PI, PI*5/4, PI*3/2, PI*7/4};

enum { H0R0 = 0, H0R1 = 1, H1R0 = 2, H1R1 = 3}; // q
enum {V00 = 0, V01 = 1, V10 = 2, V11 = 3}; // sigma {V00: (No suggestion, R0), V01: (No suggestion, R1), V10: (Suggestion, R0), V11: (Suggestion, R1)}

HRCModel::HRCModel():Model(NumCStateVar_HRCMdl, NumDState_HRCMdl,NumCObsVar_HRCMdl, NumDObs_HRCMdl, NumDControls_HRCMdl, Discount_HRCMdl),
                    deltaT(1),noisemean(0), noisestddev(0.3), c(0.3), v_h(0.3), v_r(0.3), Rgoal(100), beta(2), H_initpos(-5, -5), R_initpos(5, -5)
          {
              pos G1pos(-5, 5);
              pos G2pos(5, 5);
              goal.push_back(G1pos);
              goal.push_back(G2pos);
          }
          

vector<double> HRCModel::P_theta(int g, pos Hpos) const {
    vector<double> P_humanaction;
    pos nextpos;
    double dist, m, Qvalue, stepdiscount;
    double sumprob = 0;
    
    for(int i =0; i<NumHtheta_HRCMdl; i++){
        nextpos.x = Hpos.x + v_h*cos(h_theta[i])*deltaT;
        nextpos.y = Hpos.y + v_h*sin(h_theta[i])*deltaT;
        // cout<<"("<<nextpos.x<<","<<nextpos.y<<")  ";
        dist = sqrt((nextpos.x - goal[g].x)*(nextpos.x - goal[g].x) + (nextpos.y - goal[g].y)*(nextpos.y - goal[g].y));
        m = dist/v_h;
        // cout<<m<<"   ";
        stepdiscount = pow(Discount_HRCMdl, m);
        Qvalue = stepdiscount*Rgoal - c*(1-stepdiscount)/(1-Discount_HRCMdl);
        // cout<<Qvalue<<"  ";
        P_humanaction.push_back(exp(beta*Qvalue));
        sumprob += exp(beta*Qvalue);
    }
    // cout<<endl;
    if(sumprob ==0 ){
        printf("sumprob = 0\n");
        exit(1);
    }
    
    for(int i=0; i<NumHtheta_HRCMdl; i++) {
        P_humanaction[i] = P_humanaction[i]/sumprob;
        // cout<<P_humanaction[i]<<"   ";
    }
    // cout<<endl;
    
    
    
    return P_humanaction;
};

DState HRCModel::sampleDState(const DState& q, const DControl& sigma) const{
    array<double,4> init = {this->getDStateTransProb(H0R0, q, sigma), this->getDStateTransProb(H0R1, q, sigma), 
                            this->getDStateTransProb(H1R0, q, sigma), this->getDStateTransProb(H1R1, q, sigma) };

    discrete_distribution<int> distribution(init.begin(), init.end());

    return distribution(generator);
};

CState HRCModel::sampleCState(const DState& q_next, const CState& x) const {

    normal_distribution<double> normalRand(this->noisemean, this->noisestddev);
    double Hnoise_x = normalRand(generator);
    double Hnoise_y = normalRand(generator);
    double Rnoise_x = normalRand(generator);
    double Rnoise_y = normalRand(generator);
    
    pos Hpos_k(x[0], x[1]);
    // cout<<"g = "<<(q_next>>1)<<"  p_h = ("<<x[0]<<","<<x[1]<<")  "<<endl;
    vector<double> Ptheta_G = P_theta(q_next>>1, Hpos_k);
        
    array<double,NumHtheta_HRCMdl> init = {Ptheta_G[0], Ptheta_G[1], Ptheta_G[2], Ptheta_G[3], Ptheta_G[4], Ptheta_G[5], Ptheta_G[6], Ptheta_G[7]};
    // for(int i = 0; i<8; i++){
    //     cout<<Ptheta_G[i]<<"  ";
    // }
    // cout<<endl;
    discrete_distribution<int> distribution(init.begin(), init.end());
    int thetaidx = distribution(generator);
    CState x_next;
    
    int q_next_robot = q_next & 0x01;
    x_next.push_back(x[0] + (this->deltaT)*(v_h*cos(h_theta[thetaidx])+Hnoise_x));
    x_next.push_back(x[1] + (this->deltaT)*(v_h*sin(h_theta[thetaidx])+Hnoise_y));
    x_next.push_back(x[2] + (this->deltaT)*(((goal[q_next_robot].x - x[2])>0)*v_r - ((goal[q_next_robot].x - x[2])<0)*v_r + Rnoise_x));
    x_next.push_back(x[3] + (this->deltaT)*(((goal[q_next_robot].y - x[3])>0)*v_r - ((goal[q_next_robot].y - x[3])<0)*v_r + Rnoise_y));

    return x_next;
};

DObs HRCModel::sampleDObs(const DState& q_next) const {
    return 0;
};


          

double HRCModel::getCStateTransProb(CState const& x_next, DState const& q_next, CState const& x_k) const {
    
    pos Hpos_k(x_k[0], x_k[1]);
    vector<double> Ptheta_G0 = P_theta(0, Hpos_k);
    vector<double> Ptheta_G1 = P_theta(1, Hpos_k);
    double difference_x, difference_y, Pnoise_x, Pnoise_y;
    double Phumanpos = 0;
    
    int q_next_human = q_next >>1;
    int q_next_robot = q_next & 0x01;
    
    if(q_next_human == 0) {
        for(int i =0; i<NumHtheta_HRCMdl; i++){
            difference_x = (x_next[0] - x_k[0])/deltaT - v_h*cos(h_theta[i]);
            difference_y = (x_next[1] - x_k[1])/deltaT - v_h*sin(h_theta[i]);
            Pnoise_x = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_x-noisemean)*(difference_x-noisemean)/(noisestddev*noisestddev));
            Pnoise_y = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_y-noisemean)*(difference_y-noisemean)/(noisestddev*noisestddev));
            Phumanpos += Ptheta_G0[i]*Pnoise_x*Pnoise_y;
        }
    }
    else {
        for(int i =0; i<NumHtheta_HRCMdl; i++){
            difference_x = (x_next[0] - x_k[0])/deltaT - v_h*cos(h_theta[i]);
            difference_y = (x_next[1] - x_k[1])/deltaT - v_h*sin(h_theta[i]);
            Pnoise_x = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_x-noisemean)*(difference_x-noisemean)/(noisestddev*noisestddev));
            Pnoise_y = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_y-noisemean)*(difference_y-noisemean)/(noisestddev*noisestddev));
            Phumanpos += Ptheta_G1[i]*Pnoise_x*Pnoise_y;
        }
    }
        
    difference_x = (x_next[2] - x_k[2])/deltaT - ((goal[q_next_robot].x - x_k[2])>0)*v_r + ((goal[q_next_robot].x - x_k[2])<0)*v_r;
    difference_y = (x_next[3] - x_k[3])/deltaT - ((goal[q_next_robot].y - x_k[3])>0)*v_r + ((goal[q_next_robot].y - x_k[3])<0)*v_r;
    Pnoise_x = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_x-noisemean)*(difference_x-noisemean)/(noisestddev*noisestddev));
    Pnoise_y = 1.0/(noisestddev*sqrt(2*PI))*exp(-0.5*(difference_y-noisemean)*(difference_y-noisemean)/(noisestddev*noisestddev));
    double Probotpos = Pnoise_x*Pnoise_y;
    
    return Phumanpos*Probotpos;
    
};

double HRCModel::getDStateTransProb(DState const& q_next, DState const& q_k, DControl const& sigma_k) const {
    double sigma0[2][2] = { {1, 0}, 
                            {0, 1} };
    double sigma1[2][2] = { {0.5, 0.5},
                            {0.5, 0.5}};
    
    if((sigma_k>>1) == 0) // no suggestion
    {
        return sigma0[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
    else // suggestion
    {
        return sigma1[q_next>>1][q_k>>1]*((q_next & 0x01) == (sigma_k & 0x01));
    }
};


double HRCModel::getDiscreteObsProb(DObs const& zq_k, DState const& q_k) const {
    return 1;
};

double HRCModel::getReward(DState const& q, CState const& x, DControl const& sigma) const {
    double Rmin = 0;
    double Rmax = 500;
    double R_sigma1[2] = {0,-5};
    
    if(q == H0R0 || q==H1R1)
        return Rmin;
    else if(q == H0R1) {
        double G2Hdist = (x[0] - goal[0].x)*(x[0] - goal[0].x) + (x[1] - goal[0].y)*(x[1] - goal[0].y);
        double G2Rdist = (x[2] - goal[1].x)*(x[2] - goal[1].x) + (x[3] - goal[1].y)*(x[3] - goal[1].y);
        return Rmax - G2Hdist - G2Rdist - R_sigma1[sigma>>1];
        
    }
    else { //q == H1R0
        double G2Hdist = (x[0] - goal[1].x)*(x[0] - goal[1].x) + (x[1] - goal[1].y)*(x[1] - goal[1].y);
        double G2Rdist = (x[2] - goal[0].x)*(x[2] - goal[0].x) + (x[3] - goal[0].y)*(x[3] - goal[0].y);
        return Rmax - G2Hdist - G2Rdist + R_sigma1[sigma>>1];
    }
    
};

double HRCModel::getCost(const DState& q, const CState& x, const DControl& sigma) const {
    
    return 0;
};

double HRCModel::sample(const DState& q_k, const CState& x_k, const DControl& sigma_k, DState& q_next, CState& x_next, DObs& obs_out) const{
    
    q_next = sampleDState(q_k, sigma_k);
//    cout<<"q_next = "<<q_next<<"   ";
    x_next = sampleCState(q_next, x_k);
//    cout<<"x_next[0] = "<<x_next[0]<<"   ";
    obs_out = sampleDObs(q_next);   
//    cout<<"obs_out = "<<obs_out<<endl;
    
    return 1;//this->getDStateTransProb(q_next, q_k, sigma_k)* this->getCStateTransProb(x_next, q_next, x_k) * this->getDiscreteObsProb(q_next, obs_out);
};

























