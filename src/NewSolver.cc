#include "NewSolver.h"
#include "Utilities.h"
#include <list>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <fstream>

using namespace std;

// typedef struct DistWithIdx {
//     double dist;
//     int idx;
// } DistWithIdx;
// 


// bool mycompfn(DistWithIdx elem1, DistWithIdx elem2){
//     return elem1.dist < elem2.dist;
// }  


void getBeliefsSet(const Model& currModel, int numBeliefs, BeliefSet& RandomBeliefs) {
    
    ifstream BelSelectionFile;
    BelSelectionFile.open("OutFiles/BeliefsSelection.txt");
    
    Belief BeliefRead(CState(currModel.getNumCStateVar(), 0), vector<double>(currModel.getNumDState(), 0));
    for(int i  = 0; i<numBeliefs; i++){
        for(int j =0; j<currModel.getNumCStateVar(); j++)
            BelSelectionFile >>BeliefRead.cstate[j];
        for(int j =0; j<currModel.getNumDState(); j++)
            BelSelectionFile >>BeliefRead.DStateProb[j];
            
        RandomBeliefs.bset.push_back(BeliefRead);
    }
    BelSelectionFile.close();
    
    // vector<vector<DistWithIdx> > distmatrix;
    // DistWithIdx distandidx;
    // 
    // int i = 0;
    // for(list<Belief>::iterator it1 =RandomBeliefs.bset.begin(); it1 != RandomBeliefs.bset.end(); it1++){
    //     int j = 0;
    //     vector<DistWithIdx> distmatrixonedim;
    //     for(list<Belief>::iterator it2 = RandomBeliefs.bset.begin(); it2 != RandomBeliefs.bset.end(); it2++){
    //         distandidx.dist = getdist(it1->cstate, it2->cstate);
    //         distandidx.idx = j;
    //         distmatrixonedim.push_back(distandidx);
    //         j++;
    //     }
    //     distmatrix.push_back(distmatrixonedim);
    //     i++;
    // }
    // 
    // for(i = 0; i<numBeliefs; i++){
    //     sort(distmatrix[i].begin(), distmatrix[i].end(), mycompfn);
    // }
    
    printf("Generated random belief set!\n");
};

void writepolicyfile(char filename[], NewAlphaSet& alphaset) {
    ofstream policyfile;
    policyfile.open(filename);
    policyfile<<alphaset.size()<<endl;
    for(NewAlphaSet::iterator it  = alphaset.begin(); it!=alphaset.end(); it++){
       policyfile<<it->sigma<<"  ";
       for(int i =0; i<it->localx.size(); i++) policyfile<<it->localx[i]<<"  ";
       policyfile<<endl;
       for(int i =0; i<it->coeff.size(); i++){
           for(int j = 0; j<it->coeff[i].size(); j++) {
               policyfile<<it->coeff[i][j]<<"  ";  
           }
           policyfile<<endl;
       }
    }
    policyfile.close();
};

double NewSolver::getdist(const CState& x1, const CState& x2){
    double EuclideanNorm = 0;
    for (int i = 0; i < x1.size(); i++){
          EuclideanNorm += (x1[i] - x2[i])*(x1[i] - x2[i]);
    }
     return sqrt(EuclideanNorm);
};

NewAlphaSet NewSolver::solve(const Model& currModel, const CState& initCState, const DState& initDState, int numBeliefs, double thresholddist){

    ofstream debugfile;
	ofstream debugfile_last;
    ofstream bestvaluefile;
    
    debugfile.open("OutFiles/SolverDebug.txt");
	
    bestvaluefile.open("OutFiles/BestValue.txt");
    
    char policyfilename[] = "OutFiles/policyfile.txt";
    
    BeliefSet RandomBeliefs(numBeliefs);
    getBeliefsSet(currModel, numBeliefs, RandomBeliefs);
    
    //-----------------Init the alpha set and best value J_0(b)--------------
    
    NewAlpha newalpha(currModel.getNumDState(), currModel.getDiscount());
    list<int> bestAlphaIdx;
    list<double> bestValueSet;
    list<double> bestValueSetCopy;
    NewAlphaSet alphaset;
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
    NewAlphaSet UpdatedAlphaSet;
    
    bool finished = false;
    int iter = 0;
    int numSameAlpha = 0;
    int numNewAlpha = 0;
    
    int countnumbackup = 0;
    
    while(!finished) {
        
        printf("Iteration %d\n", iter++);
        
        UpdatedAlphaSet.clear();
        list<Belief> newBeliefs(RandomBeliefs.bset);
        
        list<Belief>::iterator it_belief;
        list<double>::iterator it_bestvalue;
        list<int>::iterator it_alphaidx;
        
        list<Belief>::iterator it_randbelief;
        list<double>::iterator it_randbestvalue;
        list<int>::iterator it_randalphaidx;
        
        numSameAlpha = 0;
        numNewAlpha = 0;
        countnumbackup = 0;
        
        numBeliefremain = numBeliefs;
        
        while(!newBeliefs.empty()) {
            
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
            cout<<"Number of beliefs remain = "<<numBeliefremain<<endl;
			vector<int> optimalalphaidx;
            double newJvalue = newalpha.backup(currModel, alphaset, *it_randbelief, thresholddist, optimalalphaidx);
            cout<<"newJvalue = "<<newJvalue<<"  it_randbestvalue = "<<*it_randbestvalue<<endl;
            debugfile<<"["<<randbeliefidx<<"]"<<newJvalue;
            
            if( newJvalue >= *it_randbestvalue) {
                it_belief = newBeliefs.begin();
                it_bestvalue = bestValueSet.begin();
                it_alphaidx = bestAlphaIdx.begin();
				
				
				
                
                while(it_belief != newBeliefs.end()) {
					
					double Jvaluewithnewalpha = newalpha.calvalue(currModel, *it_belief);
					double dist = getdist(it_belief->cstate, newalpha.localx);
					cout<<"Jvaluewithnewalpha = "<<Jvaluewithnewalpha<<"   dist between ("<<it_belief->cstate[0]<<","<<newalpha.localx[0]<<") = "<<dist<<endl;
					//cout<<"it_bestvalue = "<< *it_bestvalue<<endl; 
                    if( Jvaluewithnewalpha - *it_bestvalue >= -1e-6  && dist< thresholddist ) {
						//cout<<"In"<<endl;
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
                
                UpdatedAlphaSet.push_back(newalpha);
                debugfile<<"(sigma="<<newalpha.sigma<<" from alphas("<<optimalalphaidx[0]<<","<<optimalalphaidx[1]<<"))   ";
                numNewAlpha++;
            }
            else {
                debugfile<<"(rejected)   ";
                numSameAlpha++;
                
                UpdatedAlphaSet.push_back(alphaset[*it_randalphaidx]);
                newBeliefs.erase(it_randbelief);
                bestValueSet.erase(it_randbestvalue);
                bestAlphaIdx.erase(it_randalphaidx);
                
                numBeliefremain--;
            }
			
        }
        
        printf("Check convergency.\nNumber of same alphas = %d. Number of new alphas = %d\n", numSameAlpha, numNewAlpha);
        
        alphaset = UpdatedAlphaSet;
        
        //----------------Print alpha(q=0, x=0) and alpha(q=1,x=0) to debug file--------------------
        debugfile<<"\n\n number of alpha = "<<UpdatedAlphaSet.size()<<": ";
//        CState xtmp(currModel.getNumCStateVar(), 0);
        for(int i = 0; i<alphaset.size(); i++) {
			debugfile<<"["<<i<<"]";
            debugfile<<"("<<alphaset[i].sigma<<", [";
            for(int j =0; j<alphaset[i].localx.size(); j++) debugfile<<alphaset[i].localx[j]<<",";
            debugfile<<"]: ";
            
            for(int j = 0; j<currModel.getNumDState(); j++){
                debugfile<<alphaset[i].AlphaValue(j, alphaset[i].localx)<<",";
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
        
		debugfile_last.open("OutFiles/SolverDebug_Last.txt");
        debugfile<<"\n"<<iter<<"  ";
		debugfile_last<<"\n"<<iter<<"  ";
//		cout<<"checkpoint 1\n";
        for(list<Belief>::iterator it = RandomBeliefs.bset.begin(); it!= RandomBeliefs.bset.end(); it++) {
            
            bestvalue = -99999999;
            bestalphaidx = 0;
//            cout<<"checkpoint 2\n";
            for(int j = 0; j<alphaset.size(); j++) {
                if(getdist(it->cstate, alphaset[j].localx) < thresholddist) {
                    value = alphaset[j].calvalue(currModel, *it);
                    if(value > bestvalue) {
                        bestvalue = value;
                        bestalphaidx = j;
                    }
                }
            }
//			cout<<"checkpoint 3\n";
            bestValueSet.push_back(bestvalue);
            bestAlphaIdx.push_back(bestalphaidx);
//            cout<<"checkpoint 4\n";
            if(abs(bestvalue - *it_bestvalue)/bestvalue > precision)
                finished = false;
            
            *it_bestvalue = bestvalue;
            
            debugfile<<"["<<count<<"]"<<bestvalue<<"("<<bestalphaidx<<")("<<alphaset[bestalphaidx].sigma<<")    ";
            debugfile_last<<"["<<count<<"]"<<bestvalue<<"("<<bestalphaidx<<")("<<alphaset[bestalphaidx].sigma<<")    ";
			
            bestvaluefile<<bestvalue<<"   ";
            count++;
            it_bestvalue++;
            
        }
        debugfile<<"\n\n===================================================================\n\n";
		debugfile_last.close();
        bestvaluefile<<alphaset.size()<<endl;
        
        writepolicyfile(policyfilename, alphaset);
        
        if(iter>maxIter)
            finished  = true;
    }
    
    return alphaset;
    
    
}






























