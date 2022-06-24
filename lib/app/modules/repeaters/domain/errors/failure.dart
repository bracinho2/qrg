abstract class Failure implements Exception {
  String get message;
}

class UsecaseError extends Failure {
  @override
  final String message;
  UsecaseError({required this.message});
}

class DatasourceError extends Failure {
  @override
  final String message;
  DatasourceError({required this.message});
}

class RepositoryError extends Failure {
  @override
  final String message;
  RepositoryError({required this.message});
}
