
class AppValidators {
  AppValidators._();

  // Validate Email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }

    RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // Validate Password
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 2) {
      return 'Password must be at least 2 characters';
    }

    RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Please enter a valid password';
    }

    return null;
  }

  static String? ValidateId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your id';
    }
    final RegExp regex = RegExp(r'^\d{3,8}$');

    if (!regex.hasMatch(value)) {
      return 'ID must contain only numbers and be between 3 to 8 digits long';
    }
    return null;
  }
}
