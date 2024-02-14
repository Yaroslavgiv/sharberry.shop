
class TValidator {
  /// Empty Text Validation
  static String? validateEmptyText(String? fieldName, String? value) {
    if(value == null || value.isEmpty) {
      return 'Заполните $fieldName';
    }
    return null;
  }

  /// Username Validation
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Требуется имя пользователя.';
    }

    // Define a regular expression pattern for the username.
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

    // Create a RegExp instance from the pattern.
    final regex = RegExp(pattern);

    // Use the hasMatch method to check if the username matches the pattern.
    bool isValid = regex.hasMatch(username);

    // Check if the username doesn't start or end with an underscore or hyphen.
    if (isValid) {
      isValid = !username.startsWith('_') && !username.startsWith('-') && !username.endsWith('_') && !username.endsWith('-');
    }

    if (!isValid) {
      return 'Имя пользователя недопустимо.';
    }

    return null;
  }
  
  /// Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Требуется электронная почта.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Неверный e-mail.';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Требуется пароль.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Длина пароля должна составлять не менее 6 символов.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Пароль должен содержать по крайней мере одну заглавную букву.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Пароль должен содержать по крайней мере одну цифру.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[-_!@#$%^&*(),.?":{}|<>]'))) {
      return 'Пароль должен содержать по крайней мере один специальный символ.';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Требуется номер телефона.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Недопустимый формат телефонного номера (требуется 10 цифр).';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
