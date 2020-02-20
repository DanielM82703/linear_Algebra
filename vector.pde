class Vector {

  float[] vector;

  Vector (int dimension) {
    this.vector = new float[dimension];
  }


  void setV(float[] newVector) {
    if (newVector.length==this.vector.length) {
      for (int i=0; i<newVector.length; i++) {
        this.vector[i]=newVector[i];
      }
    } else {
      println("ERR:length of " + str(newVector.length) + "does not match " + str(this.vector.length));
      println("ERR:length of "+str(newVector.length)+"does not match "+str(this.vector.length));
      exit();
    }
  }

  float magV() {
    float sum = 0;
    for (int i = 0; i < this.vector.length; i++) {
      sum += pow(this.vector[i], 2);
    }
    return sqrt(sum);
  }

  float magSqV() {
    float sum = 0;
    for (int i = 0; i < this.vector.length; i++) {
      sum += pow(vector[i], 2);
    }
    return sum;
  }

  Vector addV(Vector b) {
    Vector sum=new Vector(this.vector.length);
    if (this.vector.length==b.vector.length) {
      for (int i=0; i<sum.vector.length; i++) {
        sum.vector[i]=this.vector[i]+b.vector[i];
      }
    } else {
      println("ERR: length of " + str(b.vector.length) + " does not match " + str(this.vector.length));
      println("ERR: length of "+str(b.vector.length)+" does not match "+str(this.vector.length));
      exit();
    }
    return sum;
  }

  Vector subV(Vector b) {
    Vector sum=new Vector(this.vector.length);
    if (vector.length==b.vector.length) {
      for (int i=0; i<sum.vector.length; i++) {
        sum.vector[i]=this.vector[i]-b.vector[i];
      }
    } else {
      println("ERR: length of " + str(b.vector.length) + " does not match " + str(this.vector.length));
      println("ERR: length of "+str(b.vector.length)+" does not match "+str(this.vector.length));
      exit();
    }
    return sum;
  }


  Vector multV(float n) {
    Vector newVec =new Vector(this.vector.length);
    for (int i=0; i<newVec.vector.length; i++) {
      newVec.vector[i]=this.vector[i]*n;
    }
    return newVec;
  }

  Vector divV(float n) {
    Vector newVec=new Vector(this.vector.length);
    for (int i=0; i<newVec.vector.length; i++) {
      newVec.vector[i]=this.vector[i]/n;
    }
    return newVec;
  }

  void setMagV (float c) {
    normalizeV();
    this.vector = (this.multV(c)).vector;
  }

  void normalizeV() {
    this.vector = (this.divV(this.magV())).vector;
  }

  void rotateV(float theta) {
    if (this.vector.length==2) {
      float[]newVector={this.vector[0]*cos(theta)-this.vector[1]*sin(theta), this.vector[0]*sin(theta)+this.vector[1]*cos(theta)};
      this.setV(newVector);
    } else {
      println("ERR: vector.rotate(theta) cannot be called on vectors of length "+str(this.vector.length));
      exit();
    }
  }

  float[] toArray() {
    return this.vector;
  }
}

float dotProductV(Vector a, Vector b) {
  float dot=0;
  if (a.vector.length==b.vector.length) {
    for (int i=0; i<a.vector.length; i++) {
      dot+=a.vector[i]*b.vector[i];
    }
  } else {
    println("ERR: length of "+str(a.vector.length)+" does not match "+str(b.vector.length));
    exit();
  }
  return dot;
}

float angleBetweenV(Vector a, Vector b) {
  return acos(dotProductV(a, b)/(a.magV()*b.magV()));
}

Vector crossProductV(Vector a, Vector b) {
  Vector cross=new Vector(a.vector.length);
  if (a.vector.length==b.vector.length&&a.vector.length==3) {
    float[]newcross={a.vector[1]*b.vector[2]-a.vector[2]*b.vector[1], a.vector[2]*b.vector[0]-a.vector[0]*b.vector[2], a.vector[0]*b.vector[1]-a.vector[1]*b.vector[0]};
    cross.setV(newcross);
  } else {
    println("ERR: length of "+str(a.vector.length)+" does not match "+str(b.vector.length)+" or does not equal 3");
    exit();
  }
  return cross;
}
