class Validator {
  //----------------------
  // String Validations
  //----------------------

  /// Validates if string is a valid email
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(value) ? null : 'Enter a valid email';
  }

  /// Validates if string is a valid phone number
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';
    final phoneRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return phoneRegex.hasMatch(value) ? null : 'Enter a valid phone number';
  }

  /// Validates if string is a valid URL
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) return 'URL is required';
    final urlRegex = RegExp(r'^(https?:\/\/)?' // protocol
        r'([\da-z\.-]+)\.' // domain
        r'([a-z\.]{2,6})' // TLD
        r'([\/\w \.-]*)*\/?$' // path
        );
    return urlRegex.hasMatch(value) ? null : 'Enter a valid URL';
  }

  /// Validates password strength
  static String? validatePassword(
    String? value, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireDigits = true,
    bool requireSpecial = true,
  }) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < minLength) return 'At least $minLength characters';
    if (requireUppercase && !value.contains(RegExp(r'[A-Z]'))) {
      return 'At least one uppercase letter';
    }
    if (requireDigits && !value.contains(RegExp(r'[0-9]'))) {
      return 'At least one digit';
    }
    if (requireSpecial && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'At least one special character';
    }
    return null;
  }

  /// Validates if string is not empty
  static String? validateNotEmpty(String? value, [String? fieldName]) {
    if (value == null || value.trim().isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }
    return null;
  }

  /// Validates string length
  static String? validateLength(String? value, int min, int max,
      [String? fieldName]) {
    if (value == null) return 'Invalid value';
    if (value.length < min) return 'Minimum $min characters';
    if (value.length > max) return 'Maximum $max characters';
    return null;
  }

  /// Validates if string matches a regex pattern
  static String? validatePattern(
      String? value, RegExp pattern, String errorMessage) {
    if (value == null || value.isEmpty) return 'Field is required';
    return pattern.hasMatch(value) ? null : errorMessage;
  }

  //----------------------
  // Number Validations
  //----------------------

  /// Validates if string is a valid integer
  static String? validateInt(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty)
      return '${fieldName ?? 'Number'} is required';
    return int.tryParse(value) != null ? null : 'Enter a valid integer';
  }

  /// Validates if string is a valid double
  static String? validateDouble(String? value, [String? fieldName]) {
    if (value == null || value.isEmpty)
      return '${fieldName ?? 'Number'} is required';
    return double.tryParse(value) != null ? null : 'Enter a valid number';
  }

  /// Validates number range
  static String? validateRange(num? value, num min, num max,
      [String? fieldName]) {
    if (value == null) return '${fieldName ?? 'Number'} is required';
    if (value < min) return 'Must be at least $min';
    if (value > max) return 'Must be at most $max';
    return null;
  }

  /// Validates if number is positive
  static String? validatePositive(num? value, [String? fieldName]) {
    if (value == null) return '${fieldName ?? 'Number'} is required';
    return value > 0 ? null : 'Must be positive';
  }

  /// Validates if number is negative
  static String? validateNegative(num? value, [String? fieldName]) {
    if (value == null) return '${fieldName ?? 'Number'} is required';
    return value < 0 ? null : 'Must be negative';
  }

  /// Validates credit card number using Luhn algorithm
  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) return 'Card number is required';

    final cleaned = value.replaceAll(RegExp(r'[\s-]'), '');
    if (cleaned.length < 13 || cleaned.length > 19)
      return 'Invalid card number';

    int sum = 0;
    bool alternate = false;

    for (int i = cleaned.length - 1; i >= 0; i--) {
      var digit = int.tryParse(cleaned[i]);
      if (digit == null) return 'Invalid characters';

      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }

      sum += digit;
      alternate = !alternate;
    }

    return (sum % 10 == 0) ? null : 'Invalid card number';
  }

  /// Validates if value is within percentage range (0-100)
  static String? validatePercentage(num? value) {
    if (value == null) return 'Percentage is required';
    return (value >= 0 && value <= 100) ? null : 'Must be 0-100%';
  }
}
