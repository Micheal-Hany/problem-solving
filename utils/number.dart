import 'dart:math';

class NumberUtils {
  /// Parses string to int with optional fallback
  static int? toInt(String? input, [int? fallback]) {
    if (input == null) return fallback;
    return int.tryParse(input) ?? fallback;
  }

  /// Parses string to double with optional fallback
  static double? toDouble(String? input, [double? fallback]) {
    if (input == null) return fallback;
    return double.tryParse(input) ?? fallback;
  }

  /// Checks if number is even
  static bool isEven(num? number) {
    if (number is int) {
      return number.isEven;
    }
    return false;
  }

  /// Checks if number is odd
  static bool isOdd(num? number) {
    if (number is int) {
      return number.isOdd;
    }
    return false;
  }

  /// Clamps number between min and max
  static num clamp(num? value, num min, num max) {
    if (value == null) return min;
    if (value < min) return min;
    if (value > max) return max;
    return value;
  }

  /// Converts degrees to radians
  static double degreesToRadians(num? degrees) {
    return (degrees ?? 0) * (3.1415926535 / 180);
  }

  /// Converts radians to degrees
  static double radiansToDegrees(num? radians) {
    return (radians ?? 0) * (180 / 3.1415926535);
  }

  /// Checks if number is prime
  static bool isPrime(int? number) {
    if (number == null || number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  /// Formats number as currency (simplified)
  static String formatCurrency(num? amount,
      {String symbol = '\$', int decimalDigits = 2}) {
    if (amount == null) return '$symbol 0';
    final fixed = amount.toStringAsFixed(decimalDigits);
    return '$symbol${fixed.replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
  }

  /// Calculates percentage (value * percentage / 100)
  static double percentage(num? value, num? percent) {
    return ((value ?? 0) * (percent ?? 0)) / 100;
  }

  /// Generates random number in range [min, max]
  static int randomInt(int min, int max) {
    return min + (Random().nextInt(max - min + 1));
  }

  /// Checks if number is within range
  static bool inRange(num? value, num min, num max) {
    return value != null && value >= min && value <= max;
  }

  /// Converts number to binary string
  static String toBinary(int? number) {
    return number?.toRadixString(2) ?? '0';
  }

  /// Converts number to hexadecimal string
  static String toHex(int? number) {
    return number?.toRadixString(16) ?? '0';
  }

  /// Rounds to specified decimal places
  static double roundTo(num? value, int places) {
    final num = value ?? 0;
    final factor = pow(10, places);
    return (num * factor).round() / factor;
  }
}
