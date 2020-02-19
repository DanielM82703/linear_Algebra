void setup() {
  Matrix matrix1 = new Matrix(3,3);
  float[][] arr1 = {{1,2,3},{4,5,6},{7,8,9}};
  matrix1.setM(arr1);
  matrix1.printMatrixM();
  Matrix matrix2 = new Matrix(3,3);
  float[][] arr2 = {{69,69,69},{69,69,69},{69,69,69}};
  matrix2.setM(arr2);
  matrix2.printMatrixM();
  Matrix newMatrix = subM(matrix1,matrix2);
  newMatrix.printMatrixM();
  Matrix newMatrix2 = newMatrix.transposeM();
  newMatrix2.printMatrixM();
}
