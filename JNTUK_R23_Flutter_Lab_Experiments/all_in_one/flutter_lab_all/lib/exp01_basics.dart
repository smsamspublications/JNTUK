// main() is the entry point — Dart starts running your program here.
void main() {
  String name = 'Flutter Learner';          // a String holds text
  int number = 5;                           // an int holds a whole number
  bool isLearning = true;                   // a bool is true or false
 
  print('Hello, $name!');                   // $name drops the variable into the text
 
  if (isLearning) {                         // a condition: run the block only if true
    print('You are learning Dart.');
  }
 
  int result = factorial(number);           // call our function, keep the answer
  print('Factorial of $number is $result'); // ${} is used for expressions
}
 
// A function that returns the factorial of n (n x (n-1) x ... x 1).
int factorial(int n) {
  int product = 1;                          // start the running total at 1
  for (int i = 1; i <= n; i++) {            // loop i from 1 up to n
    product = product * i;                  // multiply each value into product
  }
  return product;                           // hand the final answer back
}
