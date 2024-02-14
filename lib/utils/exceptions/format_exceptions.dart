/// Custom exception class to handle various format-related errors.
class TFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const TFormatException('Формат адреса электронной почты неверен. Пожалуйста, введите действительный адрес электронной почты.');
      case 'invalid-phone-number-format':
        return const TFormatException('Указанный формат телефонного номера неверен. Пожалуйста, введите действительный номер.');
      case 'invalid-date-format':
        return const TFormatException('Формат даты неверен. Пожалуйста, введите действительную дату.');
      case 'invalid-url-format':
        return const TFormatException('Формат URL недопустим. Пожалуйста, введите действительный URL.');
      case 'invalid-credit-card-format':
        return const TFormatException('Формат кредитной карты неверен. Пожалуйста, введите действительный номер кредитной карты.');
      case 'invalid-numeric-format':
        return const TFormatException('Вводимые данные должны быть в допустимом числовом формате.');
    // Add more cases as needed...
      default:
        return const TFormatException();
    }
  }
}