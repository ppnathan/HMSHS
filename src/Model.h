#ifndef MODEL_H
#define MODEL_H

#include <vector>
#include <eigen3/Eigen/Dense>

using namespace Eigen;
using namespace std;

typedef int DState;         // defining discrete state
typedef VectorXd CState;    // defining continuous state
typedef int DObs;           // defining discrete observation
typedef VectorXd CObs;      // defining continuous observation
typedef int DControl;       // defining discrete control

class Model
{
public:
    Model(int numCStateVar, int numDState, int numCObsVar, int numDObs, int numDControls, 
         double discount):
            numCStateVar(numCStateVar), numDState(numDState),numCObsVar(numCObsVar), 
            numDObs(numDObs), numDControls(numDControls), discount(discount)
            {}
            
    /*  return Tx(xx|qq, x) */
    virtual double getCStateTransProb(const CState &x_next, const DState &q_next, 
                                                            const CState &x_k) const = 0 ;

    /*  return Tq(qq|q,sigma)   */
    virtual double getDStateTransProb(const DState &q_next, const DState &q_k, 
                                                            const DControl &simga_k) const = 0;
    
    /*  return Omega(zq|q)  */
    virtual double getDiscreteObsProb(const DObs &zq_k, const DState &q_k) const = 0 ;
    
    /*  return R(q,x,sigma) */
    virtual double getReward(const DState &q, const CState &x, const DControl &sigma) const = 0;

    /*  sample (qq,xx,zq) from Tq(qq|q,sigma), Tx(xx|qq, x) and Omega(zq|q)*/
    virtual double sample(const DState &q_k, const CState &x_k, const DControl &sigma_k, 
                          DState &q_next, CState &x_next, DObs &obs_out) const = 0;

    virtual CState getNextCStateNoNoise(const DState &q_next, const CState &x_k) const = 0;

    virtual MatrixXd get1stDerivative(const DState &q, const CState &x) const = 0;
        
    virtual VectorXd getReward1stDeri(const DState &q, const CState &x, 
                                                       const DControl &sigma) const = 0;
    
    virtual MatrixXd getReward2ndDeri(const DState &q, const CState &x, 
                                                       const DControl &sigma) const = 0;
    
    virtual vector<MatrixXd> getCovariance() const = 0; //covariance[q][coeff];
    
    virtual MatrixXd getCovMatrix(const DState &q) const = 0;
        
    /*  return The number of continuous state variables */
    inline int getNumCStateVar() const { return numCStateVar; }
    
    /*  return The number of discrete state */
    inline int getNumDState() const { return numDState; }

    /*  return The number of continuous observation variables   */
    inline int getNumCObsVar() const { return numCObsVar; }
    
    /*  return the number of dicrete observation    */
    inline int getNumDObs() const { return numDObs; }

    /*  return Discount value for the problem   */
    inline double getDiscount() const { return discount; }

    /*  return Number of discrete controls  */
    inline int getNumDControls() const { return numDControls; }
        
    virtual ~Model() {}

private:
    int numCStateVar;   // number of continuous state variables
    int numDState;      // number of discrete states
    int numCObsVar;     // number of continuous observation variables
    int numDObs;        // number of discrete observations
    int numDControls;   // number of discrete controls

protected:
    double discount;    // discount factor
};

#endif //MODEL_H