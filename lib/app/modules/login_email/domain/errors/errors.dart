abstract class Failure implements Exception {
  String get message;
}

class ConnectionError extends Failure {
  @override
  final String message;
  ConnectionError({required this.message});
}

class AuthException extends Failure {
  @override
  final String message;

  AuthException({
    required this.message,
  });
}

class ErrorLogout extends Failure {
  @override
  final String message;

  ErrorLogout({
    required this.message,
  });
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String message;
  ErrorGetLoggedUser({required this.message});
}

class ErrorLoginEmail extends Failure {
  @override
  final String message;
  ErrorLoginEmail({required this.message});
}
