/// Exception class for handling various errors.
class TExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TExceptions([this.message = 'Произошла непредвиденная ошибка. Пожалуйста, попробуйте снова.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Адрес электронной почты уже зарегистрирован. Пожалуйста, используйте другой адрес электронной почты.');
      case 'invalid-email':
        return const TExceptions('Указанный адрес электронной почты недействителен. Пожалуйста, введите действительный адрес электронной почты.');
      case 'weak-password':
        return const TExceptions('Пароль слишком слабый. Пожалуйста, выберите более надежный пароль.');
      case 'user-disabled':
        return const TExceptions('Эта учетная запись пользователя была отключена. Пожалуйста, обратитесь в службу поддержки за помощью.');
      case 'user-not-found':
        return const TExceptions('Неверные данные для входа. Пользователь не найден.');
      case 'wrong-password':
        return const TExceptions('Неверный пароль. Пожалуйста, проверьте свой пароль и повторите попытку.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Неверные учетные данные для входа. Пожалуйста, перепроверьте вашу информацию.');
      case 'too-many-requests':
        return const TExceptions('Слишком много запросов. Пожалуйста, повторите попытку позже.');
      case 'invalid-argument':
        return const TExceptions('Недопустимый аргумент, предоставленный методу аутентификации.');
      case 'invalid-password':
        return const TExceptions('Неверный пароль. Пожалуйста, попробуйте снова.');
      case 'invalid-phone-number':
        return const TExceptions('Указанный номер телефона недействителен.');
      case 'operation-not-allowed':
        return const TExceptions('Поставщик входа отключен для вашего проекта Firebase.');
      case 'session-cookie-expired':
        return const TExceptions('Срок действия файла cookie сеанса Firebase истек. Пожалуйста, выполните вход еще раз.');
      case 'uid-already-exists':
        return const TExceptions('Указанный идентификатор пользователя уже используется другим пользователем.');
      case 'sign_in_failed':
        return const TExceptions('Не удалось выполнить вход в систему. Пожалуйста, попробуйте снова.');
      case 'network-request-failed':
        return const TExceptions('Не удалось выполнить сетевой запрос. Пожалуйста, проверьте свое подключение к Интернету.');
      case 'internal-error':
        return const TExceptions('Внутренняя ошибка. Пожалуйста, повторите попытку позже.');
      case 'invalid-verification-code':
        return const TExceptions('Неверный проверочный код. Пожалуйста, введите действительный код.');
      case 'invalid-verification-id':
        return const TExceptions('Неверный идентификатор для подтверждения. Пожалуйста, запросите новый код для подтверждения.');
      case 'quota-exceeded':
        return const TExceptions('Квота превышена. Пожалуйста, повторите попытку позже.');
      default:
        return const TExceptions();
    }
  }
}
