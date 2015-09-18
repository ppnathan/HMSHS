#include "HRCModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <list>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    
    HRCModel hmshsmodel;
    int nBeliefs = 10000;
    
    CState initCState;
    initCState.push_back(-5); initCState.push_back(-5);
    initCState.push_back(5); initCState.push_back(-5);
    
    DState initDState = 0;
    vector<double> initQprob(hmshsmodel.getNumDState(), 0.25);
    
    BeliefSet RandomBeliefs(nBeliefs);
    RandomBeliefs.SampleBelief(hmshsmodel, initCState, initDState, initQprob);
    
    return 0;
}