class Matrix {


  //Matrix properties
  int rows;
  int columns;
  float[][] matrix;



  Matrix(int rows, int columns) {//Instantiates a new Matrix object if rows and columns are greater than 0
    if (rows > 0 && columns > 0) {
      this.rows = rows;
      this.columns = columns;
      this.matrix = new float[columns][rows];
    } else if (rows < 1) {
      println("Matrix(int rows, int columns) INSTANTIATION ERR: rows must be greater than 0");
    } else if (columns < 1) {
      println("Matrix(int rows, int columns) INSTANTIATION ERR: columns must be greater than 0");
    }
    this.rows = rows;
    this.columns = columns;
    this.matrix = new float[columns][rows];
  }


  //Sets the matrix to a 2D float array if the dimensions are equal
  void setArrM(float[][] arr) {
    if (this.rows == arr.length && this.columns == arr[0].length) {
      for (int i = 1; i < this.rows+1; i++) {
        for (int j = 1; j < this.columns+1; j++) {
          this.setIndexM(i, j, arr[i-1][j-1]);
        }
      }
    } else {
      println("void setM(float[][] arr) ERR: Dimensions do not match ");
      exit();
    }
  }


  //Returns the value of a specific index of the matrix (float) as long as the required row and column exist
  float getValM(int row, int column) {
    float returnFloat = 0;
    if (row <= this.rows && column <= this.columns) {
      returnFloat = this.matrix[column-1][row-1];
    } else if (row > this.rows && column < this.columns) {
      println("float getValM(int row, int column) ERR: Cannot access row greater than: " + this.rows);
      exit();
    } else if (column > this.columns && row < this.rows) {
      println("float getValM(int row, int column) ERR: Cannot access column greater than: " + this.columns);
      exit();
    } else if (row > this.rows && column > this.columns) {
      println("float getValM(int row, int column) ERR: Cannot access row greater than: " + this.rows);
      println("float getValM(int row, int column) ERR: Cannot access column greater than: " + this.columns);
      exit();
    }
    return returnFloat;
  }


  //Sets the value of a specific index of the matrix to the specified value as long as the required row and column exist
  void setIndexM(int row, int column, float value) {
    if (row <= this.rows && column <= this.columns && row != 0 && column != 0) {
      this.matrix[column-1][row-1] = value;
    } else if (row ==0 || column == 0) {
      println("void setIndexM(int row, int column, float value) ERR: Does not start at index 0");
      exit();
    } else if (row > this.rows && column <= this.columns) {
      println("void setIndexM(int row, int column, float value) ERR: Invalid index, row cannot be greater than " + str(this.rows));
      exit();
    } else if (column > this.columns && row <= this.rows) {
      println("void setIndexM(int row, int column, float value) ERR: Invalid index, column cannot be greater than " + str(this.columns));
      exit();
    } else if (column > this.columns && row > this.rows) {
      println("void setIndexM(int row, int column, float value) ERR: Invalid index, row cannot be greater than " + str(this.rows));
      println("void setIndexM(int row, int column, float value) ERR: Invalid index, column cannot be greater than " + str(this.columns));
      exit();
    }
  }


  //Just a basic funtion for visualizing the matrix in the console
  void printMatrixM() {
    println("MATRIX:");
    for (int i = 1; i < this.rows+1; i++) {
      for (int j = 1; j < this.columns+1; j++) {
        print(str(this.getValM(i, j))+" ");
      }
      println("");
    }
  }


  //Multiplies each value in the matrix by a constant c
  Matrix multM(float c) {
    Matrix returnMatrix = new Matrix(this.rows, this.columns);
    for (int i = 1; i < this.columns+1; i++) {
      for (int j = 1; j < this.rows+1; j++) {
        returnMatrix.setIndexM(j, i, this.getValM(j, i) * c);
      }
    }
    return returnMatrix;
  }


  //Divides each value in the matrix by a constant c as long as it is not 0
  Matrix divM(float c) {
    Matrix returnMatrix = new Matrix(this.rows, this.columns);
    if (c != 0) {
      for (int i = 1; i < this.columns+1; i++) {
        for (int j = 1; j < this.rows+1; j++) {
          returnMatrix.setIndexM(j, i, this.getValM(j, i) / c);
        }
      }
    } else {
      println("Matrix divM(float c) ERR: Cannot divide by 0");
      exit();
    }
    return returnMatrix;
  }


  //Returns the determinant of a matrix as a float. Only takes square matrices as arguments. Runs in O(n!) time so definitly need to revamp this later, maybe use decomposition
  float determinantM() {
    if (this.rows != this.columns) {
      println("float determinantM() ERR: Cannot compute the determinant of a non-square matrix. " + str(this.rows) + "x" + str(this.columns) + " is not square");
      exit();
    }
    //Laplace expansion
    if (this.rows == 2 & this.columns == 2) {
      return ((this.getValM(1, 1) * this.getValM(2, 2)) - (this.getValM(2, 1) * this.getValM(1, 2)));
    }
    float determinantSum = 0.0;
    for (int i = 1; i < this.columns + 1; i++) {
      Matrix newMatrix = new Matrix(this.rows - 1, this.columns - 1);
      for (int j = 2; j < this.rows + 1; j++) {
        for (int k = 1; k < this.columns + 1; k++) {
          if (k != i) {
            if (k < i) {
              newMatrix.setIndexM(j - 1, k, this.getValM(j, k));
            } else {
              newMatrix.setIndexM(j - 1, k - 1, this.getValM(j, k));
            }
          }
        }
      }
      if (i % 2 == 1) {
        determinantSum += newMatrix.determinantM() * this.getValM(1, i);
      } else {
        determinantSum -= newMatrix.determinantM() * this.getValM(1, i);
      }
    }
    return determinantSum;
  }


  //Returns the transpose of a matrix in a new Matrix object. Works for any valid Matrix object
  Matrix transposeM() {
    Matrix returnMatrix = new Matrix(this.columns, this.rows);
    for (int i = 1; i < this.rows + 1; i++) {
      for (int j = 1; j < this.columns + 1; j++) {
        returnMatrix.setIndexM(j, i, this.getValM(i, j));
      }
    }
    return returnMatrix;
  }


  //Calculates the inverse of a matrix
  Matrix inverseM() {
    if (this.rows != this.columns) {
      println("Matrix inverseM() ERR: Cannot invert non-square matrix. " + str(this.rows) + "x" + str(this.columns) + " is not square");
      exit();
    }

    if (this.determinantM() == 0) {
      println("Matrix inverseM() ERR: Cannot invert matrix with 0 determinant");
      exit();
    }
    Matrix inverse = this.adjugateM();
    return inverse.divM(this.determinantM());
  }


  //Returns the matrix of minors in a new Matrix
  Matrix minorM () {
    Matrix minorMatrix = new Matrix(this.rows, this.columns);
    for (int i = 1; i < this.rows + 1; i++) {
      for (int j = 1; j < this.columns + 1; j++) {
        Matrix tempMatrix = new Matrix(minorMatrix.rows - 1, minorMatrix.columns - 1);
        for (int y = 1; y < this.rows + 1; y++) {
          for (int x = 1; x < this.columns + 1; x++) {
            if (y != i || x != j) {
              if (y < i && x < j) {
                tempMatrix.setIndexM(y, x, this.getValM(y, x));
              } else if (y < i && x > j) {
                tempMatrix.setIndexM(y, x - 1, this.getValM(y, x));
              } else if (y > i && x < j) {
                tempMatrix.setIndexM(y - 1, x, this.getValM(y, x));
              } else if (y > i && x > j) {
                tempMatrix.setIndexM(y - 1, x - 1, this.getValM(y, x));
              }
            }
          }
        }
        minorMatrix.setIndexM(i, j, tempMatrix.determinantM());
      }
    }
    return minorMatrix;
  }


  //Calculates the cofactors of a matrix (switches some signs) for computation of the adjugate
  Matrix cofactorM() {
    Matrix cofactorMatrix = this.minorM();
    for (int i = 1; i < this.rows + 1; i++) {
      for (int j = 1; j < this.columns + 1; j++) {
        if ((i + j) % 2 == 1) {
          cofactorMatrix.setIndexM(i, j, -1 * cofactorMatrix.getValM(i, j));
        }
      }
    }
    return cofactorMatrix;
  }


  //Adjugate matrix
  Matrix adjugateM() {
    Matrix adjugate = this.cofactorM();
    return adjugate.transposeM();
  }
  
  
  
}


//Adds two matrices together as long as they have the same dimensions. Returns in a new matrix
Matrix addM(Matrix firstMatrix, Matrix secondMatrix) {
  Matrix returnMatrix = new Matrix(firstMatrix.rows, secondMatrix.columns);
  if (firstMatrix.rows == secondMatrix.rows && firstMatrix.columns == secondMatrix.columns) {
    for (int i = 1; i < firstMatrix.rows + 1; i++) {
      for (int j = 1; j < secondMatrix.columns + 1; j++) {
        returnMatrix.setIndexM(j, i, firstMatrix.getValM(j, i) + secondMatrix.getValM(j, i));
      }
    }
  } else if (firstMatrix.rows != secondMatrix.rows && firstMatrix.columns == secondMatrix.columns) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The rows of the first Matrix must match the rows of the second Matrix");
    exit();
  } else if (firstMatrix.columns != secondMatrix.columns && firstMatrix.rows == secondMatrix.rows) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The columns of the first Matrix must match the columns of the second Matrix");
    exit();
  } else if (firstMatrix.columns != secondMatrix.columns && firstMatrix.rows != secondMatrix.rows) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The rows of the first Matrix must match the rows of the second Matrix");
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The columns of the first Matrix must match the columns of the second Matrix");
    exit();
  }
  return returnMatrix;
}


//Subtracts two matrices together as long as they have the same dimensions. Returns in a new matrix
Matrix subM(Matrix firstMatrix, Matrix secondMatrix) {
  Matrix returnMatrix = new Matrix(firstMatrix.rows, secondMatrix.columns);
  if (firstMatrix.rows == secondMatrix.rows && firstMatrix.columns == secondMatrix.columns) {
    for (int i = 1; i < firstMatrix.rows + 1; i++) {
      for (int j = 1; j < secondMatrix.columns + 1; j++) {
        returnMatrix.setIndexM(j, i, firstMatrix.getValM(j, i) - secondMatrix.getValM(j, i));
      }
    }
  } else if (firstMatrix.rows != secondMatrix.rows && firstMatrix.columns == secondMatrix.columns) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The rows of the first Matrix must match the rows of the second Matrix");
    exit();
  } else if (firstMatrix.columns != secondMatrix.columns && firstMatrix.rows == secondMatrix.rows) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The columns of the first Matrix must match the columns of the second Matrix");
    exit();
  } else if (firstMatrix.columns != secondMatrix.columns && firstMatrix.rows != secondMatrix.rows) {
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The rows of the first Matrix must match the rows of the second Matrix");
    println("Matrix addM(Matrix firstMatrix, Matrix secondMatrix) ERR: The columns of the first Matrix must match the columns of the second Matrix");
    exit();
  }
  return returnMatrix;
}


//Multiplies two matrices if they are able too
Matrix matMultM(Matrix matrix1, Matrix matrix2) {
  Matrix multMatrix = new Matrix(matrix1.rows, matrix2.columns);
  if (matrix1.columns != matrix2.rows) {
    println("Matrix matMultM(Matrix matrix1, Matrix matrix2) ERR: The columns of matrix1 must equal the rows of matrix2");
    exit();
  }
  for (int i = 1; i < matrix1.rows + 1; i++) {
    for (int j = 1; j < matrix2.columns + 1; j++) {
      float sum = 0.0;      
      for (int k = 1; k < matrix1.columns + 1; k++) {        
        sum += matrix1.getValM(i, k) * matrix2.getValM(k, j);
      }     
      multMatrix.setIndexM(i, j, sum);
    }
  } 
  return multMatrix;
}
