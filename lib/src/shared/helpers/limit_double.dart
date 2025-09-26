class LimitDouble {

  static double limitDouble(double doubleNumber){
    String doubleToString = doubleNumber.toStringAsFixed(2);
    return double.parse(doubleToString);
  }
}