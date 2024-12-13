// Pass-by-Value in Dart
void calculateSquare(int x) {
  x = x * x; // Modifies the local copy of 'x'
  print("Square in Dart (Pass-by-Value): $x");
}

void main() {
  int number = 5;
  calculateSquare(number); // Original 'number' remains unchanged
  print("Original Value in Dart: $number");
}
