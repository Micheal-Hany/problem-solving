void main(List<String> args) {
  // Check if the correct number of arguments is provided
  if (args.length != 2) {
    print('Usage: dart problem_one.dart <number1> <number2>');
    return;
  }

  // Parse the input arguments as integers
  int number1 = int.parse(args[0]);
  int number2 = int.parse(args[1]);

  // Calculate the sum of the two numbers
  int sum = number1 + number2;

  // Print the result
  print('The sum of $number1 and $number2 is $sum');
}