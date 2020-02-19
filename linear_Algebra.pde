void setup() {
  Matrix matrix = new Matrix(3,3);
  float[][] arr = {{1,2,3},{4,5,6},{7,8,9}};
  matrix.setM(arr);
  matrix.printMatrixM();
  Matrix newMatrix = matrix.divM(2);
  newMatrix.printMatrixM();
}
