#ifndef SOLVER_H
#define SOLVER_H

#include "Model.h"
#include "Alpha.h"
#include "BeliefSet.h"

class Solver {

public:
    Solver(int maxIt, double _precision, int _nSamples) : 
        maxIter(maxIt), precision(_precision), nSamples(_nSamples) {};
    AlphaSet solve(const Model& currModel, const CState& initCState, const DState& initDState, 
                   int numBeliefs, vector<CObs>& zx_samples, double zx_interval);

private:
    int maxIter;
    double precision;
    int nSamples;
};

#endif