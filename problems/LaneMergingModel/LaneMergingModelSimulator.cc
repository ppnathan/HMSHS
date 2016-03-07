#include "LaneMergingModel.h"
#include "BeliefSet.h"
#include "NewAlpha.h"
#include "Utilities.h"
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <stdio.h>
#include <cfloat>
#include <cmath>
#include <eigen3/Eigen/Dense>

using namespace std;
using namespace Eigen;

DControl FindOptimalPolicy(const Model& currModel, const NewAlphaSet& alphaSet, 
                           const Belief& b, double thresholdDist, double & J_star) {
    DControl sigma_star = -1;
    J_star = -DBL_MAX;
    
    double minDist = DBL_MAX;
    NewAlphaSet::const_iterator minDistIterator = alphaSet.end();
    for (NewAlphaSet::const_iterator it = alphaSet.begin(); it != alphaSet.end(); it++){
        double dist = (it->mLocalx - b.cstate).norm();
        if (dist < thresholdDist &&
		    (currModel.satisfyConstraints(0, b.cstate) || 
		     ~currModel.satisfyConstraints(0, it->mLocalx))) {
            double J = it->calvalue(currModel, b);
            if (J > J_star) {
                J_star = J;
                sigma_star = it->mSigma;
            }
        }
        if (dist < minDist) {
            minDist = dist;
            minDistIterator = it;
        }
    }
    
    // The case when all distances are greater than thresholdDist.
    if (sigma_star == -1) {
		J_star = minDistIterator->calvalue(currModel, b);
        sigma_star = minDistIterator->mSigma;
		cout << "No point within the threshold, use policy with the nearest point." << endl;
    }
    
    return sigma_star;
}

void CheckCorrectness(const NewAlphaSet& alphaSet) {
    ofstream checkCorrectnessFile;
    checkCorrectnessFile.open("OutFiles/checkcorrectnessFile.txt");
    
    checkCorrectnessFile << alphaSet.size() << endl;
    for (NewAlphaSet::const_iterator it  = alphaSet.begin(); it != alphaSet.end(); it++) {
       checkCorrectnessFile << it->mSigma << "  ";

       for (int i = 0; i < it->mLocalx.size(); i++) {
           checkCorrectnessFile << it->mLocalx(i) << "  ";
       }
       checkCorrectnessFile << endl;
       
       for (int i = 0; i < it->mCoeff.size(); i++) {
           checkCorrectnessFile << it->mCoeff[i][0] << "  ";
           for (int j  = 0; j < it->mCoeff[i][1].rows(); j++) {
               checkCorrectnessFile << it->mCoeff[i][1](j) << "  ";  
           }
           for (int j  = 0; j < it->mCoeff[i][2].cols(); j++) {
               for (int k = 0; k < it->mCoeff[i][2].rows(); k++) {
                   checkCorrectnessFile << it->mCoeff[i][2](k, j) << "  ";  
               }
           }
           checkCorrectnessFile << endl;
       }
    }
}

void ReadPolicyFile(const Model& currModel, char filename[], NewAlphaSet& alphaSet, 
                    int& nAlphas ) {
    ifstream policyfile;
    policyfile.open(filename);
    
    if (policyfile.is_open()) {

        NewAlpha readAlpha(currModel.getNumDState(), currModel.getNumCStateVar(), 
                           currModel.getDiscount());
        
        policyfile >> nAlphas;
        
        for (int n = 0; n < nAlphas; n++) {
            policyfile >> readAlpha.mSigma;
            readAlpha.mLocalx.resize(currModel.getNumCStateVar());
            for (int i = 0; i < currModel.getNumCStateVar(); i++) {
                policyfile >> readAlpha.mLocalx(i);
            }
            for (DState qq = 0; qq < currModel.getNumDState(); qq++ ) {
                policyfile >> readAlpha.mCoeff[qq][0](0, 0);
                for (int i = 0; i < currModel.getNumCStateVar(); i++) {
                    policyfile >> readAlpha.mCoeff[qq][1](i);
                }
                for (int i = 0; i < currModel.getNumCStateVar(); i++) {
                    for (int j = 0; j < currModel.getNumCStateVar(); j++) {
                        policyfile >> readAlpha.mCoeff[qq][2](j, i);
                    }
                }
            }
            alphaSet.push_back(readAlpha);
        }
        policyfile.close();
    }
}

bool IsSimEnded(const DState & q, const CState & x) {
    if (max(x(0), x(2)) > 20) {
    	return true;
    }
	double safeDist = 7;
	if (max(x(0), x(2)) > 0 && abs(x(0) - x(2)) < safeDist) {
		return true;
	}
	
	return false;
}

bool IsCrash(const CState & x) {
	double safeDist = 7;
	if (max(x(0), x(2)) > 0 && abs(x(0) - x(2)) < safeDist) {
		return true;
	}
	
	return false;
}

void writeToSimResultFile(ofstream & simResultFile, const DState & q_k, const CState & x_k, const Belief & bel, 
                     const DObs & zq_k, const DControl & sigma_star) {
    simResultFile << q_k << "  ";
    cout << "q = " << q_k << ", x = (";
    for (int j = 0; j < x_k.size(); j++) {
        simResultFile << x_k(j) << "  ";
        cout << x_k(j) << ", ";
    } 
    cout << ")\nbq = (";
    for (int j = 0; j < bel.DStateProb.size(); j++) {
        simResultFile << bel.DStateProb[j] << "  ";
        cout << bel.DStateProb[j] << ", ";
    }
    simResultFile << zq_k << "  " << sigma_star << endl;
    cout << ")\nzq = " << zq_k << ", sigma = " << sigma_star << endl;
	
	return;
}

void RecordCrashInitialValue(ofstream & crashFile, const CState & x_init, const DState & q_init) {
	crashFile << "q_init = " << q_init << ";\n";
	for (int i = 0 ; i < x_init.size(); i++) {
		crashFile << "x_init(" << i << ") = " << x_init(i) << ";\n";
	}
	crashFile << "\n";
}

CState LaneMergingModelGetInitCState(const Model& currModel) {
    CState x_init(currModel.getNumCStateVar());
    uniform_real_distribution<double> uniRandVar1(-470, -300);
    x_init(0)= uniRandVar1(generator);
    
    normal_distribution<double> normalRandVar1(30, 1);
    x_init(1) = normalRandVar1(generator);
    
    uniform_real_distribution<double> uniRandVar2(-30, 30);
    x_init(2) = x_init(0) + uniRandVar2(generator);

    normal_distribution<double> normalRandVar2(30, 1);
    x_init(3) = normalRandVar2(generator);
        
    return x_init; 
}


// Simulate for one vehicle with autonomous vehicle.
bool simulation1(const NewAlphaSet & alphaSet, int nAlphas, bool randomInit, 
                 ofstream & crashFile) {
	LaneMergingModel hmshsModel;
	
    ofstream simResultFile;
    simResultFile.open("OutFiles/simResultFile.txt");
    
    int simTime = 500;
    double thresholdDist = 10;

    CState x_k(hmshsModel.getNumCStateVar());
    DState q_k;
    DObs zq_k = 0;
	
    vector<double> initQprob(hmshsModel.getNumDState(), 0);
    for (DState q = 0; q < hmshsModel.getNumDState(); q++) {
        if (q % 3 == 0) {
            initQprob[q] = 0.25;
        } else {
            initQprob[q] = 0;
        }
    }
	
	CState x_init(hmshsModel.getNumCStateVar());
	DState q_init;
	if (randomInit) {
		x_init = LaneMergingModelGetInitCState(hmshsModel);
		discrete_distribution<int> q_init_distribution(initQprob.begin(), initQprob.end());
		q_init = q_init_distribution(generator);
	} else {
		q_init = 3;
		x_init(0) = -300;
		x_init(1) = 30;
		x_init(2) = -300;
		x_init(3) = 30;
	}
	
	x_k = x_init;
	q_k = q_init;

    Belief bel(x_k, initQprob);

    DState q_next;
    CState x_next;
    DObs zq_next;

    double reward = 0;
	double J_star;
	
    for (int t = 0; t < simTime; t++){
        cout << "Time = " << t << endl;
        DControl sigma_star = FindOptimalPolicy(hmshsModel, alphaSet, bel, thresholdDist, J_star);
		writeToSimResultFile(simResultFile, q_k, x_k, bel, zq_k, sigma_star);
        
        reward = hmshsModel.getReward(q_k, x_k, sigma_star) + hmshsModel.getDiscount()*reward;
        cout << "Cumulative reward = " << reward << "\n\n";
        
        if (IsSimEnded(q_k, x_k)) break;
        
        hmshsModel.sample(q_k, x_k, sigma_star, q_next, x_next, zq_next);
        bel.BeliefUpdate(hmshsModel, sigma_star, zq_next, x_next);
        
        q_k = q_next;
        x_k = x_next;
        zq_k = zq_next;
    }
    
    simResultFile.close();
	
	if (IsCrash(x_k)) {
		RecordCrashInitialValue(crashFile, x_init, q_init);
	}
	
	return IsCrash(x_k);
}

// Simulation for two human driving vehicles and an autonomous vehicle.
bool simulation2(const NewAlphaSet & alphaSet, int nAlphas) {
	
	const int NUM_MODELS = 2;
	LaneMergingModel hmshsModel[NUM_MODELS];

    ofstream simResultFile;
    simResultFile.open("OutFiles/simResultFile2.txt");

    int simTime = 500;
    double thresholdDist = 6;

    CState x_k_tmp(hmshsModel[0].getNumCStateVar());
	vector<CState> x_k(NUM_MODELS, x_k_tmp);
    x_k[0](0) = -460;
    x_k[0](1) = 32;
    x_k[0](2) = -485;
    x_k[0](3) = 28;
	
	x_k[1](0) = -500;
	x_k[1](1) = 30;
	x_k[1](2) = x_k[0](2);
	x_k[1](3) = x_k[0](3);
	
	vector<DState> q_k;
	q_k.push_back(3);
	q_k.push_back(9);
	vector<DObs> zq_k;
	zq_k.push_back(0);
	zq_k.push_back(0);
	
    vector<double> initQprob(hmshsModel[0].getNumDState(), 0);
    for (DState q = 0; q < hmshsModel[0].getNumDState(); q++) {
        if (q % 3 == 0) {
            initQprob[q] = 0.25;
        } else {
            initQprob[q] = 0;
        }
    }
    
	vector<Belief> bel;
	bel.push_back(Belief(x_k[0], initQprob));
	bel.push_back(Belief(x_k[1], initQprob));
	
    DState q_next_tmp;
	vector<DState> q_next(NUM_MODELS, q_next_tmp);

    CState x_next_tmp;
	vector<CState> x_next(NUM_MODELS, x_next_tmp);
    DObs zq_next_tmp;
	vector<DObs> zq_next(NUM_MODELS, zq_next_tmp);
	
	double reward[] = {0, 0};
	
    for (int t = 0; t < simTime; t++){
        cout << "Time = " << t << endl;
		double J_star[NUM_MODELS];
		double J_star_max = -DBL_MAX;
		DControl sigma_star;
		
		for (int i = 0; i < NUM_MODELS; i++) {
			DControl sigma_star_tmp = FindOptimalPolicy(hmshsModel[i], alphaSet, bel[i], 
			                                            thresholdDist, J_star[i]);
			if (J_star[i] > J_star_max) {
				J_star_max = J_star[i];
				sigma_star = sigma_star_tmp;
			}
		}

		for (int i = 0; i < NUM_MODELS; i++) {
			writeToSimResultFile(simResultFile, q_k[i], x_k[i], bel[i], zq_k[i], sigma_star);
	        reward[i] = hmshsModel[i].getReward(q_k[i], x_k[i], sigma_star) + 
				        hmshsModel[i].getDiscount() * reward[i];
	        cout << "cumulative reward[" << i << "] = " << reward[i] << endl;
		}
		cout << "\n\n";
        
		for (int i = 0; i < NUM_MODELS; i++) {
			if (IsSimEnded(q_k[i], x_k[i])) {
				simResultFile.close();
				if (IsCrash(x_k[i])) {
					return true;
				}
				
				return false;
			}
		}
		
		for (int i = 0; i < NUM_MODELS; i++) {
	        hmshsModel[i].sample(q_k[i], x_k[i], sigma_star, q_next[i], x_next[i], zq_next[i]);
		}
		
        double sum = 0;
		for (int i = 0; i < NUM_MODELS; i++) {
			sum += x_next[i](2);
		}
		for (int i = 0; i < NUM_MODELS; i++) {
			x_next[i](2) = sum / (double)NUM_MODELS;
		}
		sum = 0;
		for (int i = 0; i < NUM_MODELS; i++) {
			sum += x_next[i](3);
		}
		for (int i = 0; i < NUM_MODELS; i++) {
			x_next[i](3) = sum / (double)NUM_MODELS;
		}

		for (int i = 0; i < NUM_MODELS; i++) {
			bel[i].BeliefUpdate(hmshsModel[i], sigma_star, zq_next[i], x_k[i]);
		}
        		
		x_k = x_next;
        q_k = q_next;
        zq_k = zq_next;
    }
    
    simResultFile.close();
		
	for (int i = 0; i < NUM_MODELS; i++) {
		if (IsCrash(x_k[i])) {
			return true;
		}
	}
	
	return false;;
}

int main(int argc, char** argv) {
    LaneMergingModel hmshsModel;

    int nAlphas;//, num_qq, num_zq, num_samples;
    NewAlphaSet alphaSet;

    char* policyfilename; // = "OutFiles/policyfile.txt";

	if (argc >=2) {
		policyfilename = argv[1];
	} else {
		policyfilename = "OutFiles/policyfile.txt";
	}
	bool isRandomized = false;
	if (argc >= 3 ) {
		if (argv[2][0] == 'y' || argv[2][0] == 'Y') {
			isRandomized = true;
		}
	}
	int numSimulations = 100;
	if (argc >= 4) numSimulations = stoi(argv[3]);
	ReadPolicyFile(hmshsModel, policyfilename, alphaSet, nAlphas);
    
    
//    CheckCorrectness(alphaSet);

    //-------------------------Read file finished------------------------------
    
    //-------------------------Start Simulation--------------------------------
	
	ofstream crashFile;
	crashFile.open("OutFiles/crashFile.txt");
	
	
	if(isRandomized) {
		double numCrash = 0;
		for (int i = 0; i < numSimulations; i++) {
			if (simulation1(alphaSet, nAlphas, true, crashFile)) {
				numCrash++;
			}
		}
		cout << "Number of crashes = " << numCrash << endl;
	} else {
		simulation1(alphaSet, nAlphas, false, crashFile);
	}
	crashFile.close();

	
	
//	simulation2(alphaSet, nAlphas);
    
    cout << "Done simulation!" << endl;

    return 0;    
}