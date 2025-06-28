void main(List<String> args) {
  printMultblcationTableFromOneToTen();
}

void printMultblcationTableFromOneToTen() {
  // Print multiplication table from 1 to 10
  print('Multiplication Table from 1 to 10:');
  print("---------------------------------");

  for (int i = 1; i <= 10; i++) {
    print('Multiplication Table of $i:');
    print('---------------------------------');
    for (int j = 1; j <= 10; j++) {
      print('$i * $j = ${i * j}');
    }
  }
}
