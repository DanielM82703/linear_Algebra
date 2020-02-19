void setup() {
  Matrix matrix1 = new Matrix(3, 3);
  float[][] arr1 = {{3,0,2},{2,0,-2},{0,1,1}};
  //for (int i = 1; i < matrix1.rows + 1; i++) {
  //  for (int j = 1; j < matrix1.columns + 1; j++) {
  //    matrix1.setIndexM(i,j,round(random(10)));
  //  }
  //}

  matrix1.setArrM(arr1);
  matrix1.printMatrixM();
  
  //Matrix matrix2 = new Matrix(3,3);
  //float[][] arr2 = {{69,69,69},{69,69,69},{69,69,69}};
  //matrix2.setArrM(arr2);
  //matrix2.printMatrixM();
  
  //Matrix newMatrix = subM(matrix1,matrix2);
  //newMatrix.printMatrixM();
  
  //Matrix newMatrix2 = newMatrix.transposeM();
  //newMatrix2.printMatrixM();
  
  //float m = millis();
  //float determinant = matrix1.determinantM();
  //println("Determinant: " + str(determinant));
  //println("Time: " + str((millis() - m)/1000));
  
  //Matrix minor = matrix1.minorM();
  //minor.printMatrixM();
  
  //Matrix cofac = matrix1.cofactorM();
  //cofac.printMatrixM();
  
  //Matrix adjug = matrix1.adjugateM();
  //adjug.printMatrixM();
  
  //Matrix inv = matrix1.inverseM();
  //inv.printMatrixM();
  
  exit();
}
