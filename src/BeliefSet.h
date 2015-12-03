#ifndef BELIEFSET_H
#define BELIEFSET_H

#include "Model.h"
#include "Belief.h"
#include <list>

class BeliefSet {
public:
    BeliefSet(int n = 0): numBeliefs(n) {};
    
    
    void SampleBelief(const Model& currModel, const CState& x_init_mean, 
                      const vector<double>& initQprob, int maxPath = 100, 
                      bool (*stoppingCriteria)(const Model&, const CState &, 
                                                             const DState&) = NULL, 
                      CState (*getInitCState)(const Model&, const CState &) = NULL);
    
    std::list<Belief> bset;

    int numBeliefs;
    
};

#endif