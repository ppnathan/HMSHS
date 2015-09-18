#include "Solver.h"
#include "Utilities.h"
#include <list>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <fstream>

using namespace std;

void getBeliefsSet(const Model& currModel, int numBeliefs, BeliefSet& RandomBeliefs) {
    
    ifstream BelSelectionFile;
    BelSelectionFile.open("OutFiles_OldSolver/BeliefsSelection.txt");
    
    Belief BeliefRead(CState(currModel.getNumCStateVar(), 0), vector<double>(currModel.getNumDState(), 0));
    for(int i  = 0; i<numBeliefs; i++){
        for(int j =0; j<currModel.getNumCStateVar(); j++)
            BelSelectionFile >>BeliefRead.cstate[j];
        for(int j =0; j<currModel.getNumDState(); j++)
            BelSelectionFile >>BeliefRead.DStateProb[j];
            
        RandomBeliefs.bset.push_back(BeliefRead);
    }
    BelSelectionFile.close();
    
    printf("Generated random belief set!\n");
}

void writepolicyfile(char filename[], AlphaSet& alphaset) {
    ofstream policyfile;
    policyfile.open(filename);
    policyfile<<alphaset.size()<<endl;
    for(AlphaSet::iterator it  = alphaset.begin(); it!=alphaset.end(); it++){
       policyfile<<it->sigma<<endl;
       for(int i =0; i<it->beta.size(); i++){
           for(int j = 0; j<it->beta[i].size(); j++) {
               for(int k = 0; k<it->beta[i][j].size(); k++){
                   policyfile<<it->beta[i][j][k]<<"  ";
               }
               policyfile<<endl;
           }
       }
    }
    policyfile.close();
}

AlphaSet Solver::solve(const Model& currModel, const CState& initCState, const DState& initDState, int numBeliefs, vector<CObs>& zx_samples, double zx_interval){
    
//    numBeliefs = 25;

    ofstream debugfile;
    ofstream bestvaluefile;
    
    debugfile.open("OutFiles_OldSolver/SolverDebug.txt");
    bestvaluefile.open("OutFiles_OldSolver/BestValue.txt");
//    ofstream samplevaluefile;
//    samplevaluefile.open("OutFiles/SampleValue.txt");
    char policyfilename[] = "OutFiles_OldSolver/policyfile.txt";
    
    BeliefSet RandomBeliefs(numBeliefs);
    getBeliefsSet(currModel, numBeliefs, RandomBeliefs);
            
    
    //-----------------Init the alpha set and best value J_0(b)--------------
    Alpha newalpha(currModel.getNumDState(), currModel.getNumDObs(), nSamples, currModel.getDiscount());
    list<int> bestAlphaIdx;
    list<double> bestValueSet;
    list<double> bestValueSetCopy;
    AlphaSet alphaset;
    double J_zero;
    int count = 0;
    
    for(list<Belief>::iterator it = RandomBeliefs.bset.begin(); it != RandomBeliefs.bset.end(); it++) {
        J_zero = newalpha.initSigma(currModel, *it);
        alphaset.push_back(newalpha);
        bestAlphaIdx.push_back(count);
        bestValueSet.push_back(J_zero);
        bestValueSetCopy.push_back(J_zero);
        debugfile<<"["<<count<<"]"<<J_zero<<"   ";
        bestvaluefile<<J_zero<<"   ";
        count++;
    }
    debugfile<<endl;
    bestvaluefile<<currModel.getNumDControls()<<endl; // 2 is the number of alpha functions 
    
    //------------------Perseus iteration begins------------------------------
    printf("Perseus iteration begins\n");
    double randbeliefidx;
    int numBeliefremain;
    AlphaSet newAlphaSet;
    
    bool finished = false;
    int iter = 0;
    int numSameAlpha = 0;
    int numNewAlpha = 0;
    
    int countnumbackup = 0;
    
// //    std::uniform_real_distribution<double> distribution(-5, 5);
//     vector<double> zx_tmp_for_testing;
//     for(int j =0; j<nSamples; j++) {
// //        zx_tmp_for_testing.push_back(distribution(generator));
// //        samplevaluefile<<zx_tmp_for_testing[j]<<"  ";
//         zx_tmp_for_testing.push_back(-5 + j*10/(double)nSamples);
//     }
// //    samplevaluefile.close();
    
    while(!finished) {
        
        ++iter;
        
        newAlphaSet.clear();
        list<Belief> newBeliefs(RandomBeliefs.bset);
        
        list<Belief>::iterator it_belief;
        list<double>::iterator it_bestvalue;
        list<int>::iterator it_alphaidx;
        
        list<Belief>::iterator it_randbelief;
        list<double>::iterator it_randbestvalue;
        list<int>::iterator it_randalphaidx;

        
        printf("Iteration %d\n", iter);
        /*
        if(iter == 16)
            printf("For debug\n");
        */
        numSameAlpha = 0;
        numNewAlpha = 0;
        countnumbackup = 0;
        
        numBeliefremain = numBeliefs;
        
        while(!newBeliefs.empty()) {
            /*
            if(countnumbackup ==100)
                printf("For debug\n");
            */
            countnumbackup++;
            randbeliefidx = generator() % numBeliefremain;
            it_randbelief = newBeliefs.begin();
            it_randbestvalue = bestValueSet.begin();
            it_randalphaidx = bestAlphaIdx.begin();
            
            for(int i = 0; i<randbeliefidx; i++){
                it_randbelief++;
                it_randbestvalue++;
                it_randalphaidx++;
            }
            
            double newJvalue = newalpha.backup(currModel, alphaset, *it_randbelief, zx_samples, zx_interval);
            cout<<newJvalue<<endl;
            debugfile<<"["<<randbeliefidx<<"]"<<newJvalue;
            
            if( newJvalue >= *it_randbestvalue) {
                it_belief = newBeliefs.begin();
                it_bestvalue = bestValueSet.begin();
                it_alphaidx = bestAlphaIdx.begin();
                
                while(it_belief != newBeliefs.end()) {
                    if( newalpha.calvalue(currModel, *it_belief) >= *it_bestvalue) {
                        it_belief = newBeliefs.erase(it_belief);
                        it_bestvalue = bestValueSet.erase(it_bestvalue);
                        it_alphaidx = bestAlphaIdx.erase(it_alphaidx);
                        
                        numBeliefremain--;
                    }
                    else {
                        it_belief++;
                        it_bestvalue++;
                        it_alphaidx++;
                    }
                }
                
                newAlphaSet.push_back(newalpha);
                debugfile<<"("<<newalpha.sigma<<")   ";
                numNewAlpha++;
            }
            else {
                debugfile<<"(rejected)   ";
                numSameAlpha++;
                
                newAlphaSet.push_back(alphaset[*it_randalphaidx]);
                newBeliefs.erase(it_randbelief);
                bestValueSet.erase(it_randbestvalue);
                bestAlphaIdx.erase(it_randalphaidx);
                
                numBeliefremain--;
            }
            
        }
        
        printf("Check convergency.\nNumber of same alphas = %d. Number of new alphas = %d\n", numSameAlpha, numNewAlpha);
        
        alphaset = newAlphaSet;
        
        //----------------Print alpha(q=0, x=0) and alpha(q=1,x=0) to debug file--------------------
        debugfile<<"\nnumber of alpha = "<<newAlphaSet.size()<<": ";
        CState xtmp(currModel.getNumCStateVar(), 0);
        for(int i = 0; i<alphaset.size(); i++) {
            debugfile<<"("<<alphaset[i].sigma<<": ";
            
            for(int j = 0; j<currModel.getNumDState(); j++){
                debugfile<<alphaset[i].AlphaValue(currModel, j, xtmp)<<",";
            }
            debugfile<<")   ";
            
        }
        debugfile<<endl;
        
        //-----------calculating best value for each belief--------------------
        double value;
        double bestvalue;
        int bestalphaidx;
        
        it_bestvalue = bestValueSetCopy.begin();
        finished  = true;
        count = 0;
        
        debugfile<<iter<<"  ";
        for(list<Belief>::iterator it = RandomBeliefs.bset.begin(); it!= RandomBeliefs.bset.end(); it++) {
            
            bestvalue = -99999999;
            bestalphaidx = 0;
            
            for(int j = 0; j<alphaset.size(); j++) {
                value = alphaset[j].calvalue(currModel, *it);
                if(value > bestvalue) {
                    bestvalue = value;
                    bestalphaidx = j;
                }
            }
            bestValueSet.push_back(bestvalue);
            bestAlphaIdx.push_back(bestalphaidx);
            
            if(abs(bestvalue - *it_bestvalue)/bestvalue > precision)
                finished = false;
            
            *it_bestvalue = bestvalue;
            
            debugfile<<"["<<count<<"]"<<bestvalue<<"("<<bestalphaidx<<")   ";
            bestvaluefile<<bestvalue<<"   ";
            count++;
            it_bestvalue++;
            
        }
        debugfile<<"\n\n";
        bestvaluefile<<alphaset.size()<<endl;
        
        writepolicyfile(policyfilename, alphaset);
        
        if(iter>maxIter)
            finished  = true;
    }
    
    return alphaset;
    
    
}
