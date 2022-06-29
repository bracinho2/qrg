import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/user_params.dart';
import 'package:string_validator/string_validator.dart';

abstract class IUpdateUserParams {
  Future<Either<Failure, LoggedUserInfo?>> call(UserParams userParams);
}

class UpdateUserParams implements IUpdateUserParams {
  final ILoginRepository _iLoginRepository;

  UpdateUserParams(this._iLoginRepository);
  @override
  Future<Either<Failure, LoggedUserInfo?>> call(UserParams userParams) async {
    if (userParams.userName.isEmpty) {
      return Left(AuthException(message: 'Digite seu Indicativo'));
    }

    if (!isEmail(userParams.email)) {
      return Left(AuthException(message: 'Digite um email válido'));
    }

    if (userParams.phone.isEmpty) {
      return Left(AuthException(
          message: 'Informe seu Telefone no padrão internacional'));
    }
    if (userParams.password.isEmpty) {
      return Left(AuthException(message: 'Digite uma senha válida'));
    }

    return await _iLoginRepository.updateUserParams(
        userName: userParams.userName,
        email: userParams.email,
        phone: userParams.phone,
        password: userParams.password);
  }
}
