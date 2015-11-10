#include "TwoDModel.h"
#include "BeliefSet.h"
#include <iostream>
#include <cstdlib>
#include <ctime>

#define NEW_SOLVER

#ifdef NEW_SOLVER
#include "NewAlpha.h"
#include "NewSolver.h"
#endif

#ifdef OLD_SOLVER
#include "Alpha.h"
#include "Solver.h"
#endif

using namespace std;

int main(int argc, char** argv) {
    TwoDModel hmshsmodel;
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n \
		    Number of continuous obervations: %d\n Number of discrete observations: %d\n \
			Number of discrete controls: %d\n Discount: %f\n ", 
	        hmshsmodel.getNumCStateVar(), hmshsmodel.getNumDState(),
			hmshsmodel.getNumCObsVar(), hmshsmodel.getNumDObs(),
			hmshsmodel.getNumDControls(), hmshsmodel.getDiscount());
        
#ifdef NEW_SOLVER

        CState initCState = CState::Zero(hmshsmodel.getNumCStateVar());
		DState initDState = 0;
    
        int nBeliefs = 5000;
        int maxIter = 500;
        double thresholddist = 1;
        double precision = 1e-5;

        printf("\nSolver parameters:\n Number of sampled beliefs: %d\n \
			    Maximum iteration: %d\n Precision: %f\n", 
                nBeliefs, maxIter, precision);

        NewSolver twodmodelsolver(maxIter, precision);
        cout << "\nDeclared Solver object." << endl;

		int start_s = clock();

        NewAlphaSet Alpha_sol = 
			twodmodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs, thresholddist);

		int stop_s = clock();

		cout << "\nFinished in " << (stop_s - start_s) / double(CLOCKS_PER_SEC) * 1000 << endl;
        cout << "\nFinished!" << endl;

#endif    
        
#ifdef OLD_SOLVER //old solver
    CState initCState(2,0);
    DState initDState = 0;
    
//    int nSamples = 5000;
    int nBeliefs = 200;
    int maxIter = 1000;
    double precision = 1e-4;
	
    vector<CObs> zx_samples;
    
    double zx_interval = 10*10;
    int NumSamplesEachDim = 50;
    int nSamples = NumSamplesEachDim*NumSamplesEachDim;
    CObs onesample(hmshsmodel.getNumCStateVar(), 0);
    for(int i0 =0; i0<NumSamplesEachDim; i0++){
        onesample[0] = -5+i0*5/(double)NumSamplesEachDim;
        for(int i1 = 0; i1<NumSamplesEachDim; i1++){
            onesample[1] = -5+i1*5/(double)NumSamplesEachDim;
            zx_samples.push_back(onesample);
        }
    }
    
    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n \
		    Number of sampled observations: %d\n Maximum iteration: %d\n Precision: %f\n", 
            nBeliefs, nSamples, maxIter, precision);
        
    Solver twodmodelsolver(maxIter, precision, nSamples);
    cout <<"\nDeclared Solver object." << endl;
	
	time_t curr=time(0);
    cout << "current time is: " << ctime(&curr) << endl;
    AlphaSet Alpha_sol = twodmodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs,
	                                           zx_samples, zx_interval);
	curr = time(0);
	cout << "current time is: " << ctime(&curr) << endl;
    cout << "\nFinished!" << endl;
    
//    const int numBelief = 1000;
//    BeliefSet sampledBeliefSet(numBelief);    
//    sampledBeliefSet.SampleBelief(hmshsmodel, initCState, initDState);
//    Alpha alphas(hmshsmodel.getNumDState(), nParticle, hmshsmodel.getDiscount());
#endif
	
    return 0;
    
}