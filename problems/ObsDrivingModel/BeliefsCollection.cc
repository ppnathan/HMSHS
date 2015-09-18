#include "ObsDrivingModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <list>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    
    ObsDrivingModel hmshsmodel;
    int nBeliefs = 50000;
    
    CState initCState(hmshsmodel.getNumCStateVar(), 0);
	initCState[1] = 35;
	
    DState initDState = 0;
    vector<double> initQprob(hmshsmodel.getNumDState(), 0);
    initQprob[0] = 1.0;
    
    BeliefSet RandomBeliefs(nBeliefs);
    RandomBeliefs.SampleBelief(hmshsmodel, initCState, initDState, initQprob);
    
    return 0;
}