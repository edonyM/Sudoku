#----------------options----------------#
#environment
CC = g++
FLAGS_DEBUG = -g
FLAGS_COMPILE = -c -Wall -Wextra -Werror
key = N

#directory
SHELL = /bin/sh
DIR = $(PWD)
DIR_OBJ = $(DIR)/obj/
DIR_SRC = $(DIR)/src/
DIR_BIN = $(DIR)/bin/

#target
TARGET = sudoku

#vpath
#vpath %.cpp $(DIR_SRC)
#vpath %.o $(DIR_OBJ)

#src
SRC=$(wildcard ${DIR_SRC}*.cpp)

#obj
OBJ=$(patsubst %.cpp,${DIR_OBJ}%.o,$(notdir ${SRC}))

#----------------macro---------------#
.PHONY:dir clean make
#debug
debug:$(OBJ)
	@echo "linking..."
	@cd $(DIR_OBJ);$(CC) *.o -o $(DIR_BIN)$(TARGET)
	@echo "linking end..."
	@echo "execute the $(TARGET) in $(DIR_BIN)$(TARGET)"

$(DIR_OBJ)%.o:$(DIR_SRC)%.cpp
	@echo "compiling..."
	@echo "SRC:$<"
	$(CC) $(FLAGS_DEBUG) $(FLAGS_COMPILE) $< -o $@
	@echo "compiling end..."

#clean
clean:
	@rm -rf $(DIR_OBJ)
	@rm -rf $(DIR_BIN)

#objects & executable direction
dir:
	@mkdir -p $(DIR_OBJ)
	@mkdir -p $(DIR_BIN)

#help
help:
	@echo "......------------Makefile------------......"
	@echo "Include four commands: #1.de; #2.clean; #3.dir; #4.help"
	@echo "#1.de:"
	@echo "    debug the source file into a executable file that is included in the $(DIR_BIN)!"
	@echo "#2.clean:"
	@echo "    delete the debug files and directions"
	@echo "#3.dir:"
	@echo "    mkdir a new directions for objects and executable file:"
	@echo "    $(DIR_BIN) for executable file"
	@echo "    $(DIR_OBJ) for object file"
	@echo "#4.help:"
	@echo "    help for using this makefile to debug a project which includes source files include files"
	@echo "......------------End------------......"

#make all the commands and get the executable file
make:
	@echo "start debugging..."
	@$(MAKE) -s dir
	@$(MAKE) -s debug
	@echo "finish..."
	@echo "******************************"
	@echo "     ____  ____  _   ________"
	@echo "    / __ \/ __ \/ | / / ____/"
	@echo "   / / / / / / /  |/ / __/   "
	@echo "  / /_/ / /_/ / /|  / /___   "
	@echo " /_____/\____/_/ |_/_____/   "
	@echo "******************************"
	@echo "You want the executable file run itself?"
	@echo "'Y' for yes,'N' for no"
	@read -n1 $(key);ifeq($(key),'Y')@cd $(DIR_BIN);./$(TARGET)\n endif
			                              
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

