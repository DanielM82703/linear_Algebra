class Matrix {

  int rows;
  int columns;
  float[][] matrix;

  Matrix(int rows, int columns) {

    this.rows = rows;
    this.columns = columns;
    this.matrix = new float[columns][rows];
  }

  void setM(float[][] arr) {
    
    if (this.rows == arr.length && this.columns == arr[0].length){
      
      
    }
  }
/*
  void setIndexM(int row, int column) {
  }

  Matrix multM(float c) {
  }

  Matrix divM(float c) {
  }

  float determinantM() {
  }

  Matrix transposeM() {
  }

  Matrix inverseM() {
  }
*/  
}
/*
Matrix addM(Matrix firstMatrix, Matrix secondMatrix) {
}

Matrix subM(Matrix firstMatrix, Matrix secondMatrix) {
}
*/
