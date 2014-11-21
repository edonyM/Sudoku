#include "SudokuGrid.h"

#include <iostream>
#include <math.h>

#define SUDOKU_ROWS 9
#define SUDOKU_COLS 9
#define SUDOKU_SIZE 9

SudokuGrid::SudokuGrid()
    : Grid(SUDOKU_ROWS, SUDOKU_COLS)
{
    for(int i = 0; i < SUDOKU_ROWS; i++)
        for(int j = 0; j < SUDOKU_COLS; j++)
            m_grid[i][j] = 0;
}

bool SudokuGrid::isValid()
{
    // need to come up wid a better implementation
    for(int i = 0; i < SUDOKU_SIZE; i++) {
        if(!isRowValid(i) || !isColValid(i) || isSectionValid(i))
            return false;
    }
    return true;
}

bool SudokuGrid::isRowValid(int rowNumber)
{
    // we assume that all the cells have a value > 0
    int numbers[SUDOKU_SIZE] = {0,};


    for(int j = 0; j < m_cols; j++) {
        if(numbers[m_grid[rowNumber][j] - 1]) // maybe i, j can be returned
            return false; // it means we are re-visiting some location
        numbers[m_grid[rowNumber][j] - 1] += 1;
    }
    return true;

}

bool SudokuGrid::isColValid(int colNumber)
{
    // we assume that all the cells have a value > 0
    int numbers[SUDOKU_SIZE] = {0,};

    for(int i = 0; i < m_rows; i++) {
        if(numbers[m_grid[i][colNumber] - 1]) // maybe i, j can be returned
            return false; // it means we are re-visiting some location
        numbers[m_grid[i][colNumber] - 1] += 1;
    }
    return true;
}

bool SudokuGrid::isSectionValid(int sectionNumber)
{
    // we assume that all the cells have a value > 0
    int numbers[SUDOKU_SIZE] = {0,};
    int startCol = 3*(sectionNumber%3);
    int startRow = 3*(int)floor((double)sectionNumber/3); // can mod be used ?

    for(int i = startRow; i < 3; i++)
        for(int j = startCol; j < 3; j++) {
            if(numbers[m_grid[i][j] - 1]) // maybe i, j can be returned
                return false; // it means we are re-visiting some location
            numbers[m_grid[i][j] - 1] += 1;
        }

    return true;
}
