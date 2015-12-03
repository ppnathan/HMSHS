#include "LaneMergingModel.h"
#include "BeliefSet.h"
#include "NewAlpha.h"
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
                           const Belief& b, double thresholdDist) {
    DControl sigma_star = -1;
    double J_star = -DBL_MAX;
    
    double minDist = DBL_MAX;
    NewAlphaSet::const_iterator minDistIterator = alphaSet.end();
    for (NewAlphaSet::const_iterator it = alphaSet.begin(); it != alphaSet.end(); it++){
        double dist = (it->mLocalx - b.cstate).norm();
        if (dist < thresholdDist) {
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
        sigma_star = minDistIterator->mSigma;
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

bool IsSimEnded(DState & q, CState & x) {
    return max(x(0), x(2)) > 30;
}

int main(int argc, char** argv) {
    LaneMergingModel hmshsModel;

    int nAlphas;//, num_qq, num_zq, num_samples;
    NewAlphaSet alphaSet;
    char policyfilename[] = "OutFiles/policyfile.txt";
    
//  cout << "test 1" << endl;
    ReadPolicyFile(hmshsModel, policyfilename, alphaSet, nAlphas);
//    cout << "test 2" << endl;
//    CheckCorrectness(alphaSet);

    //-------------------------Read file finished------------------------------
    
    //-------------------------Start Simulation--------------------------------
    
    ofstream simResultFile;
    simResultFile.open("OutFiles/simResultFile.txt");
    
    int simTime = 500;
    double thresholdDist = 6;

    CState x_k(hmshsModel.getNumCStateVar());
    x_k(0) = -460;
    x_k(1) = 30;
    x_k(2) = -500;
    x_k(3) = 30;
    
    DState q_k = 3;
    DObs zq_k = 0;
    
    vector<double> initQprob(hmshsModel.getNumDState(), 0);
    for (DState q = 0; q < hmshsModel.getNumDState(); q++) {
        if (q % 3 == 0) {
            initQprob[q] = 0.25;
        } else {
            initQprob[q] = 0;
        }
    }
    
    Belief bel(x_k, initQprob);

    DState q_next;
    CState x_next;
    DObs zq_next;

    double reward = 0;

    for (int t = 0; t < simTime; t++){
        cout << "Time = " << t << endl;
        DControl sigma_star = FindOptimalPolicy(hmshsModel, alphaSet, bel, thresholdDist);
        simResultFile << q_k << "  ";
        cout << "q = " << q_k << ", x = (";
        for (int j = 0; j < x_k.size(); j++) {
            simResultFile << x_k[j] << "  ";
            cout << x_k[j] << ", ";
        } 
        cout << ")\nbq = (";
        for (int j = 0; j < bel.DStateProb.size(); j++) {
            simResultFile << bel.DStateProb[j] << "  ";
            cout << bel.DStateProb[j] << ", ";
        }
        simResultFile << zq_k << "  " << sigma_star << endl;
        cout << ")\nzq = " << zq_k << ", sigma = " << sigma_star << endl;
        
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
    
    cout << "Done simulation!" << endl;

    return 0;    
}