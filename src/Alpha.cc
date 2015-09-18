#include "Alpha.h"
#include "Utilities.h"
#include "random"
#include "iostream"

using namespace std;


Alpha::Alpha(int nDState, int nDObs, int nSamples, double discount_factor): numDState(nDState), numDObs(nDObs),
        numSamples(nSamples), gamma(discount_factor){
    
    vector<vector<double> > emptyvector(numDObs, vector<double>(numSamples, 0));
    
    for(int i =0; i<numDState; i++) {
        beta.push_back(emptyvector);
    }
    
};

void Alpha::setzx_sample(vector<CObs>& zx){
    zx_sample = zx;
}

/*
Alpha::~Alpha() {
    for(int i = 0; i<numDState; i++)
        delete [] beta[i];
        
    delete [] beta;
}
*/
/* Old alphavalue
double Alpha::AlphaValue(const Model& currModel, DState& q, CState& x) {
    double sum  = currModel.getReward(q, x, sigma);
    for(int i = 0; i<zx_sample.size(); i++) {
        double sum_particle = 0;
        for(int qq =0; qq<numDState; qq++) {
            sum_particle += beta[qq][i]*currModel.getCStateTransProb(zx_sample[i], qq, x)*currModel.getDStateTransProb(qq, q, sigma);
        }
        sum += sum_particle*gamma/numSamples;
    }
    
    return sum;
}
*/

/* Old calvalue
double Alpha::calvalue(const Model& currModel,Belief& b) {
    double sum  = 0;
    
    for(int i = 0; i<zx_sample.size(); i++) {
        double sum_qq = 0;
        for(int qq =0; qq<numDState; qq++) {
            double sum_q = 0;
            for(int q =0; q<numDState; q++) {
                sum_q += currModel.getCStateTransProb(zx_sample[i], qq, b.cstate)*currModel.getDStateTransProb(qq, q, sigma)*b.DStateProb[q];
            }
            sum_qq += beta[qq][i]*sum_q;
        }
        sum += sum_qq*gamma/numSamples;
    }
    
    for(int q = 0; q<currModel.getNumDState(); q++)
        sum += currModel.getReward(q, b.cstate, sigma)*b.DStateProb[q];
    
    return sum;
}
*/

double Alpha::initSigma(const Model& currModel, Belief& initBelief){
    double J_sigma;
    double J_star = -999999999; // for reward
//    double J_star = 1e10; //for cost
    for(DControl DCrl = 0; DCrl<currModel.getNumDControls(); DCrl++){
        J_sigma = 0;
        for(int q = 0; q<currModel.getNumDState(); q++){
//            J_sigma += currModel.getCost(q, initBelief.cstate, DCrl)*initBelief.DStateProb[q];    //for cost
            J_sigma += currModel.getReward(q, initBelief.cstate, DCrl)*initBelief.DStateProb[q]; //for reward
        }
        
        if(J_sigma>J_star){   // for reward
//        if(J_sigma < J_star) { // for cost
            J_star = J_sigma;
            sigma = DCrl;
        }
    }
    
    return J_star;
}

double Alpha::AlphaValue(const Model& currModel, DState& q, CState& x) {
    double sum  = currModel.getReward(q, x, sigma);
    for(int i = 0; i<zx_sample.size(); i++) {
        for(int zq = 0; zq<currModel.getNumDObs(); zq++) {
            for(int qq =0; qq<numDState; qq++) {
                sum += beta[qq][zq][i]*currModel.getCStateTransProb(zx_sample[i], qq, x)*currModel.getDStateTransProb(qq, q, sigma);
            }
        }
    }
    
    return sum;
}

double Alpha::calIntermediateValue(const Model& currModel,Belief& b, DControl& DCrl, DObs& zq, CState& zx) {
    
    double sum_qq = 0;
    for(int qq =0; qq<numDState; qq++) {
        double sum_q = 0;
        for(int q =0; q<numDState; q++) {
//            double Xtransitionprob = currModel.getCStateTransProb(zx, qq, b.cstate); //for debug
            sum_q += currModel.getCStateTransProb(zx, qq, b.cstate)*currModel.getDStateTransProb(qq, q, DCrl)*b.DStateProb[q];
        }
//        double alphavalue = this->AlphaValue(currModel, qq, zx); // for debug;
//        double omegavalue = currModel.getDiscreteObsProb(zq, qq); //for debug;
        
        sum_qq += this->AlphaValue(currModel, qq, zx)*currModel.getDiscreteObsProb(zq, qq)*sum_q;
    }
    
    return sum_qq;
}

double Alpha::calvalue(const Model& currModel,Belief& b) {
    double sum  = 0;
    
    for(int q = 0; q<currModel.getNumDState(); q++)
        sum += currModel.getReward(q, b.cstate, sigma)*b.DStateProb[q];
    
    for(int i = 0; i<zx_sample.size(); i++) {
        for(int qq =0; qq<numDState; qq++) {
            for(int zq = 0; zq<currModel.getNumDObs(); zq++) {
                double sum_q = 0;
                for(int q =0; q<numDState; q++) {
                    sum_q += currModel.getCStateTransProb(zx_sample[i], qq, b.cstate)*currModel.getDStateTransProb(qq, q, sigma)*b.DStateProb[q];
                }
                sum += beta[qq][zq][i]*sum_q;
            }
        }
    }
     
    return sum;
}

// This function should be modified, its not a general function!!!!!
void Alpha::sampleX_next(CState& meanx, vector<double>& stddev, vector<CObs>& zx_next, vector<double>& prob, vector<CObs>& zx_samples, double zxinterval){
    zx_next.clear();
    prob.clear();
//    std::normal_distribution<double> distribution(meanx[0], stddev[0]);
//    double interval = 10;
//    double minzx = -5;
//    std::uniform_real_distribution<double> distribution(meanx[0]-(interval/2), meanx[0]+(interval/2));
//    std::uniform_real_distribution<double> distribution(-5, 5);
    
//    CState cobstmp(meanx.size(), 0);
    for(int j =0; j<numSamples; j++) {
//        cobstmp[0] = distribution(generator);
//        cobstmp[0] = minzx + j*interval/(double)numSamples;
//        cobstmp[0] = zx_tmp_for_testing[j];
        zx_next.push_back(zx_samples[j]);
        prob.push_back(1.0/zxinterval);
//        prob.push_back( 1.0/(3*sqrt(2*PI))*exp(-0.5*(cobstmp[0])*(cobstmp[0])/(3*3)) );// calculate the probability of this sample;
        
//        prob.push_back( 1.0/(stddev[0]*sqrt(2*PI))*exp(-0.5*(cobstmp[0]-meanx[0])*(cobstmp[0]-meanx[0])/(stddev[0]*stddev[0])) );// calculate the probability of this sample;
    }
    
 //    for(int i = 1; i< meanx.size(); i++) {
 // //        std::normal_distribution<double> distribution(meanx[i], stddev[i]); //be careful if it is an actual normal distribution
 //         std::uniform_real_distribution<double> distribution(meanx[i]-2.5, meanx[i]+2.5);
 //         for(int j=0; j<numSamples; j++){
 //             zx_next[j][i] = distribution(generator);
 //             prob[j] *= 1.0/interval;
 // //            prob[j] *= 1.0/(stddev[0]*sqrt(2*PI))*exp(-0.5*(zx_next[j][i]-meanx[i])*(zx_next[j][i]-meanx[i])/(stddev[0]*stddev[0]));
 //         }
 //     }
    
}

// New backup
double Alpha::backup(const Model& currModel, AlphaSet& alphaset, Belief& currBelief, vector<CObs>& zx_samples, double zxinterval) {
    
    double indivmaxvalue;
    vector<vector<vector<int> > > optalpha;
    vector<vector<double> > eta(currModel.getNumDControls(), vector<double>(numSamples, 0));
    double* J_sigma = new double [currModel.getNumDControls()]();
    vector<CObs>* sampledzx = new vector<CObs> [currModel.getNumDControls()];
    
    DControl sigma_star;
    double J_star = -999999999; // for reward
//    double J_star = 1e10;     // for cost
    
    vector<vector<int> > emptyvector(currModel.getNumDObs(), vector<int>(numSamples, -1));
    for(int i =0; i<numDState; i++) {
        optalpha.push_back(emptyvector);
    }
    
    vector<double> stddev(currModel.getNumCStateVar(), 0.5);  // 0.5 not a fixed value!!!!!!!!
    //--------------------------------------End Initialization------------------------------------------
    
    //--------------------------------------Finding optimal sigma---------------------------------------
     
    for(DControl DCrl = 0; DCrl<currModel.getNumDControls(); DCrl++) {
//        cout<<"DCrl = " <<DCrl<<endl;
                
        J_sigma[DCrl] = 0;
        sampleX_next(currBelief.cstate, stddev, sampledzx[DCrl], eta[DCrl], zx_samples, zxinterval);
        
        for(int i = 0 ; i<numSamples; i++) {                    // sample observations
            if(eta[DCrl][i] != 0)
                eta[DCrl][i] = 1.0/eta[DCrl][i];
            else
                eta[DCrl][i] = 0;
                
            // if(eta[DCrl][i] > 500) {
            //     cout<<"large eta = "<<eta[DCrl][i]<<endl;
            // }
        }
        
//        cout<<"indivmax"<<endl;
        for(DObs zq = 0; zq<currModel.getNumDObs(); zq++) {
            for(int i =0; i<numSamples; i++) {    
                indivmaxvalue= -999999999; // for reward
//                indivmaxvalue = 1e10;    // for cost
                
                double currvalue;
                for(int j =0; j<alphaset.size(); j++) {
                    currvalue = alphaset[j].calIntermediateValue(currModel, currBelief, DCrl, zq, sampledzx[DCrl][i]);
                    if(currvalue > indivmaxvalue) {
                        indivmaxvalue = currvalue;
                        optalpha[DCrl][zq][i] = j;
                    }
                }
                J_sigma[DCrl] += indivmaxvalue*eta[DCrl][i];
                
//                cout<< indivmaxvalue<<"   "<<eta[DCrl][i]<<endl;
            }
        }
        
        J_sigma[DCrl] *= gamma/(double)numSamples;
        
        for(int i = 0; i<currModel.getNumDState(); i++)
            J_sigma[DCrl] += currModel.getReward(i, currBelief.cstate, DCrl)*currBelief.DStateProb[i];
            
        if(J_sigma[DCrl] > J_star){ // for reward 
//        if(J_sigma[DCrl] < J_star) { for cost
            J_star = J_sigma[DCrl];
            sigma_star = DCrl;
        }
    }
    
    this->sigma = sigma_star;
    this->zx_sample = sampledzx[sigma_star];
    //-------------------------------------End finding optimal sigma---------------------------------------------------
    
    //-------------------------------------Calculate beta--------------------------------------------------------------
    
    for(int i = 0; i<numSamples; i++) {
        for(DState qq = 0; qq<numDState; qq++ ){
            for(DObs zq = 0; zq<currModel.getNumDObs(); zq++) {
                beta[qq][zq][i] = gamma/(double)numSamples*alphaset[optalpha[sigma_star][zq][i]].AlphaValue(currModel, qq, zx_sample[i])*eta[sigma_star][i]*currModel.getDiscreteObsProb(zq, qq); 
            }
        }
    }
    
    
    delete [] sampledzx;
    delete [] J_sigma;
    
    return J_star;
    
}

/* Old backup
void Alpha::backup(const Model& currModel, AlphaSet& alphaset, Belief& currBelief) {
    
    vector<DState> q_sample = currBelief.sampleDState(numSamples);
    DState q_next;
    CState x_next;
    DObs obs_out;
    
    double** indivmaxvalue = new double* [currModel.getNumDControls()];
    int** optalpha = new int* [currModel.getNumDControls()];
    double** eta = new  double* [currModel.getNumDControls()];
    double* J_sigma = new double [currModel.getNumDControls()]();
    vector<DObs>* sampledzq = new vector<DObs> [currModel.getNumDControls()];
    vector<CObs>* sampledzx = new vector<CObs> [currModel.getNumDControls()];
    
    DControl sigma_star;
    double J_star = -999999999;
    
    for(int i =0; i<currModel.getNumDControls(); i++) {
        indivmaxvalue[i] = new double[numSamples]();
        optalpha[i] = new int[numSamples]();
        eta[i] = new double[numSamples]();
    }
    //-----End Initialization-----
     
    for(DControl DCrl = 0; DCrl<currModel.getNumDControls(); DCrl++) {
        
        vector<Belief> bset(numSamples, currBelief);
        
        J_sigma[DCrl] = 0;
        
        for(int i = 0 ; i<numSamples; i++) {                    // sample observations
            currModel.sample(q_sample[i], bset[i].cstate, DCrl, q_next, x_next, obs_out);
            sampledzq[DCrl].push_back(obs_out);
            sampledzx[DCrl].push_back(x_next);
            eta[DCrl][i] = bset[i].BeliefUpdate(currModel, DCrl, sampledzq[DCrl][i], sampledzx[DCrl][i]);
        }
        
        
        for(int i =0; i<numSamples; i++) {
        
            indivmaxvalue[DCrl][i]= -999999999;
            double currvalue;
            for(int j =0; j<alphaset.size(); j++) {
                currvalue = alphaset[j].calvalue(currModel, bset[i]);  //Out of index bound!!!
                if(currvalue > indivmaxvalue[DCrl][i]) {
                    indivmaxvalue[DCrl][i] = currvalue;
                    optalpha[DCrl][i] = j;
                }
                
            }
            J_sigma[DCrl] += gamma/numSamples*indivmaxvalue[DCrl][i];
        }
        
        for(int i = 0; i<currModel.getNumDState(); i++)
            J_sigma[DCrl] += currModel.getReward(i, currBelief.cstate, DCrl)*currBelief.DStateProb[i];
            
        if(J_sigma[DCrl] > J_star){
            J_star = J_sigma[DCrl];
            sigma_star = DCrl;
        }
    }
    
    this->sigma = sigma_star;
    this->zq_sample = sampledzq[sigma_star];
    this->zx_sample = sampledzx[sigma_star];
    
    for(int i = 0; i<numSamples; i++) {
        for(DState qq = 0; qq<numDState; qq++ ){
            beta[qq][i] = alphaset[optalpha[sigma_star][i]].AlphaValue(currModel, qq, zx_sample[i])*eta[sigma_star][i]*currModel.getDiscreteObsProb(zq_sample[i], qq); 
        }
    }
    
    
    for(int i =0; i<currModel.getNumDControls(); i++) {
        delete [] indivmaxvalue[i];
        delete [] optalpha[i];
        delete [] eta[i];
    }
    delete [] indivmaxvalue;
    delete [] optalpha;
    delete [] eta;
    delete [] sampledzq;
    delete [] sampledzx;
    delete J_sigma;
    
}
*/











