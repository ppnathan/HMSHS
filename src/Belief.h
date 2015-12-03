#ifndef BELIEF_H
#define BELIEF_H

#include "Model.h"
#include <vector>

class Belief {
public:
    Belief() {};
    Belief(const CState& cstate_in, const vector<double> &prob );
    Belief(const Belief& b);
    
    
    void setBelief(const CState& cstate_in, const vector<double> &prob );
    
    double BeliefUpdate(const Model& currModel, const DControl& sigma_k, const DObs& zq_next, 
                        const CState& zx_next);
    
    std::vector<DState> sampleDState(int n);
    
    double normalize();
    
    bool isvalid();
    
    CState cstate;
    vector<double> DStateProb;
};

#endif