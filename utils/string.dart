class StringUtils {
  /// Capitalizes first letter of a string
  static String capitalize(String? input) {
    if (input == null || input.isEmpty) return '';
    return input[0].toUpperCase() + input.substring(1);
  }

  /// Reverses a string
  static String reverse(String? input) {
    if (input == null) return '';
    return String.fromCharCodes(input.runes.toList().reversed);
  }

  /// Checks if string is numeric
  static bool isNumeric(String? input) {
    if (input == null) return false;
    return double.tryParse(input) != null;
  }

  /// Truncates string with ellipsis
  static String truncate(String? input, int maxLength,
      [String ellipsis = '...']) {
    if (input == null) return '';
    return input.length <= maxLength
        ? input
        : input.substring(0, maxLength) + ellipsis;
  }

  /// Converts to snake_case
  static String toSnakeCase(String? input) {
    if (input == null) return '';
    return input.trim().replaceAll(RegExp(r'\s+'), '_').toLowerCase();
  }

  /// Removes all whitespace
  static String removeWhitespace(String? input) {
    if (input == null) return '';
    return input.replaceAll(RegExp(r'\s+'), '');
  }

  /// Counts occurrences of substring
  static int countOccurrences(String? input, String substring) {
    if (input == null || input.isEmpty || substring.isEmpty) return 0;
    return input.split(substring).length - 1;
  }

  /// Wraps string with prefix/suffix
  static String wrap(String? input, {String prefix = '', String suffix = ''}) {
    if (input == null) return '';
    return prefix + input + suffix;
  }

  /// Checks if string is palindrome
  static bool isPalindrome(String? input) {
    if (input == null) return false;
    final cleaned = input.replaceAll(RegExp(r'[\W_]'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }
}
