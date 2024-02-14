/// Exception class for handling various platform-related errors.
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Неверные учетные данные для входа. Пожалуйста, перепроверьте вашу информацию.';
      case 'too-many-requests':
        return 'Слишком много запросов. Пожалуйста, повторите попытку позже.';
      case 'invalid-argument':
        return 'Недопустимый аргумент, предоставленный методу аутентификации.';
      case 'invalid-password':
        return 'Неверный пароль. Пожалуйста, попробуйте снова.';
      case 'invalid-phone-number':
        return 'Указанный номер телефона недействителен.';
      case 'operation-not-allowed':
        return 'Поставщик входа отключен для вашего проекта Firebase.';
      case 'session-cookie-expired':
        return 'Срок действия файла cookie сеанса Firebase истек. Пожалуйста, выполните вход еще раз.';
      case 'uid-already-exists':
        return 'Предоставленный идентификатор пользователя уже используется другим пользователем.';
      case 'sign_in_failed':
        return 'Не удалось выполнить вход в систему. Пожалуйста, попробуйте снова.';
      case 'network-request-failed':
        return 'Не удалось выполнить сетевой запрос. Пожалуйста, проверьте свое подключение к Интернету.';
      case 'internal-error':
        return 'Внутренняя ошибка. Пожалуйста, повторите попытку позже.';
      case 'invalid-verification-code':
        return 'Неверный проверочный код. Пожалуйста, введите действительный код.';
      case 'invalid-verification-id':
        return 'Неверный идентификатор для подтверждения. Пожалуйста, запросите новый код для подтверждения.';
      case 'quota-exceeded':
        return 'Квота превышена. Пожалуйста, повторите попытку позже.';
    // Add more cases as needed...
      default:
        return 'Произошла непредвиденная ошибка платформы. Пожалуйста, попробуйте снова.';
    }
  }
}
