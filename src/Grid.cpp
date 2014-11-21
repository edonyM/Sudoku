#include "Grid.h"

#include <iostream>

using namespace std;

Grid::Grid(int rows, int cols)
{
    m_rows = rows;
    m_cols = cols;
    m_grid = new int* [rows];
    for(int i = 0; i < rows; i++)
        m_grid[i] = new int [cols];
}

Grid::~Grid()
{
    for(int i = 0; i < m_rows; i++)
        delete [] m_grid[i];
    delete [] m_grid;
    m_grid = 0;
}

void Grid::fillCell(int value, int row, int col)
{
    if(row < 0 || row >= m_rows || col < 0 || col >= m_cols) {
        cout << endl << "Error: Invalid Row or Col(" << row << "," << col << ")" << endl;
        return;
    }
    m_grid[row][col] = value;
}

int Grid::getValueAt(int row, int col)
{
    if(row < 0 || row >= m_rows || col < 0 || col >= m_cols) {
        cout << endl << "Error: Invalid Row or Col(" << row << "," << col << ")" << endl;
        return -1;
    }
    return m_grid[row][col];
}

void Grid::display()
{
    for(int i = 0; i < m_rows; i++) {
        for (int j = 0; j< m_cols; j++)
            cout << m_grid[i][j] << " ";
        cout << endl;
    }
}
