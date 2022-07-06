abstract class Failure implements Exception {
  String get message;
}

class ErrorMessage extends Failure {
  @override
  final String message;
  ErrorMessage({required this.message});
}
