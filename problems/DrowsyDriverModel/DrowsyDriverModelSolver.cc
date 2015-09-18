#include "DrowsyDriverModel.h"
#include "BeliefSet.h"
#include "NewAlpha.h"
#include "NewSolver.h"
#include <iostream>
#include <cstdlib>

using namespace std;

int main(int argc, char** argv) {
    DrowsyDriverModel hmshsmodel;
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n Number of continuous obervations: %d\n \
Number of discrete observations: %d\n Number of discrete controls: %d\n Discount: %f\n ", hmshsmodel.getNumCStateVar(), hmshsmodel.getNumDState(), hmshsmodel.getNumCObsVar(), 
        hmshsmodel.getNumDObs(), hmshsmodel.getNumDControls(), hmshsmodel.getDiscount());
        
    if(1) { //new solver
        CState initCState(1,0);
        DState initDState = 0;
    
        int nBeliefs = 8000;
        int maxIter = 500;
        double thresholddist = 1;
        double precision = 1e-5;
    
        printf("\nSolver parameters:\n Number of sampled beliefs: %d\n Maximum iteration: %d\n Precision: %f\n", 
            nBeliefs, maxIter, precision);
    
        NewSolver drowsydrivermodelsolver(maxIter, precision);
        printf("\nDeclared Solver object.\n");
    
        NewAlphaSet Alpha_sol = drowsydrivermodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs, thresholddist);
    
        printf("\nFinished!\n");
    
    }     
        
#ifdef OLD_SOLVER //old solver
    CState initCState(1,0);
    DState initDState = 0;
    
    int nSamples = 500;
    int nBeliefs = 100;
    int maxIter = 1000;
    double precision = 1e-5;
    
    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n Number of sampled observations: %d\n Maximum iteration: %d\n Precision: %f\n", 
        nBeliefs, nSamples, maxIter, precision);
        
    Solver drowsydrivermodelsolver(maxIter, precision, nSamples);
    printf("\nDeclared Solver object.\n");
    
    AlphaSet Alpha_sol = drowsydrivermodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs);
    
    printf("\nFinished!\n");
    
//    const int numBelief = 1000;
//    BeliefSet sampledBeliefSet(numBelief);    
//    sampledBeliefSet.SampleBelief(hmshsmodel, initCState, initDState);
//    Alpha alphas(hmshsmodel.getNumDState(), nParticle, hmshsmodel.getDiscount());
#endif
    
    return 0;
    
}