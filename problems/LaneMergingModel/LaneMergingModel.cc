#include "LaneMergingModel.h"
#include "Utilities.h"
#include <cmath>
#include <cstdlib>
#include <algorithm>
#include <random>
#include <iostream>
#include <array>

using namespace std;

const double Discount_LMMdl = 0.999;
const int NumCStateVar_LMMdl = 4;   // number of continuous state variables
const int NumDState_LMMdl = 12;     // number of discrete states
const int NumCObsVar_LMMdl = 4;     // number of continuous observation variables
const int NumDObs_LMMdl = 1;        // number of discrete observations
const int NumDControls_LMMdl = 3;   // number of discrete controls
 
enum { OBLIVIOUS_C0 = 0, OBLIVIOUS_C1 = 1, OBLIVIOUS_C2 = 2, 
       IMPATIENT_C0 = 3, IMPATIENT_C1 = 4, IMPATIENT_C2 = 5, 
       COURTEOUS_C0 = 6, COURTEOUS_C1 = 7, COURTEOUS_C2 = 8, 
       REASONABLE_C0 = 9, REASONABLE_C1 = 10, REASONABLE_C2 = 11}; 

enum {OBLIVIOUS = 0, IMPATIENT = 1, COURTEOUS = 2, REASONABLE = 3};

// sigma: C0:(u = 0); C1:(u = 1); C2:(u = -1);
enum {C0 = 0, C1 = 1, C2 = 2}; 

LaneMergingModel::LaneMergingModel() : Model(NumCStateVar_LMMdl, NumDState_LMMdl, NumCObsVar_LMMdl, 
                               NumDObs_LMMdl, NumDControls_LMMdl, Discount_LMMdl),
                    mDeltaT(0.1), mNoiseMean(0), mDistNoiseStd(0.1), mVelNoiseStd(0.1),
                    mSafeDist(7), mReactionDist(25){
	mRewardParam = 0.1;
};

LaneMergingModel::LaneMergingModel(double rewardParam) : Model(NumCStateVar_LMMdl, NumDState_LMMdl, NumCObsVar_LMMdl, 
                               NumDObs_LMMdl, NumDControls_LMMdl, Discount_LMMdl),
                    mDeltaT(0.1), mNoiseMean(0), mDistNoiseStd(0.1), mVelNoiseStd(0.1),
                    mSafeDist(7), mReactionDist(25) {
    mRewardParam = rewardParam;
};

DState LaneMergingModel::sampleDState(const DState &q, const DControl &sigma) const{
    int humanDriver = q / 3;
    
    return humanDriver * 3 + sigma;
};

CState LaneMergingModel::sampleCState(const DState &q_next, const CState &x_k) const {
	CState x_next(this->getNumCStateVar());
	
    if (max(x_k(0), x_k(2)) > 0 && abs(x_k(0) - x_k(2)) < mSafeDist) {
	    x_next(0) = x_k(0);
	    x_next(1) = x_k(1);
	    x_next(2) = x_k(2);
	    x_next(3) = x_k(3);
		
		return x_next;
    }
	
    int humanDriver = q_next / 3;
    int autonomousDriver = q_next % 3;
    double humanInput, autonomousInput;

    if (humanDriver == OBLIVIOUS) {
        humanInput = 0;
    } else if (humanDriver == IMPATIENT) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? 1 : 0;
    } else if (humanDriver == COURTEOUS) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? -1 : 0;
    } else if (humanDriver == REASONABLE) {
        if (abs(x_k(0) - x_k(2)) < mReactionDist) {
            humanInput = x_k(1) > x_k(3) ? 1 : -1;
        } else {
            humanInput = 0;
        }
    } else {
        printf("LaneMergingModel::sampleCState(): q_next out of domain\n");
        exit(1);
    }
    
    if (autonomousDriver == C0) {
        autonomousInput = 0;
    } else if (autonomousDriver == C1) {
        autonomousInput = 1;
    } else if (autonomousDriver == C2) {
        autonomousInput = -1;
    } else {
        printf("LaneMergingModel::sampleCState(): q_next out of domain\n");
        exit(1);
    }

    normal_distribution<double> distNormalRand4HumanDriver(this->mNoiseMean, this->mDistNoiseStd);
    normal_distribution<double> velNormalRand4HumanDriver(this->mNoiseMean, this->mVelNoiseStd);
    normal_distribution<double> distNormalRand4AutonomousDriver(this->mNoiseMean, 
                                                                this->mDistNoiseStd);
    normal_distribution<double> velNormalRand4AutonomousDriver(this->mNoiseMean, 
                                                               this->mVelNoiseStd);
    double distNoise4HumanDriver = distNormalRand4HumanDriver(generator);
    double velNoise4HumanDriver = velNormalRand4HumanDriver(generator);
    double distNoise4AutonomousDriver = distNormalRand4AutonomousDriver(generator);
    double velNoise4AutonomousDriver = velNormalRand4AutonomousDriver(generator); 
       
    
    
    x_next(0) = x_k(0) + mDeltaT * x_k(1) + distNoise4HumanDriver;
    x_next(1) = x_k(1) + mDeltaT * humanInput + velNoise4HumanDriver;
    x_next(2) = x_k(2) + mDeltaT * x_k(3) + distNoise4AutonomousDriver;
    x_next(3) = x_k(3) + mDeltaT * autonomousInput + velNoise4AutonomousDriver;
    
    return x_next;
};

DObs LaneMergingModel::sampleDObs(const DState &q_next) const {
    return 0;
};

double LaneMergingModel::getCStateTransProb(const CState & x_next, 
                                            const DState & q_next, 
                                            const CState & x_k) const {
    double difference[4];
    int humanDriver = q_next / 3;
    int autonomousDriver = q_next % 3;
    double humanInput, autonomousInput;

    if (humanDriver == OBLIVIOUS) {
        humanInput = 0;
    } else if (humanDriver == IMPATIENT) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? 1 : 0;
    } else if (humanDriver == COURTEOUS) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? -1 : 0;
    } else if (humanDriver == REASONABLE) {
        if (abs(x_k(0) - x_k(2)) < mReactionDist) {
            humanInput = x_k(1) > x_k(3) ? 1 : -1;
        } else {
            humanInput = 0;
        }
    } else {
        printf("LaneMergingModel::getCStateTransProb(): q_next out of domain\n");
        exit(1);
    }
    
    if (autonomousDriver == C0) {
        autonomousInput = 0;
    } else if (autonomousDriver == C1) {
        autonomousInput = 1;
    } else if (autonomousDriver == C2) {
        autonomousInput = -1;
    } else {
        printf("LaneMergingModel::getCStateTransProb(): q_next out of domain\n");
        exit(1);
    }

    if (max(x_k(0), x_k(2)) > 0 && abs(x_k(0) - x_k(2)) < mSafeDist) {
        difference[0] = x_next(0) - x_k(0);
        difference[1] = x_next(1) - x_k(1);
        difference[2] = x_next(2) - x_k(2);
        difference[3] = x_next(3) - x_k(3);
    } else {
        difference[0] = x_next(0) - (x_k(0) + mDeltaT * x_k(1));
        difference[1] = x_next(1) - (x_k(1) + mDeltaT * humanInput);
        difference[2] = x_next(2) - (x_k(2) + mDeltaT * x_k(3));
        difference[3] = x_next(3) - (x_k(3) + mDeltaT * autonomousInput);
    }
    
    double p1 = 1.0 / (mDistNoiseStd * sqrt(2 * PI)) * 
                exp(-0.5 * (difference[0] - mNoiseMean) * (difference[0] - mNoiseMean) /
                    (mDistNoiseStd * mDistNoiseStd));
    double p2 = 1.0 / (mVelNoiseStd * sqrt(2 * PI)) * 
                exp(-0.5 * (difference[1] - mNoiseMean) * (difference[1] - mNoiseMean) /
                    (mVelNoiseStd * mVelNoiseStd));
    double p3 = 1.0 / (mDistNoiseStd * sqrt(2 * PI)) * 
                exp(-0.5 * (difference[2] - mNoiseMean) * (difference[2] - mNoiseMean) /
                    (mDistNoiseStd * mDistNoiseStd));
    double p4 = 1.0 / (mVelNoiseStd * sqrt(2 * PI)) * 
                exp(-0.5 * (difference[3] - mNoiseMean) * (difference[3] - mNoiseMean) /
                    (mVelNoiseStd * mVelNoiseStd));
    
    return p1 * p2 * p3 * p4;
};

double LaneMergingModel::getDStateTransProb(const DState &q_next, 
                                            const DState &q_k,
                                            const DControl &sigma_k) const {
    int humanDriver = q_k / 3;  
    int humanDriverNext = q_next / 3;
    int autonomousDriverNext = q_next % 3;
    
    return (humanDriver == humanDriverNext) * (autonomousDriverNext == sigma_k);
};

double LaneMergingModel::getDiscreteObsProb(const DObs &zq_k, const DState &q_k) const {
    return 1;
};

CState LaneMergingModel::getNextCStateNoNoise(const DState &q_next, const CState &x_k) const {
	CState x_next(this->getNumCStateVar());
	if (max(x_k(0), x_k(2)) > 0 && abs(x_k(0) - x_k(2)) < mSafeDist) {
        x_next(0) = x_k(0);
        x_next(1) = x_k(1);
        x_next(2) = x_k(2);
        x_next(3) = x_k(3);
		
		return x_next;
	}
	
    int humanDriver = q_next / 3;
    int autonomousDriver = q_next % 3;
    double humanInput, autonomousInput;
    
    if (humanDriver == OBLIVIOUS) {
        humanInput = 0;
    } else if (humanDriver == IMPATIENT) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? 1 : 0;
    } else if (humanDriver == COURTEOUS) {
        humanInput = abs(x_k(0) - x_k(2)) < mReactionDist ? -1 : 0;
    } else if (humanDriver == REASONABLE) {
        if (abs(x_k(0) - x_k(2)) < mReactionDist) {
            humanInput = x_k(1) > x_k(3) ? 1 : -1;
        } else {
            humanInput = 0;
        }
    } else {
        printf("LaneMergingModel::getNextCStateNoNoise(): q_next out of domain\n");
        exit(1);
    }
    
    if (autonomousDriver == C0) {
        autonomousInput = 0;
    } else if (autonomousDriver == C1) {
        autonomousInput = 1;
    } else if (autonomousDriver == C2) {
        autonomousInput = -1;
    } else {
        printf("LaneMergingModel::getNextCStateNoNoise(): q_next out of domain\n");
        exit(1);
    }

    x_next(0) = x_k(0) + mDeltaT * x_k(1);
    x_next(1) = x_k(1) + mDeltaT * humanInput;
    x_next(2) = x_k(2) + mDeltaT * x_k(3);
    x_next(3) = x_k(3) + mDeltaT * autonomousInput;

    return x_next;
};

MatrixXd LaneMergingModel::get1stDerivative(const DState &q, const CState &x) const {
    MatrixXd firstderivative(this->getNumCStateVar(), this->getNumCStateVar());
	if (max(x(0), x(2)) > 0 && abs(x(0) - x(2)) < mSafeDist) {
        firstderivative << 1, 0, 0, 0,
                           0, 1, 0, 0,
                           0, 0, 1, 0,
                           0, 0, 0, 1;
	} else {
        firstderivative << 1, mDeltaT, 0, 0,
                           0, 1,       0, 0,
                           0, 0,       1, mDeltaT,
                           0, 0,       0, 1;
	}
    
    return firstderivative;
};

double LaneMergingModel::getReward(const DState &q, const CState &x, const DControl &sigma) const { 
    double maxReward = 1000;
    if (max(x(0), x(2)) < 0) {
        return 0; 
    } else {
        if (abs(x(0) - x(2)) < mSafeDist) {
            return 0;
        } else if (x(0) - x(2) > mSafeDist && x(0) - x(2) < mSafeDist + 1) {
            return maxReward * (x(0) - x(2) - mSafeDist);
        } else if (x(2) - x(0) > mSafeDist && x(2) - x(0) < mSafeDist + 1) {
            return maxReward * (x(2) - x(0) - mSafeDist);
        } else if (x(2) > 0) {
            return maxReward + mRewardParam * x(2) * x(2);
        }
        
        return maxReward;
    }
    // if (max(x(0), x(2)) < 0) {
//      return 3e5 - x(2) * x(2); // - 2.0 * mDeltaT * (sigma > 0);
//  } else {
//      if (abs(x(0) - x(2)) > mSafeDist) {
//          return 3e5 - x(2) * x(2) * (x(2) < 0 ? 1: -1); // - 2.0 * mDeltaT * (sigma > 0);
//      } else {
//          return 0;
//      }
//  }
};

VectorXd LaneMergingModel::getReward1stDeri(const DState &q, const CState &x, 
                                                             const DControl &sigma) const {
    VectorXd reward1stDeri = VectorXd::Zero(this->getNumCStateVar());
    
    double maxReward = 1000;
    if (max(x(0), x(2)) > 0) {
        if (abs(x(0) - x(2)) < mSafeDist) {
            // do nothing
        } else if (x(0) - x(2) > mSafeDist && x(0) - x(2) < mSafeDist + 1) {
            reward1stDeri(0) = maxReward;
            reward1stDeri(2) = -maxReward;
        } else if (x(2) - x(0) > mSafeDist && x(2) - x(0) < mSafeDist + 1) {
            reward1stDeri(0) = -maxReward;
            reward1stDeri(2) = maxReward;
        } else if (x(2) > 0) {
            reward1stDeri(2) = mRewardParam * x(2);
        }
    }

    return reward1stDeri;
}

MatrixXd LaneMergingModel::getReward2ndDeri(const DState &q, const CState &x, 
                                                             const DControl &sigma) const {
    MatrixXd Reward2ndDeri = MatrixXd::Zero(this->getNumCStateVar(), this->getNumCStateVar());
    if (max(x(0), x(2)) > 0) {
        if (abs(x(0) - x(2)) < mSafeDist) {
            // do nothing
        } else if (x(0) - x(2) > mSafeDist && x(0) - x(2) < mSafeDist + 1) {
            // do nothing
        } else if (x(2) - x(0) > mSafeDist && x(2) - x(0) < mSafeDist + 1) {
            // do nothing
        } else if (x(2) > 0) {
            Reward2ndDeri(2, 2) = mRewardParam;
        }
    }
    // if (max(x(0), x(2)) < 0 ) {
//      Reward2ndDeri(2, 2) = -2;
//  } else {
//      if (abs(x(0) - x(2)) > mSafeDist) {
//          Reward2ndDeri(2, 2) = -2 * (x(2) < 0 ? 1: -1);
//      }
//  }

    return Reward2ndDeri;
};

vector<MatrixXd> LaneMergingModel::getCovariance() const {
    MatrixXd cov_tmp = MatrixXd::Zero(this->getNumCStateVar(), this->getNumCStateVar());
    vector<MatrixXd> covariance;
    cov_tmp(0, 0) = mDistNoiseStd * mDistNoiseStd;
    cov_tmp(1, 1) = mVelNoiseStd * mVelNoiseStd;
    cov_tmp(2, 2) = mDistNoiseStd * mDistNoiseStd;
    cov_tmp(3, 3) = mVelNoiseStd * mVelNoiseStd;
    for (DState q = 0; q < NumDState_LMMdl; q++) {
        covariance.push_back(cov_tmp);
    }
    
    return covariance;
};

MatrixXd LaneMergingModel::getCovMatrix(const DState &q) const {
    MatrixXd cov_tmp = MatrixXd::Zero(this->getNumCStateVar(), this->getNumCStateVar());

    cov_tmp(0, 0) = mDistNoiseStd * mDistNoiseStd;
    cov_tmp(1, 1) = mVelNoiseStd * mVelNoiseStd;
    cov_tmp(2, 2) = mDistNoiseStd * mDistNoiseStd;
    cov_tmp(3, 3) = mVelNoiseStd * mVelNoiseStd;
    
    return cov_tmp;
};

double LaneMergingModel::sample(const DState &q_k, const CState &x_k, const DControl &sigma_k,
                         DState &q_next, CState &x_next, DObs &obs_out) const{
//    cout << "q_k = " << q_k << ", x_k = " << x_k.transpose() << ", sigma_k = " << sigma_k <<endl;
    q_next = sampleDState(q_k, sigma_k);
//    cout << "q_next = " << q_next << ", ";
    x_next = sampleCState(q_next, x_k);
//    cout << "x_next(0) = " << x_next(0) << ", ";
    obs_out = sampleDObs(q_next);   
//    cout << "obs_out = " << obs_out << endl;
    
    return this->getDStateTransProb(q_next, q_k, sigma_k) *
           this->getCStateTransProb(x_next, q_next, x_k) *
           this->getDiscreteObsProb(q_next, obs_out);
};
