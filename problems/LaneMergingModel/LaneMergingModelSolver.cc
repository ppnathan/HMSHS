#include "LaneMergingModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
#include "NewAlpha.h"
#include "NewSolver.h"

using namespace std;

int main(int argc, char** argv) {
    LaneMergingModel hmshsmodel;
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n \
Number of continuous obervations: %d\n Number of discrete observations: %d\n \
Number of discrete controls: %d\n Discount: %f\n ", 
            hmshsmodel.getNumCStateVar(), hmshsmodel.getNumDState(),
            hmshsmodel.getNumCObsVar(), hmshsmodel.getNumDObs(),
            hmshsmodel.getNumDControls(), hmshsmodel.getDiscount());

    // TODO: Modifying this
    CState initCState = CState::Zero(hmshsmodel.getNumCStateVar());
    DState initDState = 0;
    
    int nBeliefs = 5000;
    int maxIter = 500;
    double thresholddist = 10;
    double precision = 1e-5;

    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n \
Maximum iteration: %d\n Precision: %f\n", nBeliefs, maxIter, precision);

    NewSolver laneMergingModelSolver(maxIter, precision);
    cout << "\nDeclared Solver object." << endl;

    clock_t start_s = clock();

    NewAlphaSet Alpha_sol = 
            laneMergingModelSolver.solve(hmshsmodel, initCState, initDState, nBeliefs, 
                                         thresholddist);

    clock_t stop_s = clock();

    cout << "\nFinished in " << (stop_s - start_s) / double(CLOCKS_PER_SEC) << endl;
    cout << "\nFinished!" << endl;
    
    return 0;
    
}