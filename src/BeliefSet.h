#ifndef BELIEFSET_H
#define BELIEFSET_H

#include "Model.h"
#include "Belief.h"
#include <list>

class BeliefSet {
public:
	BeliefSet(int n = 0): numBeliefs(n) {};
    
    
    void SampleBelief(const Model& currModel, const CState& initCState, const DState& initDState, const vector<double>& initQprob);
    
    std::list<Belief> bset;

	int numBeliefs;
    
};

#endif