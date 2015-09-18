#include "HRCModel.h"
#include "BeliefSet.h"
#include "Alpha.h"
#include "Solver.h"
#include <iostream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    HRCModel hmshsmodel;
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n Number of continuous obervations: %d\n \
Number of discrete observations: %d\n Number of discrete controls: %d\n Discount: %f\n ", hmshsmodel.getNumCStateVar(), hmshsmodel.getNumDState(), hmshsmodel.getNumCObsVar(), 
        hmshsmodel.getNumDObs(), hmshsmodel.getNumDControls(), hmshsmodel.getDiscount());
        

    CState initCState;
    initCState.push_back(-5); initCState.push_back(-5);
    initCState.push_back(5); initCState.push_back(-5);
    
    DState initDState = 0;
    
    
    int nBeliefs = 200;
    int maxIter = 1000;
    double precision = 1e-5;
    vector<CObs> zx_samples;
    
    double zx_interval = 20*20*20*20;
    int NumSamplesEachDim = 10;
    int nSamples = NumSamplesEachDim*NumSamplesEachDim*NumSamplesEachDim*NumSamplesEachDim;
    CObs onesample(hmshsmodel.getNumCStateVar(), 0);
    for(int i0 =0; i0<NumSamplesEachDim; i0++){
        onesample[0] = -10+i0*20/(double)NumSamplesEachDim;
        for(int i1 = 0; i1<NumSamplesEachDim; i1++){
            onesample[1] = -10+i1*20/(double)NumSamplesEachDim;
            for(int i2 = 0; i2<NumSamplesEachDim; i2++){
                onesample[2] = -10+i2*20/(double)NumSamplesEachDim;
                for(int i3 = 0; i3<NumSamplesEachDim; i3++){
                    onesample[3] = -10+i3*20/(double)NumSamplesEachDim;
                    zx_samples.push_back(onesample);
                }
            }
        }
    }
    
    
    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n Number of sampled observations: %d\n Maximum iteration: %d\n Precision: %f\n", 
        nBeliefs, nSamples, maxIter, precision);
        
    Solver hrcmodelsolver(maxIter, precision, nSamples);
    printf("\nDeclared Solver object.\n");
    
    
    AlphaSet Alpha_sol = hrcmodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs, zx_samples, zx_interval);
    
    printf("\nFinished!\n");
    
//    const int numBelief = 1000;
//    BeliefSet sampledBeliefSet(numBelief);    
//    sampledBeliefSet.SampleBelief(hmshsmodel, initCState, initDState);
//    Alpha alphas(hmshsmodel.getNumDState(), nParticle, hmshsmodel.getDiscount());

    
    return 0;
    
}