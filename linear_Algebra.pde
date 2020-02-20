void setup() {
  Matrix matrix1 = new Matrix(2, 3);
  float[][] arr1 = {{1, 2, 3}, {4, 5, 6}};

  matrix1.setArrM(arr1);
  matrix1.printMatrixM();

  Matrix matrix2 = new Matrix(3,2);
  float[][] arr2 = {{7,8},{9,10},{11,12}};
  matrix2.setArrM(arr2);
  matrix2.printMatrixM();

  Matrix mult = matMultM(matrix1,matrix2);
  mult.printMatrixM();

  exit();
}
void draw() {
}
