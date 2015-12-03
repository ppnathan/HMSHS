#include "LaneMergingModel.h"
#include "BeliefSet.h"
#include "Utilities.h"
#include <iostream>
#include <list>
#include <fstream>
#include <cstdlib>
#include <algorithm>

using namespace std;

bool LaneMergingModelstoppingCriteria(const Model& currModel, const CState & x, 
                                                              const DState& q) {
    return (max(x(0), x(2)) > 30 );
}

CState LaneMergingModelGetInitCState(const Model& currModel, const CState & x) {
    CState x_init(currModel.getNumCStateVar());
    uniform_real_distribution<double> uniRandVar1(-500, 0);
    x_init(0)= uniRandVar1(generator);
    
    normal_distribution<double> normalRandVar1(x(1), 1);
    x_init(1) = normalRandVar1(generator);
    
    uniform_real_distribution<double> uniRandVar2(-30, 30);
    x_init(2) = x_init(0) + uniRandVar2(generator);

    normal_distribution<double> normalRandVar2(x(3), 1);
    x_init(3) = normalRandVar2(generator);
        
    return x_init; 
}

int main(int argc, char** argv) {
    
    LaneMergingModel hmshsModel;
    int nBeliefs = 50000;
    
    CState initCState(hmshsModel.getNumCStateVar());
    initCState(0) = -500;
    initCState(1) = 30;
    initCState(2) = -500;
    initCState(3) = 30;
    
    vector<double> initQprob(hmshsModel.getNumDState(), 0);
    for (DState q = 0; q < hmshsModel.getNumDState(); q++) {
        if (q % 3 == 0) {
            initQprob[q] = 0.25;
        } else {
            initQprob[q] = 0;
        }
    }

    BeliefSet RandomBeliefs(nBeliefs);
    RandomBeliefs.SampleBelief(hmshsModel, initCState, initQprob, 500, 
                               LaneMergingModelstoppingCriteria, 
                               LaneMergingModelGetInitCState);
    
    return 0;
}