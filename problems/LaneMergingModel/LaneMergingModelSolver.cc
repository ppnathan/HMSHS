#include "LaneMergingModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
#include "NewAlpha.h"
#include "NewSolver.h"

using namespace std;

int main(int argc, char** argv) {

	double rewardParam = 0.1;
    int nBeliefs = 5000;
    int maxIter = 500;
    double thresholdDist = 5;
    double precision = 1e-5;

	if (argc >= 2) rewardParam = atof(argv[1]);
	if (argc >= 3) nBeliefs = stoi(argv[2]);
	if (argc >= 4) maxIter = stoi(argv[3]);
	if (argc >= 5) thresholdDist = atof(argv[4]);

    LaneMergingModel hmshsModel(rewardParam);
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n \
Number of continuous obervations: %d\n Number of discrete observations: %d\n \
Number of discrete controls: %d\n Discount: %f\n ", 
            hmshsModel.getNumCStateVar(), hmshsModel.getNumDState(),
            hmshsModel.getNumCObsVar(), hmshsModel.getNumDObs(),
            hmshsModel.getNumDControls(), hmshsModel.getDiscount());

    // TODO: Modifying this
//    CState initCState = CState::Zero(hmshsModel.getNumCStateVar());
//    DState initDState = 0;

    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n \
Maximum iteration: %d\n Precision: %f\n", nBeliefs, maxIter, precision);

    NewSolver laneMergingModelSolver(maxIter, precision);
    cout << "\nDeclared Solver object." << endl;

    clock_t start_s = clock();

    NewAlphaSet Alpha_sol = 
            laneMergingModelSolver.solve(hmshsModel, nBeliefs, thresholdDist);

    clock_t stop_s = clock();

    cout << "\nFinished in " << (stop_s - start_s) / double(CLOCKS_PER_SEC) << endl;
    cout << "\nFinished!" << endl;
    
    return 0;
    
}