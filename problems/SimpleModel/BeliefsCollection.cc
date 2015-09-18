#include "SimpleModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <list>
#include <fstream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    
    SimpleModel hmshsmodel;
    int nBeliefs = 50000;
    
    CState initCState(hmshsmodel.getNumCStateVar(), 0);
    DState initDState = 0;
    vector<double> initQprob(hmshsmodel.getNumDState(), 0);
    initQprob[0] = 1.0;
    
    BeliefSet RandomBeliefs(nBeliefs);
    RandomBeliefs.SampleBelief(hmshsmodel, initCState, initDState, initQprob);
/*    
    ofstream BelCollectionFile;
    BelCollectionFile.open("OutFiles/PreBeliefsCollection.txt");
    for(list<Belief>::iterator it = RandomBeliefs.bset.begin(); it != RandomBeliefs.bset.end(); it++ ) {
        for(int j = 0; j<it->cstate.size(); j++) BelCollectionFile<<it->cstate[j]<<"  ";
        for(int j = 0; j<it->DStateProb.size(); j++) BelCollectionFile<<it->DStateProb[j]<<"  ";
        BelCollectionFile<<endl;
    }
    */
    
    return 0;
}