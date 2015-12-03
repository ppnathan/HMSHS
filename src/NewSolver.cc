#include "NewSolver.h"
#include "Utilities.h"
#include <list>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <fstream>

using namespace std;

void getBeliefsSet(char beliefsFile[], const Model& currModel,
                   int numBeliefs, BeliefSet& RandomBeliefs) {
    
    ifstream BelSelectionFile;
    BelSelectionFile.open(beliefsFile);
    
    Belief BeliefRead(CState::Zero(currModel.getNumCStateVar()),
                      vector<double>(currModel.getNumDState(), 0));

    for (int i  = 0; i < numBeliefs; i++) {
        for (int j = 0; j < currModel.getNumCStateVar(); j++)
            BelSelectionFile >> BeliefRead.cstate(j);
        for (int j = 0; j < currModel.getNumDState(); j++)
            BelSelectionFile >> BeliefRead.DStateProb[j];
            
        RandomBeliefs.bset.push_back(BeliefRead);
    }
    BelSelectionFile.close();
    
    cout << "Belief set was read!" << endl;
};

double getdist(const CState& x1, const CState& x2) {
    VectorXd diff = x1 - x2;
    return diff.norm();
};

void writepolicyfile(char filename[], const NewAlphaSet& alphaset) {
    ofstream policyfile;
    policyfile.open(filename);
    policyfile << alphaset.size() << endl;
//  cout << "NewSolver.writepolicyfile() check point 1\n";
    for (NewAlphaSet::const_iterator it  = alphaset.begin(); it != alphaset.end(); it++) {
       policyfile << it->mSigma << "  ";

//     cout << "NewSolver.writepolicyfile() check point 2\n";

       for (int i = 0; i < it->mLocalx.size(); i++) {
           policyfile << it->mLocalx(i) << "  ";
       }
       policyfile << endl;
       
//     cout << "NewSolver.writepolicyfile() check point 3\n";
       
       // e.g constant term: a0, 1st order term a1 = [a11 a12]^T, 
       // 2nd order term a2 = [a211  a212]
       //                     [a221  a222]
       // The order of coefficients represented in the policy file will be:
       // a0  a11  a12  a211  a221  a212  a222
       for (int i = 0; i < it->mCoeff.size(); i++) {
           // Write constant term: 
//         cout << "NewSolver.writepolicyfile() check point 4\n";
           
           policyfile << it->mCoeff[i][0] << "  ";
//		   cout << "it->mCoeff[i][0] = " << it->mCoeff[i][0] << endl; 
//         cout << "NewSolver.writepolicyfile() check point 5\n";
           // Write first order term:
           for (int j  = 0; j < it->mCoeff[i][1].rows(); j++) {
               policyfile << it->mCoeff[i][1](j) << "  ";  
           }
//		   cout << "it->mCoeff[i][1] = " << it->mCoeff[i][1] << endl; 
//         cout << "NewSolver.writepolicyfile() check point 6\n";
           // Write second order term:
           for (int j  = 0; j < it->mCoeff[i][2].cols(); j++) {
               for (int k = 0; k < it->mCoeff[i][2].rows(); k++) {
                   policyfile << it->mCoeff[i][2](k, j) << "  ";  
               }
           }
//		   cout << "it->mCoeff[i][2] = " << it->mCoeff[i][2] << endl; 

           policyfile << endl;
       }
    }
    policyfile.close();
};

/*
Abstract:  Select a random belief. Direct the three iterators to the index of that belief.
Inputs:    newBeliefs
           bestValueSet
           bestAlphaIdx
           numBeliefRemain

Outputs:   <return>                 Randomly generated index of the selected belief.
           it_randbelief
           it_randbestvalue
           it_randalphaidx 
*/
int DirectIteratorsToRandBeliefIdx(list<Belief> & newBeliefs, 
                                   list<double> & bestValueSet, 
                                   list<int> & bestAlphaIdx, 
                                   list<Belief>::iterator & it_randbelief, 
                                   list<double>::iterator & it_randbestvalue, 
                                   list<int>::iterator & it_randalphaidx,
                                   int numBeliefRemain) {
    it_randbelief = newBeliefs.begin();
    it_randbestvalue = bestValueSet.begin();
    it_randalphaidx = bestAlphaIdx.begin();

    int randBeliefIdx = generator() % numBeliefRemain;
    for (int i = 0; i < randBeliefIdx; i++){
        it_randbelief++;
        it_randbestvalue++;
        it_randalphaidx++;
    }
    
    return randBeliefIdx;
};

/*
Abstract:  Rules out all the beliefs that were improved by the new alpha. If the belief is improved,
           erase it from the list. Otherwise remain it int he list
Inputs:    currModel
           newalpha
           thresholdDist

Outputs:   <return>                 Randomly generated index of the selected belief.
           newBeliefs
           bestValueSet
           bestAlphaIdx 
*/
int RuleOutAllImprovedBeliefs(const Model& currModel, const NewAlpha& newalpha, int thresholdDist,
                              list<Belief>& newBeliefs, list<double>& bestValueSet, 
                              list<int>& bestAlphaIdx) {
    list<Belief>::iterator it_belief = newBeliefs.begin();
    list<double>::iterator it_bestvalue = bestValueSet.begin();
    list<int>::iterator it_alphaidx = bestAlphaIdx.begin();
    
    int numBeliefsRuledOut = 0;
                
    while(it_belief != newBeliefs.end()) {
        double dist = getdist(it_belief->cstate, newalpha.mLocalx);
        cout << "dist between (" << it_belief->cstate(0) << ", " << newalpha.mLocalx(0)
             << ") = " << dist << endl;
        if (dist < thresholdDist) {
            double JValueWithNewAlpha = newalpha.calvalue(currModel, *it_belief);
            if (JValueWithNewAlpha - *it_bestvalue >= -1e-6) {
                cout << "Jvaluewithnewalpha = " << JValueWithNewAlpha << endl;
                it_belief = newBeliefs.erase(it_belief);
                it_bestvalue = bestValueSet.erase(it_bestvalue);
                it_alphaidx = bestAlphaIdx.erase(it_alphaidx);

                numBeliefsRuledOut++;
            }
            else {
                it_belief++;
                it_bestvalue++;
                it_alphaidx++;
            }
        }
        else {
            it_belief++;
            it_bestvalue++;
            it_alphaidx++;
        }
    }

    return numBeliefsRuledOut;
};

void PrintAllAlphasToDebugFile(const Model& currModel, const NewAlphaSet& alphaset, 
                               ofstream& debugfile) {
    debugfile << "\n\nnumber of alpha = " << alphaset.size() << ": ";
    for (int i = 0; i < alphaset.size(); i++) {
        debugfile << "[" << i << "]";
        debugfile << "(" << alphaset[i].mSigma << ", [";
        for (int j = 0; j < alphaset[i].mLocalx.size(); j++) {
            debugfile << alphaset[i].mLocalx(j) << ", ";
        }
        debugfile << "]: ";
            
        for (int j = 0; j < currModel.getNumDState(); j++) {
            debugfile << alphaset[i].AlphaValue(j, alphaset[i].mLocalx) << ", ";
        }
        debugfile << ")   ";
    }
    debugfile << endl;
};

/*
Abstract:  For each belief in the belief set, we calculate the best value for it based on the new
           alpha set. Write the best value and debug information to corresponding files.
Inputs:    lastResultsFilePath      The file path to store the debugging information of the last
                                    iteration.
           debugfile                The normal file object for all debugging information.
           bestvaluefile            The file object storing the best value for all the beliefs.
           beliefsSet               The belief set.
           alphaset                 The resulting alpha set.
           currModel                The current model.
           iter                     The current iteration.
           thresholdDist            The threshold to consider whether the distance between the
                                    alpha and belief is close enough.
           precision                The precision to decide whether the value function converges.
           bestValueSetCopy         
           

Outputs:   <return>                 Whether the value function converges.
           bestValueSetCopy         A copy of the best value for all beliefs. We will update this
                                    value set as well.
           bestValueSet             The updated best values for all beliefs.
           bestAlphaIdx             The alphas corresponding to the best value.
*/
bool CalculateAndWriteBestValueForBeliefs(char lastResultsFilePath[],
                                          ofstream& debugfile,
                                          ofstream& bestvaluefile,
                                          const list<Belief>& beliefsSet,
                                          const NewAlphaSet& alphaset, 
                                          const Model& currModel, 
                                          int iter,
                                          double thresholdDist,
                                          double precision,
                                          list<double>& bestValueSetCopy, 
                                          list<double>& bestValueSet,
                                          list<int>& bestAlphaIdx) {
    double value;
    double bestvalue;
    int bestalphaidx;

    list<double>::iterator it_bestvalue = bestValueSetCopy.begin();
    bool finished  = true;
    int count = 0;

    ofstream debugfile_last;
    debugfile_last.open(lastResultsFilePath);
    debugfile << "\n" << iter << "  ";
    debugfile_last << "\n" << iter << "  ";
//    cout<<"checkpoint 1\n";
    for(list<Belief>::const_iterator it = beliefsSet.begin(); it!= beliefsSet.end(); it++) {
        bestvalue = -99999999;
        bestalphaidx = 0;
//        cout<<"checkpoint 2, count = " << count << endl;
        for (int j = 0; j < alphaset.size(); j++) {
            if (getdist(it->cstate, alphaset[j].mLocalx) < thresholdDist) {
                value = alphaset[j].calvalue(currModel, *it);
                if (value > bestvalue) {
                    bestvalue = value;
                    bestalphaidx = j;
                }
            }
        }
//      cout<<"checkpoint 3\n";
        bestValueSet.push_back(bestvalue);
        bestAlphaIdx.push_back(bestalphaidx);
//        cout<<"checkpoint 4\n";
        if (abs(bestvalue - *it_bestvalue) / bestvalue > precision) {
            finished = false;
        }
            
        *it_bestvalue = bestvalue;
            
        debugfile << "[" << count << "]" << bestvalue << "(" << bestalphaidx << ")(" 
                  << alphaset[bestalphaidx].mSigma << ")    ";
        debugfile_last << "[" << count << "]" << bestvalue << "(" << bestalphaidx << ")(" 
                       << alphaset[bestalphaidx].mSigma << ")    ";
            
        bestvaluefile << bestvalue << "   ";
        count++;
        it_bestvalue++;
    }
    debugfile << "\n\n===================================================================\n\n";
    debugfile_last.close();
    bestvaluefile << alphaset.size() << "\n" << endl;
    
    return finished;
};

NewAlphaSet NewSolver::solve(const Model& currModel, const CState& initCState, 
                             const DState& initDState, int numBeliefs, double thresholdDist) {
    ofstream debugfile;
    ofstream bestvaluefile;

    debugfile.open("OutFiles/SolverDebug.txt");
    bestvaluefile.open("OutFiles/BestValue.txt");
    char policyfilename[] = "OutFiles/policyfile.txt";
    char debugfile_lastResultPath[] = "OutFiles/SolverDebug_Last.txt";
    char beliefsSelectionFilePath[] = "OutFiles/BeliefsSelection.txt";

    BeliefSet RandomBeliefs(numBeliefs);
    getBeliefsSet(beliefsSelectionFilePath, currModel, numBeliefs, RandomBeliefs);
    
    //-----------------Init the alpha set and best value J_0(b)--------------
    
    NewAlpha newalpha(currModel.getNumDState(), currModel.getNumCStateVar(),
                      currModel.getDiscount());
    list<int> bestAlphaIdx;
    list<double> bestValueSet;
    list<double> bestValueSetCopy;
    NewAlphaSet alphaset;
    double J_zero;
    int count = 0;
    
    for (list<Belief>::iterator it = RandomBeliefs.bset.begin(); 
                                it != RandomBeliefs.bset.end(); it++) {
        J_zero = newalpha.initSigma(currModel, *it);
        alphaset.push_back(newalpha);
        bestAlphaIdx.push_back(count);
        bestValueSet.push_back(J_zero);
        bestValueSetCopy.push_back(J_zero);
        
        debugfile << "[" << count << "]" << J_zero << "[" << newalpha.mSigma << "]   ";
        bestvaluefile << J_zero << "   ";
        count++;
    }
    debugfile << "\n\n===================================================================\n\n";
    bestvaluefile << currModel.getNumDControls() << endl;
    
    //------------------Perseus iteration begins------------------------------
    printf("Perseus iteration begins\n");
    double randbeliefidx;
    int numBeliefRemain;
    NewAlphaSet UpdatedAlphaSet;
    
    bool finished = false;
    int iter = 0;
    int numSameAlpha = 0;
    int numNewAlpha = 0;
    
    int countnumbackup = 0;
    
    while (!finished) {
        
        printf("Iteration %d\n", iter++);
        
        UpdatedAlphaSet.clear();
        list<Belief> newBeliefs(RandomBeliefs.bset);
        
        list<Belief>::iterator it_randbelief;
        list<double>::iterator it_randbestvalue;
        list<int>::iterator it_randalphaidx;
        
        numSameAlpha = 0;
        numNewAlpha = 0;
        countnumbackup = 0;
        
        numBeliefRemain = numBeliefs;
        
        while (!newBeliefs.empty()) {
            countnumbackup++;
            cout << "Number of beliefs remain = " << numBeliefRemain << endl;
            randbeliefidx = DirectIteratorsToRandBeliefIdx(newBeliefs, bestValueSet, bestAlphaIdx, 
                                it_randbelief, it_randbestvalue, it_randalphaidx, numBeliefRemain);
            
            vector<int> optimalalphaidx;
            double newJvalue = newalpha.backup(currModel, alphaset, *it_randbelief, thresholdDist,
                                               optimalalphaidx);
            cout << "newJvalue = " << newJvalue << "  it_randbestvalue = " << *it_randbestvalue 
                 << endl;
            debugfile << "[" << randbeliefidx << "]" << newJvalue;
            
            if ( newJvalue >= *it_randbestvalue) {
                numBeliefRemain -= 
                    RuleOutAllImprovedBeliefs(currModel, newalpha, thresholdDist, newBeliefs,
                                              bestValueSet, bestAlphaIdx);
                
                UpdatedAlphaSet.push_back(newalpha);
                debugfile << "(sigma=" << newalpha.mSigma << " from alphas(" << optimalalphaidx[0]
                          << "))   ";
                numNewAlpha++;
            }
            else {
                debugfile << "(rejected)   ";
                numSameAlpha++;
                
                UpdatedAlphaSet.push_back(alphaset[*it_randalphaidx]);
                newBeliefs.erase(it_randbelief);
                bestValueSet.erase(it_randbestvalue);
                bestAlphaIdx.erase(it_randalphaidx);
                
                numBeliefRemain--;
            }
        }
        
        printf("Check convergency.\nNumber of same alphas = %d. Number of new alphas = %d\n", 
               numSameAlpha, numNewAlpha);
        
        alphaset = UpdatedAlphaSet;

        PrintAllAlphasToDebugFile(currModel, alphaset, debugfile);
     
        //-----------calculating best value for each belief--------------------
        
        finished = CalculateAndWriteBestValueForBeliefs(debugfile_lastResultPath, debugfile, 
                                                        bestvaluefile, RandomBeliefs.bset, alphaset,
                                                        currModel, iter, thresholdDist, mPrecision, 
                                                        bestValueSetCopy, bestValueSet, 
                                                        bestAlphaIdx);

        writepolicyfile(policyfilename, alphaset);
        
        if (iter > maxIter)
            finished  = true;
    }
    
    return alphaset;
}












