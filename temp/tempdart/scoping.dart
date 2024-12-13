// dart uses lexical scoping meaning the variables values depends on where they are defined in the code.
void main() {
  int x = 10;
  int y = 10;
  void innerFunction() {
    int x = 20;
    print("The value of x is $x [innerFunction]"); //it prints 20 as the output;
    //dart will fetch the nearest declaration and print the value
  }
  void innerFunction1() {
    //there is no value of y assigned in this scope but the upper level scope has value of y as 20 so it prints 20
    print("Lexical Scoping In Dart value of y is $y [innerFunction1]");
  }
  innerFunction();
  innerFunction1();
  print("The value of x outside the scope of inner function is $x[MAIN]");
  print("The value of y outside ṭhe scope of innerFunction1 is $y[MAIN]");
}
