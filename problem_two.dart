import 'utils/number.dart';

void main(List<String> args) {
  printPrimeNumberFromOneToN(n: 100);
}

void printPrimeNumberFromOneToN({required int n}) {
  for (int i = 1; i <= n; i++) {
    if (NumberUtils.isPrime(i)) {
      print(i);
    }
  }
}
