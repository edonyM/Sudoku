#include "Grid.h"
#include "SudokuSolver.h"

#include <math.h>

REGISTER_PUZZLE_SOLVER(SudokuSolver, "Sudoku");
bool SudokuSolver::solve(Grid &grid)
{
    for(int i = 0; i < 9; i++)
        solveSection(grid, i, 1/*dummy*/);

    grid.display();
    return grid.isValid();
}

bool SudokuSolver::solveSection(Grid &grid, unsigned sectionNumber /*Starts from zero*/, unsigned initValue)
{
    //Ignoring the initValue
    int startCol = 3*(sectionNumber%3);
    int startRow = 3*(int)floor((double)sectionNumber/3);
    int init = startCol + startRow/3 + 1;

    for(int i = startRow; i < startRow + 3; i++) {
        for(int j = startCol; j < startCol + 3; j++){
            grid.fillCell(init, i, j); // should make grid[][] possible.
            init++;
            if(init > 9)
                init = 1;
        }
    }
    initValue = init;
    return true;
}
