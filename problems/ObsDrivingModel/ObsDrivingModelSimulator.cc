#include "ObsDrivingModel.h"
#include "BeliefSet.h"
#include "Alpha.h"
#include "Solver.h"
#include <iostream>
#include <fstream>
#include <cstdlib>

using namespace std;

DControl findoptimalpolicy(const Model& currModel, AlphaSet& alphas, Belief& b) {
    DControl sigma_star;
    double J_star = -999999999999;
    double J;
    for(AlphaSet::iterator it=alphas.begin(); it!=alphas.end(); it++){
        J = it->calvalue(currModel, b);
        if(J>J_star) {
            J_star = J;
            sigma_star = it->sigma;
        }
    }
    
    return sigma_star;
}

void checkcorrectness(AlphaSet& alpha_sol) {
    ofstream checkcorrectnessFile;
    checkcorrectnessFile.open("OutFiles/checkcorrectnessFile.txt");
    
    checkcorrectnessFile<<alpha_sol.size()<<endl;
    for(AlphaSet::iterator it  = alpha_sol.begin(); it!=alpha_sol.end(); it++){
       checkcorrectnessFile<<it->sigma<<endl;
       for(int i =0; i<it->beta.size(); i++){
           for(int j = 0; j<it->beta[i].size(); j++) {
               for(int k = 0; k<it->beta[i][j].size(); k++){
                   checkcorrectnessFile<<it->beta[i][j][k]<<"  ";
               }
               checkcorrectnessFile<<endl;
           }
       }
    }
    checkcorrectnessFile.close();
    
}

void readpolicyfile(const Model& currModel, char filename[], AlphaSet& alpha_sol, int nSamples, int& nAlphas ) {
    ifstream policyfile;
    policyfile.open(filename);
    
    if (policyfile.is_open()) {
        
        double interval = 10;
        double minzx = -5;
        vector<CObs> zx;
        CState cobstmp(currModel.getNumCStateVar(), 0);
        for(int j =0; j<nSamples; j++) {
            cobstmp[0] = minzx + j*interval/(double)nSamples;
            zx.push_back(cobstmp);
        }

        Alpha readAlpha(currModel.getNumDState(), currModel.getNumDObs(), nSamples, currModel.getDiscount());
        readAlpha.setzx_sample(zx);
        
        policyfile >> nAlphas;
        
        for(int n = 0; n<nAlphas; n++) {

            policyfile >> readAlpha.sigma;
                       
            for(DState qq = 0; qq<currModel.getNumDState(); qq++ ){
                for(DObs zq = 0; zq<currModel.getNumDObs(); zq++) {
                    for(int i = 0; i<nSamples; i++) {
                        policyfile >> readAlpha.beta[qq][zq][i]; 
                    }
                }
            }
            
            alpha_sol.push_back(readAlpha);
        }
        
        policyfile.close();
    }
    
    
}

int main(int argc, char** argv) {
    ObsDrivingModel hmshsmodel;
    
    
    int nAlphas;//, num_qq, num_zq, num_samples;
    int nSamples = 1000;
    AlphaSet alpha_sol;
    char policyfilename[] = "OutFiles/policyfile.txt";
    
    readpolicyfile(hmshsmodel, policyfilename, alpha_sol, nSamples, nAlphas);
    
    checkcorrectness(alpha_sol);

    //-------------------------Read file finished------------------------------
    
    //-------------------------Start Simulation--------------------------------
    
    ofstream simResultFile;
    simResultFile.open("OutFiles/simResultFile.txt");
    
    int SimTime = 1000;
    CState x_k(hmshsmodel.getNumCStateVar(), 0);
    DState q_k = 0;
    vector<double> prob_init(hmshsmodel.getNumDState(), 0); 
    prob_init[q_k] = 1.0;   
    Belief bel(x_k, prob_init);
    
    simResultFile<<q_k<<"  ";
    for(int j = 0; j<x_k.size(); j++) simResultFile<<x_k[j]<<"  ";
    for(int j = 0; j<bel.DStateProb.size(); j++) simResultFile<<bel.DStateProb[j]<<"  ";
    simResultFile<<q_k<<"  ";
    
    DState q_next;
    CState x_next;
    DObs zq_next;
    for(int t = 0; t < SimTime; t++){
        cout<< t<<endl;
        DControl sigma_star = findoptimalpolicy(hmshsmodel, alpha_sol, bel);
        hmshsmodel.sample(q_k, x_k, sigma_star, q_next, x_next, zq_next);
        bel.BeliefUpdate(hmshsmodel, sigma_star, zq_next, x_next);
        
        simResultFile<<sigma_star<<"\n";
        simResultFile<<q_next<<"  ";
        for(int j = 0; j<x_next.size(); j++) simResultFile<<x_next[j]<<"  ";
        for(int j = 0; j<bel.DStateProb.size(); j++) simResultFile<<bel.DStateProb[j]<<"  ";
        simResultFile<<zq_next<<"  ";
        
        q_k = q_next;
        x_k = x_next;
    }
    simResultFile<<0<<"\n"; // Last sigma_star, not used
    
    simResultFile.close();

    
    
    return 0;
    
}