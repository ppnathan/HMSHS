#include "Belief.h"
#include "Utilities.h"
#include <vector>
#include <random>

using namespace std;

Belief::Belief(const CState& cstate_in, const vector<double> &prob ) {
    cstate = cstate_in;
    DStateProb = prob;
};

Belief::Belief(const Belief& b) {
    cstate = b.cstate;
    DStateProb = b.DStateProb;
}

void Belief::setBelief(const CState& cstate_in, const vector<double> &prob ) {
	cstate = cstate_in;
    DStateProb = prob;
};

double Belief::normalize() {
	double sum = 0;
	for(int i = 0; i < DStateProb.size(); i++) {
		sum += DStateProb[i];
	}

	if(sum!=0) {
		for(int i = 0; i < DStateProb.size(); i++) {
			DStateProb[i] = DStateProb[i] / sum;
		}
		return 1/sum;
	}
	else {
		return 0;
	}
}

bool Belief::isvalid() {
	double sum = 0;
    for(int i = 0; i < DStateProb.size(); i++) {
        sum += DStateProb[i];
	}

    return (sum - 1.0) < 1e-6;
};

vector<DState> Belief::sampleDState(int n) {
    vector<DState> result;
    if(n == 0 || !this->isvalid())
        return result;
    
    vector<double> accumProb(DStateProb.size(), 0);
    uniform_real_distribution<double> uniformRand(0.0, 1.0);
    
    double randNum;
    for(int i = 0; i<n; i++) {
        accumProb[0] = this->DStateProb[0];
        for(int j = 1; j < this->DStateProb.size(); j++){
            accumProb[j] = accumProb[j - 1] + this->DStateProb[j];
        }
    
        randNum = uniformRand(generator);
        for(int j = 0; j < this->DStateProb.size(); j++){
            if(accumProb[j] >= randNum) {
                result.push_back(j);
                break;
            }
        }
    }

    return result;    
}

double Belief::BeliefUpdate(const Model& currModel, const DControl& sigma_k, 
                            const DObs& zq_next, const CState& zx_next) {
    vector<double> qProb;

    for(int qq = 0; qq < currModel.getNumDState(); qq++) {
        double tmp = 0;
        for(int q = 0; q < currModel.getNumDState(); q++){
            tmp += currModel.getDStateTransProb(qq, q, sigma_k) * this->DStateProb[q];
        }
        qProb.push_back(currModel.getDiscreteObsProb(zq_next, qq) * 
			            currModel.getCStateTransProb(zx_next, qq, this->cstate) * 
					    tmp );
    }
    
    this->cstate = zx_next;
    this->DStateProb = qProb;

    return this->normalize();    
}