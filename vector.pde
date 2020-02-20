class Vector {

  
  
  float[] vector;
  int dimension;


  //Vector initializer
  Vector(int dim) {
    if (dim > 0) {
      this.vector = new float[dim];
      this.dimension = dim;
    } else {
      println("Vector(int dim) INSTANTIATION ERR: Cannot have vectors of dimension 0");
      exit();
    }
  }


  //Sets the vector to a 1D array
  void setArrV(float[] newVector) {
    if (newVector.length == this.dimension) {
      for (int i = 1; i < newVector.length + 1; i++) {
        this.setIndexV(i, newVector[i - 1]);
      }
    } else {
      println("void setArrV(float[] newVector) ERR: length of " + str(newVector.length) + " does not match dimension " + str(this.dimension));
      exit();
    }
  }


  //Sets the specific index of a vector to the value
  void setIndexV(int index, float value) {
    if (index < dimension + 1) {
      this.vector[index - 1] = value;
    } else {
      println("void setIndexV(int index, float value) ERR: Invalid index " + str(index) + ". The dimension of the vector is " + str(this.dimension));
      exit();
    }
  }


  //Gets the float value of the vector at an index
  float getValV(int index) {
    if (index < this.dimension + 1) {
      return this.vector[index - 1];
    } else {
      println("float getValV(int index) ERR: Dimension of this vector is " + str(this.dimension) + ". " + str(index) + " is an invalid index");
      exit();
    }
    return 0.0; //Placeholder
  }


  //Returns the magnitude of the vector
  float magV() {
    float sum = 0;
    for (int i = 1; i < this.dimension + 1; i++) {
      sum += pow(this.getValV(i), 2);
    }
    return sqrt(sum);
  }


  //Returns the square of the magnitude
  float magSqV() {
    float sum = 0;
    for (int i = 1; i < this.dimension + 1; i++) {
      sum += pow(this.getValV(i), 2);
    }
    return sum;
  }


  //Adds two vectors and returns it as a new vector
  Vector addV(Vector b) {
    Vector sum = new Vector(this.dimension);
    if (this.dimension == b.dimension) {
      for (int i = 1; i < sum.dimension + 1; i++) {
        sum.setIndexV(i, this.getValV(i) + b.getValV(i));
      }
    } else {
      println("Vector addV(Vector b) ERR: dimension of this: " + str(b.dimension) + " does not match dimension of Vector b: " + str(this.vector.length));
      exit();
    }
    return sum;
  }


  //Subtracts two vectors and returns them as a new vector
  Vector subV(Vector b) {
    Vector sum = new Vector(this.dimension);
    if (this.dimension == b.dimension) {
      for (int i = 1; i < sum.dimension + 1; i++) {
        sum.setIndexV(i, this.getValV(i) - b.getValV(i));
      }
    } else {
      println("Vector subV(Vector b) ERR: dimension of this:" + str(b.dimension) + " does not match dimension of Vector b: " + str(this.vector.length));
      exit();
    }
    return sum;
  }


  //Multiplies a vector by a constant
  Vector multV(float n) {
    Vector newVector = new Vector(this.dimension);
    for (int i = 1; i < newVector.dimension + 1; i++) {
      newVector.setIndexV(i, this.getValV(i) * n);
    }
    return newVector;
  }


  //Divides a vector by a non-zero constant
  Vector divV(float n) {
    Vector newVector = new Vector(this.dimension);
    if (n != 0) {
      for (int i = 1; i < newVector.dimension + 1; i++) {
        newVector.setIndexV(i, this.getValV(i) / n);
      }
    } else {
      println("Vector divV(float n) ERR: Cannot divide a vector by 0");
      exit();
    }
    return newVector;
  }


  //Sets the magnitude of the vector to a constant
  void setMagV (float c) {
    normalizeV();
    this.setArrV((this.multV(c)).toArray());
  }


  //Normalizes a non-zero vector
  void normalizeV() {
    if (this.magSqV() != 0) {
      this.setArrV((this.divV(this.magV())).toArray());
    } else {
      println("void normalizeV() ERR: Cannot normalize a zero vector");
      exit();
    }
  }


  //Rotates a 2D vector by an angle
  void rotateV(float theta) {
    if (this.dimension == 2) {
      float[] newVector = {this.getValV(1) * cos(theta) - this.getValV(2) * sin(theta), this.getValV(1) * sin(theta) + this.getValV(2) * cos(theta)};
      this.setArrV(newVector);
    } else {
      println("void rotateV(float theta) ERR: vector.rotate(theta) cannot be called on vectors of dimension "+str(this.dimension));
      exit();
    }
  }


  //Returns the vector as a float array
  float[] toArray() {
    return this.vector;
  }


  //Prints vector
  void printVectorV() {
    println("VECTOR:");
    println(this.vector);
  }
  
  
  
}


//Returns the dot product of compatible vectors
float dotProductV(Vector a, Vector b) {
  float dot = 0;
  if (a.dimension == b.dimension) {
    for (int i = 1; i < a.dimension + 1; i++) {
      dot += a.getValV(i) * b.getValV(i);
    }
  } else {
    println("float dotProductV(Vector a, Vector b) ERR: dimension of Vector a: " + str(a.dimension) + " does not match dimension of Vector b: " + str(b.dimension));
    exit();
  }
  return dot;
}


//Returns the angle between two vectors
float angleBetweenV(Vector a, Vector b) {
  return acos(dotProductV(a, b) / (a.magV() * b.magV()));
}


//Returns the cross product of two vectors
Vector crossProductV(Vector a, Vector b) {
  Vector cross = new Vector(a.dimension);
  if (a.dimension == b.dimension && a.dimension == 3) {
    cross.setIndexV(1, a.getValV(2) * b.getValV(3) - a.getValV(3) * b.getValV(2));
    cross.setIndexV(2, a.getValV(3) * b.getValV(1) - a.getValV(1) * b.getValV(3));
    cross.setIndexV(3, a.getValV(1) * b.getValV(2) - a.getValV(2) * b.getValV(1));
  } else {
    println("ERR: Dimension of Vector a: " + str(a.dimension) + " does not match dimension of Vector b: " + str(b.dimension) + " or does not equal 3");
    exit();
  }
  return cross;
}
