class Validators {
  Validators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^[+]?[\d\s-()]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.replaceAll(RegExp(r'\D'), '').length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  static String? address(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    if (value.length < 10) {
      return 'Please enter a complete address';
    }
    return null;
  }

  static String? zipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'ZIP code is required';
    }
    final zipRegex = RegExp(r'^\d{5}(-\d{4})?$');
    if (!zipRegex.hasMatch(value)) {
      return 'Please enter a valid ZIP code';
    }
    return null;
  }

  static String? creditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Credit card number is required';
    }
    final cardNumber = value.replaceAll(RegExp(r'\s'), '');
    if (cardNumber.length < 13 || cardNumber.length > 19) {
      return 'Invalid credit card number';
    }
    if (!_isValidLuhn(cardNumber)) {
      return 'Invalid credit card number';
    }
    return null;
  }

  static String? cvv(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }
    if (!RegExp(r'^\d{3,4}$').hasMatch(value)) {
      return 'Invalid CVV';
    }
    return null;
  }

  static String? expiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }
    final expRegex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!expRegex.hasMatch(value)) {
      return 'Invalid expiry date (MM/YY)';
    }
    final parts = value.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}');
    final now = DateTime.now();
    final expiry = DateTime(year, month);
    if (expiry.isBefore(now)) {
      return 'Card has expired';
    }
    return null;
  }

  static String? quantity(String? value, {int max = 99}) {
    if (value == null || value.isEmpty) {
      return 'Quantity is required';
    }
    final qty = int.tryParse(value);
    if (qty == null) {
      return 'Invalid quantity';
    }
    if (qty < 1) {
      return 'Quantity must be at least 1';
    }
    if (qty > max) {
      return 'Quantity cannot exceed $max';
    }
    return null;
  }

  static String? price(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price is required';
    }
    final price = double.tryParse(value.replaceAll(RegExp(r'[^\d.]'), ''));
    if (price == null) {
      return 'Invalid price';
    }
    if (price < 0) {
      return 'Price cannot be negative';
    }
    return null;
  }

  static bool _isValidLuhn(String cardNumber) {
    int sum = 0;
    bool alternate = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      sum += digit;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }
}