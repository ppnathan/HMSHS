#include "BeliefSet.h"
#include "Utilities.h"
#include <vector>
#include <cstdlib>     /* srand, rand */
#include <ctime>       /* time */
#include <random>
#include <iostream>
#include <fstream>

using namespace std;

const bool WriteSampleRecords = true;

Belief getbelief(const Model& currModel, const Belief& currbelief, const DControl& sigma_k, 
                 const DObs& zq_next, const CState& zx_next) {
    Belief b_next;
    b_next.cstate = zx_next;
    for (int i = 0; i < currModel.getNumDState(); i++) {
        double tmp = 0;
        for (int j = 0; j < currModel.getNumDState(); j++){
            tmp += currModel.getDStateTransProb(i, j, sigma_k) * currbelief.DStateProb[j];
        }
        b_next.DStateProb.push_back(currModel.getDiscreteObsProb(zq_next, i) * 
			                        currModel.getCStateTransProb(zx_next, i, currbelief.cstate) * 
									tmp );
//        cout<<currModel.getDiscreteObsProb(zq_next, i)<<"   "<<currModel.getCStateTransProb(zx_next, i, currbelief.cstate)<<"   "<<tmp<<endl;
    }
    /*
    for(int i =0; i<b_next.DStateProb.size(); i++)
        cout<<b_next.DStateProb[i]<<"  ";
    cout<<endl;
    */
    b_next.normalize();
    
    return b_next;
}


void BeliefSet::SampleBelief(const Model& currModel, const CState& x_init, const DState& q_init, 
                             const vector<double>& initQprob, int maxPath) {
    CState x_sample = x_init;
    DState q_sample = q_init;
    vector<double> prob_sample(initQprob);

    Belief b_sample(x_sample, prob_sample);
    
    bset.push_back(b_sample);

    uniform_int_distribution<int> uniformintRand;

    ofstream myfile;
    if (WriteSampleRecords) {
        myfile.open("OutFiles/samplerecords.txt");
        myfile << q_sample << "  ";
        for (int j = 0; j < x_sample.size(); j++) myfile << x_sample[j] << "  ";
        for (int j = 0; j < prob_sample.size(); j++) myfile << prob_sample[j] << "  ";
        myfile << q_sample << "  ";
    }

    for(int i = 0; i < numBeliefs - 1; i++) { // the first belief is initial belief
//        int sigma = uniformintRand(generator) % currModel.getNumDControls(); // generate random control;
		int sigma = 0; // Always no control
        DState q_next;
        CState x_next;
        DObs zq_next;
//        cout<<i<<"  ";
        currModel.sample(q_sample, x_sample, sigma, q_next, x_next, zq_next);
        b_sample = getbelief(currModel, b_sample, sigma, zq_next, x_next);
        bset.push_back(b_sample);
        
        if (WriteSampleRecords) {
            myfile << sigma << "\n";
            myfile << q_next << "  ";
            for(int j = 0; j < x_next.size(); j++) myfile << x_next[j] << "  ";
            for(int j = 0; j < b_sample.DStateProb.size(); j++) {
				myfile << b_sample.DStateProb[j] << "  ";
			}
            myfile<<zq_next<<"  ";
        }
        
        if (i % maxPath == 0) {
            x_sample = x_init;
            q_sample = q_init;
            b_sample.cstate = x_init;
            b_sample.DStateProb = prob_sample;
        }
        else {
            x_sample = x_next;
            q_sample = q_next;
        }
    }
    
    myfile.close();
}