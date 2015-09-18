#include "NewAlpha.h"
#include "Utilities.h"
#include "random"
#include "iostream"

using namespace std;



NewAlpha::NewAlpha(int nDState, double discount_factor): numDState(nDState), gamma(discount_factor){
    
    vector<double> emptyvector(3, 0);
    for(int i = 0; i<numDState; i++)
        coeff.push_back(emptyvector);
};

double NewAlpha::getdist(const CState& x1, const CState& x2){
    double EuclideanNorm = 0;
    for (int i = 0; i < x1.size(); i++){
          EuclideanNorm += (x1[i] - x2[i])*(x1[i] - x2[i]);
    }
     return sqrt(EuclideanNorm);
};

double NewAlpha::AlphaValue(DState& q, CState& x) {
    
	if(x.size() == 1)
    	return coeff[q][0] + coeff[q][1]*x[0] + coeff[q][2]*x[0]*x[0];
	else
		return coeff[q][0]+coeff[q][1]*x[0]+coeff[q][2]*x[0]*x[0]+coeff[q][3]*x[0]*x[1]+coeff[q][4]*x[1]+coeff[q][5]*x[1]*x[1];
};

double NewAlpha::ExpectedAlphaValue(DState& q, CState& x, vector<double>& cov) {
    
	if(x.size() == 1)
    	return coeff[q][0] + coeff[q][1]*x[0] + coeff[q][2]*x[0]*x[0] + coeff[q][2]*cov[0];
	else
		return coeff[q][0]+coeff[q][1]*x[0]+coeff[q][2]*x[0]*x[0]+coeff[q][3]*x[0]*x[1]+coeff[q][4]*x[1]+coeff[q][5]*x[1]*x[1] + coeff[q][2]*cov[0]
			   + coeff[q][5]*cov[1];
	           //^^^^^^^^^^^^^^^^ The above 2d formulation of covariance is not correct in general!!!^^^^^^^^^^^^^^^^^^^^^  
};

double NewAlpha::calvalue(const Model& currModel,Belief& b) {
    double sum  = 0;
    
    for(int q = 0; q<currModel.getNumDState(); q++){
		if(b.cstate.size() == 1)
        	sum += (coeff[q][0] + coeff[q][1]*b.cstate[0] + coeff[q][2]*(b.cstate[0])*(b.cstate[0]))*b.DStateProb[q];
		else
			sum += (coeff[q][0] + coeff[q][1]*b.cstate[0] + coeff[q][2]*(b.cstate[0])*(b.cstate[0])
				    + coeff[q][3]*b.cstate[0]*b.cstate[1] + coeff[q][4]*b.cstate[1] + coeff[q][5]*b.cstate[1]*b.cstate[1])*b.DStateProb[q];
	}

    return sum;
};

double NewAlpha::initSigma(const Model& currModel, Belief& initBelief){
    double J_sigma;
    double J_star = -999999999; // for reward
//    double J_star = 1e10; //for cost
	vector<vector<vector<double> > > rewardcoeff = currModel.getRewardCoeff();
//    coeff = currModel.getRewardCoeff();
    localx = initBelief.cstate;
    
    for(DControl DCrl = 0; DCrl<currModel.getNumDControls(); DCrl++){
        J_sigma = 0;
        for(int q = 0; q<currModel.getNumDState(); q++){
    //            J_sigma += currModel.getCost(q, initBelief.cstate, DCrl)*initBelief.DStateProb[q];    //for cost
            J_sigma += currModel.getReward(q, initBelief.cstate, DCrl)*initBelief.DStateProb[q]; //for reward
        }

        if(J_sigma>J_star){   // for reward
//        if(J_sigma < J_star) { // for cost
            J_star = J_sigma;
            sigma = DCrl;
        }
    }
	coeff = rewardcoeff[sigma];

    return J_star;  
};

void NewAlpha::calNewCoeff(const Model& currModel, NewAlphaSet& alphaset, vector<vector<int> >& optalpha, DControl& sigma_star, Belief& currBelief){
    
	vector<vector<vector<double> > > rewardcoeff = currModel.getRewardCoeff();
	vector<vector<double> > cov = currModel.getCovariance();
    
    for(int q =0; q<currModel.getNumDState(); q++) {
		
        double constterm = 0;
        double firstorderterm = 0;
        double secondorderterm = 0;
                
        for(int qq = 0; qq<currModel.getNumDState(); qq++) {
            CState x_next = currModel.getNextCStateNoNoise(qq, currBelief.cstate);
            vector<double> firstderi = currModel.get1stDerivative(qq, currBelief.cstate);
            vector<double> secondderi = currModel.get2ndDerivative(qq, currBelief.cstate);
            
            for(int zq = 0; zq<currModel.getNumDObs(); zq++) {
				NewAlpha& alpha_star = alphaset[optalpha[sigma_star][zq]];
            	constterm += currModel.getDiscreteObsProb(zq, qq)*alpha_star.ExpectedAlphaValue(qq, x_next, cov[qq])*currModel.getDStateTransProb(qq, q, sigma_star);
                firstorderterm += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*
                                    (alpha_star.coeff[qq][1]*firstderi[0] + 2*alpha_star.coeff[qq][2]*x_next[0]*firstderi[0]);
                secondorderterm += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*
                    	(alpha_star.coeff[qq][1]*secondderi[0] + 2*alpha_star.coeff[qq][2]*(firstderi[0]*firstderi[0] + x_next[0]*secondderi[0]));
            }   
        }
		constterm *= gamma;
		firstorderterm *= gamma;
		secondorderterm *= gamma;
		
//		cout<<"constterm = "<<constterm<<endl;
//        cout<<"rewardcoeff = "<<rewardcoeff[q][0]<<","<<rewardcoeff[q][1]<<","<<rewardcoeff[q][2]<<endl;
		
	    constterm += rewardcoeff[sigma_star][q][0] + rewardcoeff[sigma_star][q][1]*currBelief.cstate[0] + rewardcoeff[sigma_star][q][2]*currBelief.cstate[0]*currBelief.cstate[0];
	    firstorderterm += rewardcoeff[sigma_star][q][1]+ 2*rewardcoeff[sigma_star][q][2]*currBelief.cstate[0];
	    secondorderterm += 2*rewardcoeff[sigma_star][q][2];
		secondorderterm *= 0.5;
		
		if(secondorderterm<0) {
			//secondorderterm = 0.5*2*rewardcoeff[sigma_star][q][2];
		    coeff[q][0] = constterm - firstorderterm*currBelief.cstate[0] + secondorderterm*currBelief.cstate[0]*currBelief.cstate[0];
	        coeff[q][1] = firstorderterm - 2*secondorderterm*currBelief.cstate[0];
	        coeff[q][2] = secondorderterm;
		}
		else {
		    //secondorderterm = 0.5*2*rewardcoeff[sigma_star][q][2];

        	coeff[q][0] = constterm - firstorderterm*currBelief.cstate[0] + secondorderterm*currBelief.cstate[0]*currBelief.cstate[0];
	       	coeff[q][1] = firstorderterm  - 2*secondorderterm*currBelief.cstate[0];
	      	coeff[q][2] = secondorderterm;
		}
		
		
//		cout<<"constterm = "<<constterm<<endl;
        
    }
	
};

void NewAlpha::calNewCoeff2D(const Model& currModel, NewAlphaSet& alphaset, vector<vector<int> >& optalpha, DControl& sigma_star, Belief& currBelief){
    
	vector<vector<vector<double> > > rewardcoeff = currModel.getRewardCoeff();
	vector<vector<double> > covariance = currModel.getCovariance();
    
    for(int q =0; q<currModel.getNumDState(); q++) {
		
        double constterm = 0;
        double dhdx = 0;
		double dhdy = 0;
		double d2hdx2 = 0;
		double d2hdy2 = 0;
		double d2hdxdy = 0;
                
        for(int qq = 0; qq<currModel.getNumDState(); qq++) {
            CState x_next = currModel.getNextCStateNoNoise(qq, currBelief.cstate);
            vector<double> firstderi = currModel.get1stDerivative(qq, currBelief.cstate);
            vector<double> secondderi = currModel.get2ndDerivative(qq, currBelief.cstate);
            
            for(int zq = 0; zq<currModel.getNumDObs(); zq++) {
				NewAlpha& alpha_star = alphaset[optalpha[sigma_star][zq]];
				
            	constterm += currModel.getDiscreteObsProb(zq, qq)*alpha_star.ExpectedAlphaValue(qq, x_next, covariance[qq])*currModel.getDStateTransProb(qq, q, sigma_star);
                
				dhdx += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*(
							(alpha_star.coeff[qq][1] + 2*alpha_star.coeff[qq][2]*x_next[0] + alpha_star.coeff[qq][3]*x_next[1])*firstderi[0] +
							(alpha_star.coeff[qq][4] + 2*alpha_star.coeff[qq][5]*x_next[1] + alpha_star.coeff[qq][3]*x_next[0])*firstderi[2] );
				dhdy += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*(
							(alpha_star.coeff[qq][1] + 2*alpha_star.coeff[qq][2]*x_next[0] + alpha_star.coeff[qq][3]*x_next[1])*firstderi[1] +
							(alpha_star.coeff[qq][4] + 2*alpha_star.coeff[qq][5]*x_next[1] + alpha_star.coeff[qq][3]*x_next[0])*firstderi[3] );
				
                d2hdx2 += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*(
							(2*alpha_star.coeff[qq][2]*firstderi[0] + alpha_star.coeff[qq][3]*firstderi[2])*firstderi[0] +
							(2*alpha_star.coeff[qq][5]*firstderi[2] + alpha_star.coeff[qq][3]*firstderi[0])*firstderi[2] );
				d2hdy2 += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*(
							(2*alpha_star.coeff[qq][2]*firstderi[1] + alpha_star.coeff[qq][3]*firstderi[3])*firstderi[1] +
							(2*alpha_star.coeff[qq][5]*firstderi[3] + alpha_star.coeff[qq][3]*firstderi[1])*firstderi[3] );
				d2hdxdy += currModel.getDiscreteObsProb(zq, qq)*currModel.getDStateTransProb(qq, q, sigma_star)*(
							(2*alpha_star.coeff[qq][2]*firstderi[1] + alpha_star.coeff[qq][3]*firstderi[3])*firstderi[0] +
							(2*alpha_star.coeff[qq][5]*firstderi[3] + alpha_star.coeff[qq][3]*firstderi[1])*firstderi[2] );
            }   
        }
		constterm *= gamma;
		dhdx *= gamma;
		dhdy *= gamma;
		d2hdx2 *= gamma;
		d2hdy2 *= gamma;
		d2hdxdy *= gamma;
		
//		cout<<"constterm = "<<constterm<<endl;
//        cout<<"rewardcoeff = "<<rewardcoeff[q][0]<<","<<rewardcoeff[q][1]<<","<<rewardcoeff[q][2]<<endl;
		
		constterm += rewardcoeff[sigma_star][q][0] + rewardcoeff[sigma_star][q][1]*currBelief.cstate[0] +
			 rewardcoeff[sigma_star][q][2]*currBelief.cstate[0]*currBelief.cstate[0] + rewardcoeff[sigma_star][q][3]*currBelief.cstate[0]*currBelief.cstate[1]+
			 rewardcoeff[sigma_star][q][4]*currBelief.cstate[1]+ rewardcoeff[sigma_star][q][5]*currBelief.cstate[1]*currBelief.cstate[1];
		
		dhdx += rewardcoeff[sigma_star][q][1] + 2*rewardcoeff[sigma_star][q][2]*currBelief.cstate[0]+rewardcoeff[sigma_star][q][3]*currBelief.cstate[1];
		dhdy += rewardcoeff[sigma_star][q][4] + 2*rewardcoeff[sigma_star][q][5]*currBelief.cstate[1]+rewardcoeff[sigma_star][q][3]*currBelief.cstate[0];
		
		d2hdx2 += 2*rewardcoeff[sigma_star][q][2];
		d2hdy2 += 2*rewardcoeff[sigma_star][q][5];
		d2hdxdy += rewardcoeff[sigma_star][q][3];
		
		coeff[q][0] = constterm - dhdx*currBelief.cstate[0] - dhdy*currBelief.cstate[1] + 0.5*d2hdx2*currBelief.cstate[0]*currBelief.cstate[0] +
			          0.5*d2hdy2*currBelief.cstate[1]*currBelief.cstate[1] + d2hdxdy*currBelief.cstate[0]*currBelief.cstate[1];
		coeff[q][1] = dhdx - d2hdx2*currBelief.cstate[0] - d2hdxdy*currBelief.cstate[1];
		coeff[q][2] = 0.5*d2hdx2;
		coeff[q][3] = d2hdxdy;
		coeff[q][4] = dhdy - d2hdy2*currBelief.cstate[1] - d2hdxdy*currBelief.cstate[0];
		coeff[q][5] = 0.5*d2hdy2;
		
//		cout<<"constterm = "<<constterm<<endl;
        
    }
	
}

double NewAlpha::backup(const Model& currModel, NewAlphaSet& alphaset, Belief& currBelief, double thresholddist, vector<int>& optimalalphaidx) {
    
    double indivmaxvalue;
    vector<vector<int> > optalpha(currModel.getNumDState(), vector<int>(currModel.getNumDObs(), -1));
    vector<double> J_sigma(currModel.getNumDControls(), 0);
    
    DControl sigma_star;
    double J_star = -999999999; // for reward
//    double J_star = 1e10;     // for cost
	vector<vector<double> > covariance = currModel.getCovariance();
    
//    vector<double> stddev(currModel.getNumCStateVar(), 0.5);  // 0.5 not a fixed value!!!!!!!!
    //--------------------------------------End Initialization------------------------------------------
    
    //--------------------------------------Finding optimal sigma---------------------------------------
     
    for(DControl DCrl = 0; DCrl<currModel.getNumDControls(); DCrl++) {
//        cout<<"DCrl = " <<DCrl<<endl;
                
        J_sigma[DCrl] = 0;

        for(DObs zq = 0; zq<currModel.getNumDObs(); zq++) {

            indivmaxvalue= -999999999; // for reward
			double numalphaselected = 0;
            for(int j =0; j<alphaset.size(); j++) {   // may not loop through the \alpha set
                if(getdist(alphaset[j].localx, currBelief.cstate) < thresholddist) {
				
//				if((getdist(currModel.getNextCStateNoNoise(0, currBelief.cstate), alphaset[j].localx) < thresholddist) ||
//				   (getdist(currModel.getNextCStateNoNoise(1, currBelief.cstate), alphaset[j].localx) < thresholddist) ) {
					
					numalphaselected++;
					
                    double sum_qq = 0;
                    for(int qq =0; qq<numDState; qq++) {
                        double sum_q = 0;
                        for(int q =0; q<numDState; q++) {
                            sum_q += currModel.getDStateTransProb(qq, q, DCrl)*currBelief.DStateProb[q];
                        }
                        CState meanx_next = currModel.getNextCStateNoNoise(qq, currBelief.cstate);
                        sum_qq += alphaset[j].ExpectedAlphaValue(qq, meanx_next, covariance[qq])*currModel.getDiscreteObsProb(zq, qq)*sum_q;
                    }
                
                    if(sum_qq > indivmaxvalue) {
                        indivmaxvalue = sum_qq;
                        optalpha[DCrl][zq] = j;
                    }
                }
            }
			
			cout<<"zq = "<<zq<<"; numalphaselected = "<<numalphaselected<<endl;
                
            J_sigma[DCrl] += indivmaxvalue;
//                cout<< indivmaxvalue<<"   "<<eta[DCrl][i]<<endl;
        }
        
        J_sigma[DCrl] *= gamma;
		
//		cout<<"J_sigma["<<DCrl<<"]  = "<<J_sigma[DCrl]<<endl;
        
        for(int i = 0; i<currModel.getNumDState(); i++)
            J_sigma[DCrl] += currModel.getReward(i, currBelief.cstate, DCrl)*currBelief.DStateProb[i];
            
        if(J_sigma[DCrl] > J_star){ // for reward 
//        if(J_sigma[DCrl] < J_star) { for cost
            J_star = J_sigma[DCrl];
            sigma_star = DCrl;
        }
    }
    
    this->sigma = sigma_star;
	this->localx = currBelief.cstate;
	optimalalphaidx.clear();
	
	for(int zq = 0; zq<currModel.getNumDObs(); zq++)
		optimalalphaidx.push_back(optalpha[sigma_star][zq]);
	
	

    //-------------------------------------End finding optimal sigma---------------------------------------------------
    
    //-------------------------------------Calculate coeff--------------------------------------------------------------
	
	if(currBelief.cstate.size() == 1)
		calNewCoeff(currModel, alphaset, optalpha, sigma_star, currBelief);
	else
		calNewCoeff2D(currModel, alphaset, optalpha, sigma_star, currBelief);
    
	cout<<"test3"<<endl;
    
    return J_star;
    
}

