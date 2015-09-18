# Path to the solver source code
SRC = ../../src
# Path to the problem source code
PROB = ./

# Header and souce for the model
MODELHDR =	$(PROB)DrivingDemoModel.h

MODELSRCS =	$(PROB)DrivingDemoModel.cc

# Main file of solver
SOLVERMAIN = $(PROB)DrivingDemoModelSolver.cc

# Main file of simulator
SIMULATORMAIN = $(PROB)DrivingDemoModelSimulator.cc

# Main file of belief collection
COLLECTIONMAIN = $(PROB)BeliefsCollection.cc

# Set compiler options for debugging etc.
#CXXFLAGS = -Wall -ggdb -O0
#CXXFLAGS = -Wall -ggdb -O0 -fopenmp
#CXXFLAGS = -Wall -O3 -fopenmp
CXXFLAGS = -Wall -g -O0

PROBTARGETS = $(PROB)Solver $(PROB)BeliefsCollection
#$(PROB)Simulator

include $(SRC)CommonMake