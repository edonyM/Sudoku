#ifndef GRID_H
#define GRID_H

class Grid{
protected:
    int** m_grid;
    int m_rows;
    int m_cols;
public:
    Grid(int rows, int cols);
    ~Grid();
    int rowSize() {return m_rows;};
    int colSize() {return m_cols;};
    virtual void fillCell(int value, int row, int col);
    virtual int getValueAt(int row, int col);
    virtual void display();
    virtual bool isValid(){return true;};
};

#endif // GRID_H

