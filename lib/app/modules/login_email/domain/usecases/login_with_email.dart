import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/credencial_params.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';
import 'package:qrg/app/modules/login_email/domain/services/connectivity_service_interface.dart';
import 'package:string_validator/string_validator.dart';

abstract class IloginWithEmail {
  Future<Either<Failure, LoggedUserInfo?>> call(CredentialsParams credencial);
}

class LoginWithEmailImpl implements IloginWithEmail {
  final ILoginRepository repository;
  final IConnectivityService _connectivityService;

  LoginWithEmailImpl(this.repository, this._connectivityService);

  @override
  Future<Either<Failure, LoggedUserInfo?>> call(
      CredentialsParams credencial) async {
    var result = await _connectivityService.isOnline();

    if (result.isLeft()) {
      return result.map((r) {
        // ignore: avoid_print
        print('USECASE LOGIN -> HABEMUS INTERNET =)');
        return null;
      });
    }

    if (!isEmail(credencial.email)) {
      return Left(AuthException(message: 'Digite um email válido'));
    }
    if (credencial.password.isEmpty) {
      return Left(AuthException(message: 'Digite uma senha válida'));
    }

    return await repository.loginEmail(
        email: credencial.email, password: credencial.password);
  }
}
