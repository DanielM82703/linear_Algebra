class Matrix {



  int rows;
  int columns;
  float[][] matrix;



  Matrix(int rows, int columns) {
    if (rows > 0 && columns > 0) {
      this.rows = rows;
      this.columns = columns;
      this.matrix = new float[columns][rows];
    } else if (rows < 1) {
      println("Matrix(int rows, int columns) DECLARATION ERR: rows must be greater than 0");
    } else if (columns < 1) {
      println("Matrix(int rows, int columns) DECLARATION ERR: columns must be greater than 0");
    }
  }



  void setM(float[][] arr) {
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



  float getValM(int row, int column) {//DOES NOT START AT INDEX ZERO FOR MATHEMATIC SIMPLICITY
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



  void setIndexM(int row, int column, float value) {//DOES NOT START AT INDEX ZERO FOR MATHEMATIC SIMPLICITY
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



  void printMatrixM() {
    println("MATRIX:");
    for (int i = 1; i < this.rows+1; i++) {
      for (int j = 1; j < this.columns+1; j++) {
        print(str(this.getValM(i, j))+" ");
      }
      println("");
    }
  }



  Matrix multM(float c) {
    Matrix returnMatrix = new Matrix(this.rows, this.columns);
    for (int i = 1; i < this.columns+1; i++) {
      for (int j = 1; j < this.rows+1; j++) {
        returnMatrix.setIndexM(j, i, this.getValM(j, i) * c);
      }
    }
    return returnMatrix;
  }



  Matrix divM(float c) {
    Matrix returnMatrix = new Matrix(this.rows, this.columns);
    for (int i = 1; i < this.columns+1; i++) {
      for (int j = 1; j < this.rows+1; j++) {
        returnMatrix.setIndexM(j, i, this.getValM(j, i) / c);
      }
    }
    return returnMatrix;
  }


  /*
   float determinantM() {
   }
   */


  Matrix transposeM() {
    Matrix returnMatrix = new Matrix(this.columns, this.rows);
    for (int i = 1; i < this.rows + 1; i++) {
      for (int j = 1; j < this.columns + 1; j++) {
        returnMatrix.setIndexM(j, i, this.getValM(i, j));
      }
    }
    return returnMatrix;
  }


  /*
   Matrix inverseM() {
   }
   */
}



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
