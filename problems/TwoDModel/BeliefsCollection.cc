#include "TwoDModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <list>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    
    TwoDModel hmshsmodel;
    int nBeliefs = 10000;
    
    CState initCState = CState::Zero(hmshsmodel.getNumCStateVar());
    
	//CState initCState(hmshsmodel.getNumCStateVar(), 0);
	
    DState initDState = 0;
    vector<double> initQprob(hmshsmodel.getNumDState(), 0);
    initQprob[0] = 1.0;
    
    BeliefSet RandomBeliefs(nBeliefs);
    RandomBeliefs.SampleBelief(hmshsmodel, initCState, initDState, initQprob);
    
    return 0;
}