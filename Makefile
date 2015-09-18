SRC = ./src
BUILD = ./build/
PROB = ./problems/SimpleModel/

CXXFLAGS = -Wall -g -O0

INCDIR = -I$(SRC) -I$(PROB)

SOLVERHDR = $(SRC)Model.h  $(SRC)Belief.h  $(SRC)BeliefSet.h  $(SRC)Utilities.h  $(SRC)Alpha.h  $(SRC)Solver.h
MODELHDR = $(PROB)SimpleModel.h

SOLVERSRCS = $(SRC)BeliefSet.cc $(SRC)Belief.cc $(SRC)Alpha.cc  $(SRC)Solver.cc
MODELSRCS = $(PROB)SimpleModel.cc

SOLVEROBJ = $(SOLVERSRCS:$(SRC)%.cc=$(BUILD)%.o)
PROBOBJ = $(MODELSRCS:$(PROB)%.cc=$(BUILD)%.o)

SOLVERMAIN = $(PROB)SimpleModelSolver.cc
SIMULATORMAIN = $(PROB)SimpleModelSimulator.cc
COLLECTIONMAIN = $(PROB)BeliefsCollection.cc


TARGETS = SimpleModelSolver SimpleModelSimulator BeliefsCollection

all: $(TARGETS)

clean:
	rm -f *~ *.o *.obj *.a $(TARGETS) $(SOLVEROBJ) $(PROBOBJ)

SimpleModelSolver: $(SOLVERMAIN) $(SOLVEROBJ) $(PROBOBJ)
	$(LINK.cc) $^ $(INCDIR) -o $@

SimpleModelSimulator: $(SIMULATORMAIN) $(SOLVEROBJ) $(PROBOBJ)
	$(LINK.cc) $^ $(INCDIR) -o $@

BeliefsCollection:$(COLLECTIONMAIN) $(SOLVEROBJ) $(PROBOBJ)
	$(LINK.cc) $^ $(INCDIR) -o $@

$(BUILD)%.o : %.cc $(SOLVERHDR)
	@mkdir -p $(BUILD)
	$(COMPILE.cc) -MMD $(INCDIR) -o $@ $<

$(BUILD)%.o : $(PROB)%.cc $(SOLVERHDR) $(MODELHDR)
	@mkdir -p $(BUILD)
	$(COMPILE.cc) -MMD $(INCDIR) -o $@ $<
