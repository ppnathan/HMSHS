#ifndef NEWSOLVER_H
#define NEWSOLVER_H

#include "Model.h"
#include "NewAlpha.h"
#include "BeliefSet.h"

class NewSolver {

public:
    NewSolver(int maxIt, double _precision) : maxIter(maxIt), mPrecision(_precision) {};
    NewAlphaSet solve(const Model& currModel, const CState& initCState, const DState& initDState,
                      int numBeliefs, double thresholddist);

private:
    int maxIter;
    double mPrecision;
    
//  double getdist(const CState& x1, const CState& x2);
};

#endif