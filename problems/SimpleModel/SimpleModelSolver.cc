#include "SimpleModel.h"
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
    SimpleModel hmshsmodel;
    printf("Model parameters:\n Number of continuous states: %d\n Number of discrete states: %d\n Number of continuous obervations: %d\n \
Number of discrete observations: %d\n Number of discrete controls: %d\n Discount: %f\n ", hmshsmodel.getNumCStateVar(), hmshsmodel.getNumDState(), hmshsmodel.getNumCObsVar(), 
        hmshsmodel.getNumDObs(), hmshsmodel.getNumDControls(), hmshsmodel.getDiscount());
        
#ifdef NEW_SOLVER 
        CState initCState(1,0);
        DState initDState = 0;
    
        int nBeliefs = 5;
        int maxIter = 1000;
        double thresholddist = 1;
        double precision = 1e-4;
    
        printf("\nSolver parameters:\n Number of sampled beliefs: %d\n Maximum iteration: %d\n Precision: %f\n", 
            nBeliefs, maxIter, precision);
    
        NewSolver simplemodelsolver(maxIter, precision);
        printf("\nDeclared Solver object.\n");
    	int start_s=clock(); 
        NewAlphaSet Alpha_sol = simplemodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs, thresholddist);
		int stop_s=clock();
		cout << "\nFinished in " << (stop_s-start_s)/double(CLOCKS_PER_SEC)*1000 << endl;
//        printf("\nFinished!\n");
#endif
        

#ifdef OLD_SOLVER //old solver
    CState initCState(1,0);
    DState initDState = 0;
    
    int nBeliefs= 5000;
    int maxIter = 1000;
    double precision = 1e-4;
    vector<CObs> zx_samples;
    
    
    double zx_interval = 10;
    int NumSamplesEachDim = 1000;
    int nSamples = NumSamplesEachDim;
    CObs onesample(hmshsmodel.getNumCStateVar(), 0);
    for(int i0 =0; i0<NumSamplesEachDim; i0++){
        onesample[0] = -5+i0*10/(double)NumSamplesEachDim;
        zx_samples.push_back(onesample);
    }
    
    printf("\nSolver parameters:\n Number of sampled beliefs: %d\n Number of sampled observations: %d\n Maximum iteration: %d\n Precision: %f\n", 
        nBeliefs, nSamples, maxIter, precision);
    
    Solver simplemodelsolver(maxIter, precision, nSamples);
    printf("\nDeclared Solver object.\n");
	cout<<CLOCKS_PER_SEC<<endl;
	time_t curr=time(0);
    cout << "current time is: " << ctime(&curr) <<endl;
    int start_s=clock();    
    AlphaSet Alpha_sol = simplemodelsolver.solve(hmshsmodel, initCState, initDState, nBeliefs, zx_samples, zx_interval);
	int stop_s=clock();
	cout << "\nFinished in " << (stop_s-start_s)/double(CLOCKS_PER_SEC)*1000 << endl;
	curr=time(0);
    cout << "current time is: " << ctime(&curr) <<endl;
    
#endif
    
    return 0;
    
}