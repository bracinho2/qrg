abstract class Failure implements Exception {
  String get message;
}

class FieldEmpty extends Failure {
  @override
  final String message;
  FieldEmpty({required this.message});
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
