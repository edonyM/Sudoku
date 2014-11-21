#ifndef SUDOKUGRID_H
#define SUDOKUGRID_H

#include "Grid.h"

class SudokuGrid : public Grid {
    bool isSectionValid(int);
    bool isRowValid(int);
    bool isColValid(int);
public:
    SudokuGrid();
    bool isValid();
    // some functions to help generate map to come up wid a valid map/grid
};

#endif // SUDOKUGRID_H

