import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';

abstract class ILogout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements ILogout {
  final ILoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
