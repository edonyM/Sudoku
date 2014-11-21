#environment
CC = g++
FLAGS_DEBUG = -g
FLAGS_COMPILE = -c -Wall

#directory
SHELL = /bin/sh
DIR = $(PWD)
DIR_OBJ = $(DIR)/obj/
DIR_SRC = $(DIR)/src/
DIR_BIN = $(DIR)/bin/
TARGET = sudoku
#vpath
#vpath %.cpp $(DIR_SRC)
#vpath %.o $(DIR_OBJ)
#src
SRC=$(wildcard ${DIR_SRC}*.cpp)
#obj
OBJ=$(patsubst %.cpp,${DIR_OBJ}%.o,$(notdir ${SRC}))
#help
debug:$(OBJ)
	@echo "linking..."
	@cd $(DIR_OBJ);$(CC) *.o -o $(DIR_BIN)$(TARGET)
	@echo "linking end..."
	@echo "execute the $(TARGET) in $(DIR_BIN)$(TARGE)"

$(DIR_OBJ)%.o:$(DIR_SRC)%.cpp
	@echo "compiling..."
	@echo "SRC:$<"
	$(CC) $(FLAGS_DEBUG) $(FLAGS_COMPILE) $< -o $@
	@echo "compiling end..."

clean:
	@rm -rf $(DIR_OBJ)
	@rm -rf $(DIR_BIN)

#mkdir
dir:
	@mkdir -p $(DIR_OBJ)
	@mkdir -p $(DIR_BIN)

help:
	@echo "makefile..."
de:
	@echo "start debugging..."
	@$(MAKE) -s dir
	@$(MAKE) -s debug
	@echo "finish..."
.PHONY:dir clean de
#CXX ?= g++
#CXX_FLAGS =-c -Wall

#all: sudoku

#sudoku: main.o Grid.o PuzzleSolver.o SudokuGrid.o SudokuSolver.o
#	$(CXX) main.o Grid.o PuzzleSolver.o SudokuGrid.o SudokuSolver.o -o sudoku

#main.o: src/main.cpp
#	$(CXX) $(CXX_FLAGS) src/main.cpp

#Grid.o: src/Grid.cpp
#	$(CXX) $(CXX_FLAGS) src/Grid.cpp

#PuzzleSolver.o: src/PuzzleSolver.cpp
#	$(CXX) $(CXX_FLAGS) src/PuzzleSolver.cpp

#SudokuGrid.o: src/SudokuGrid.cpp
#	$(CXX) $(CXX_FLAGS) src/SudokuGrid.cpp

#SudokuSolver.o: src/SudokuSolver.cpp
#	$(CXX) $(CXX_FLAGS) src/SudokuSolver.cpp

#clean: 
#	rm -rf *.o sudoku

