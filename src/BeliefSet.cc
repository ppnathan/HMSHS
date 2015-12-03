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
//      cout << "[" << i << "]" << tmp << endl;
//      cout << "[" << i << "]" << currModel.getCStateTransProb(zx_next, i, currbelief.cstate) 
//           << endl;
        
        b_next.DStateProb.push_back(currModel.getDiscreteObsProb(zq_next, i) * 
                                    currModel.getCStateTransProb(zx_next, i, currbelief.cstate) * 
                                    tmp );
    }
    /*
    for(int i =0; i<b_next.DStateProb.size(); i++)
        cout<<b_next.DStateProb[i]<<"  ";
    cout<<endl;
    */
    b_next.normalize();
    
    return b_next;
}

/*
Abstract:  Sampling beliefs and writing them to file "OutFiles/samplerecords.txt"
           The format in samplerecords.txt is as follows:
           <q_sample> <x_sample[]> <beliefs[]> <Observation[]> <sigma (control input)>
Inputs:    currModel
           x_init_mean
           initQprob
           maxPath
           stoppingCriteria     The callback function for stopping criteria.

Outputs:   <return>
*/
void BeliefSet::SampleBelief(const Model& currModel, const CState& x_init, 
                             const vector<double>& initQprob, int maxPath, 
                             bool (*stoppingCriteria)(const Model&, const CState &, 
                                                                    const DState&),
                             CState (*getInitCState)(const Model&, const CState &)) {
    CState x_sample;
    if (getInitCState != NULL) {
        x_sample = getInitCState(currModel, x_init);
    } else {
        x_sample = x_init;
    }
    discrete_distribution<int> q_init_distribution(initQprob.begin(), initQprob.end());
    DState q_sample = q_init_distribution(generator);

    Belief b_sample(x_sample, initQprob);
    
    bset.push_back(b_sample);

    uniform_int_distribution<int> uniformintRand;

    ofstream myfile;
    if (WriteSampleRecords) {
        myfile.open("OutFiles/samplerecords.txt");
        myfile << q_sample << "  ";
        for (int j = 0; j < x_sample.size(); j++) myfile << x_sample[j] << "  ";
        for (int j = 0; j < initQprob.size(); j++) myfile << initQprob[j] << "  ";
        myfile << q_sample << "  ";
    }

    int pathLen = 0;
    for(int i = 0; i < numBeliefs - 1; i++) { // the first belief is initial belief
        int sigma = uniformintRand(generator) % currModel.getNumDControls(); // generate random control;
//        int sigma = 0; // Always no control
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
            myfile << zq_next << "  ";
        }

        pathLen++;

        if ((pathLen > maxPath) || 
            (stoppingCriteria != NULL && stoppingCriteria(currModel, x_next, q_next))) {
            if (getInitCState != NULL) {
                x_sample = getInitCState(currModel, x_init);
            } else {
                x_sample = x_init;
            }
            q_sample = q_init_distribution(generator);
            b_sample.cstate = x_sample;
            b_sample.DStateProb = initQprob;
            pathLen = 0;
        }
        else {
            x_sample = x_next;
            q_sample = q_next;
        }
    }

    myfile.close();
}