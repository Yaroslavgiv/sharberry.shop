/// Custom exception class to handle various Firebase-related errors.
class TFirebaseException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  TFirebaseException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'unknown':
        return 'Произошла неизвестная ошибка Firebase. Пожалуйста, попробуйте снова.';
      case 'invalid-custom-token':
        return 'Неверен формат пользовательского токена. Пожалуйста, проверьте свой пользовательский токен.';
      case 'custom-token-mismatch':
        return 'Пользовательский токен соответствует другой аудитории.';
      case 'user-disabled':
        return 'Учетная запись пользователя была отключена.';
      case 'user-not-found':
        return 'Не найден пользователь с указанным адресом электронной почты или UID.';
      case 'invalid-email':
        return 'Указанный адрес электронной почты недействителен. Пожалуйста, введите действительный адрес электронной почты.';
      case 'email-already-in-use':
        return 'Адрес электронной почты уже зарегистрирован. Пожалуйста, используйте другой адрес электронной почты.';
      case 'wrong-password':
        return 'Неверный пароль. Пожалуйста, проверьте свой пароль и повторите попытку.';
      case 'weak-password':
        return 'Пароль слишком слабый. Пожалуйста, выберите более надежный пароль.';
      case 'provider-already-linked':
        return 'Учетная запись уже связана с другим провайдером.';
      case 'operation-not-allowed':
        return 'Эта операция запрещена. Обратитесь за помощью в службу поддержки.';
      case 'invalid-credential':
        return 'Предоставленные учетные данные неверны или срок их действия истек.';
      case 'invalid-verification-code':
        return 'Неверный проверочный код. Пожалуйста, введите действительный код.';
      case 'invalid-verification-id':
        return 'Неверный идентификатор для подтверждения. Пожалуйста, запросите новый код для подтверждения.';
      case 'captcha-check-failed':
        return 'Ответ reCAPTCHA неверен. Пожалуйста, попробуйте снова.';
      case 'app-not-authorized':
        return 'Приложение не авторизовано для использования аутентификации Firebase с предоставленным ключом API.';
      case 'keychain-error':
        return 'Произошла ошибка связки ключей. Пожалуйста, проверьте связку ключей и повторите попытку.';
      case 'internal-error':
        return 'Произошла внутренняя ошибка аутентификации. Пожалуйста, повторите попытку позже.';
      case 'invalid-app-credential':
        return 'Учетные данные приложения недействительны. Пожалуйста, укажите действительные учетные данные приложения.';
      case 'user-mismatch':
        return 'Предоставленные учетные данные не соответствуют ранее вошедшему в систему пользователю.';
      case 'requires-recent-login':
        return 'Эта операция конфиденциальна и требует недавней аутентификации. Пожалуйста, войдите в систему еще раз.';
      case 'quota-exceeded':
        return 'Квота превышена. Пожалуйста, повторите попытку позже.';
      case 'account-exists-with-different-credential':
        return 'Учетная запись уже существует с тем же адресом электронной почты, но другими учетными данными для входа.';
      case 'missing-iframe-start':
        return 'В шаблоне электронной почты отсутствует начальный тег iframe.';
      case 'missing-iframe-end':
        return 'В шаблоне электронной почты отсутствует конечный тег iframe.';
      case 'missing-iframe-src':
        return 'В шаблоне электронной почты отсутствует атрибут iframe src.';
      case 'auth-domain-config-required':
        return 'Для ссылки проверки кода действия требуется конфигурация домена аутентификации.';
      case 'missing-app-credential':
        return 'Учетные данные приложения отсутствуют. Пожалуйста, укажите действительные учетные данные приложения.';
      case 'session-cookie-expired':
        return 'Срок действия файла cookie сеанса Firebase истек. Пожалуйста, выполните вход еще раз';
      case 'uid-already-exists':
        return 'Предоставленный идентификатор пользователя уже используется другим пользователем.';
      case 'web-storage-unsupported':
        return 'Веб-хранилище не поддерживается или отключено.';
      case 'app-deleted':
        return 'Этот экземпляр приложения Firebase был удален.';
      case 'user-token-mismatch':
        return 'Предоставленный токен пользователя имеет несоответствие с идентификатором пользователя, прошедшего проверку подлинности.';
      case 'invalid-message-payload':
        return 'Полезная нагрузка сообщения проверки шаблона электронной почты недопустима.';
      case 'invalid-sender':
        return 'Отправитель шаблона электронной почты неверен. Пожалуйста, подтвердите адрес электронной почты отправителя.';
      case 'invalid-recipient-email':
        return 'Адрес электронной почты получателя неверен. Пожалуйста, укажите действительный адрес электронной почты получателя.';
      case 'missing-action-code':
        return 'Код действия отсутствует. Пожалуйста, укажите действительный код действия.';
      case 'user-token-expired':
        return 'Срок действия токена пользователя истек, и требуется аутентификация. Пожалуйста, выполните вход еще раз.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Неверные учетные данные для входа.';
      case 'expired-action-code':
        return 'Срок действия кода действия истек. Пожалуйста, запросите новый код действия.';
      case 'invalid-action-code':
        return 'Код действия неверен. Пожалуйста, проверьте код и повторите попытку.';
      case 'credential-already-in-use':
        return 'Эти учетные данные уже связаны с другой учетной записью пользователя.';
      default:
        return 'Произошла неожиданная ошибка Firebase. Пожалуйста, попробуйте снова.';
    }
  }
}
