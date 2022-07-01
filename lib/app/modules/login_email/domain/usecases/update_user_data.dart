import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';
import 'package:qrg/app/modules/login_email/user_params.dart';

abstract class IUpdateUserParams {
  Future<Either<Failure, LoggedUserInfo?>> call(UserParams userParams);
}

class UpdateUserParamsImpl implements IUpdateUserParams {
  final ILoginRepository _iLoginRepository;

  UpdateUserParamsImpl(this._iLoginRepository);
  @override
  Future<Either<Failure, LoggedUserInfo?>> call(UserParams userParams) async {
    if (userParams.userName.isEmpty) {
      return Left(AuthException(message: 'Digite seu Indicativo'));
    }

    // if (!isEmail(userParams.email)) {
    //   return Left(AuthException(message: 'Digite um email válido'));
    // }

    // if (userParams.phone.isEmpty) {
    //   return Left(AuthException(
    //       message: 'Informe seu Telefone no padrão internacional'));
    // }
    if (userParams.password.isEmpty || userParams.password.length < 6) {
      return Left(
          AuthException(message: 'A senha deve conter mais de seis dígitos'));
    }

    return await _iLoginRepository.updateUserParams(
        userName: userParams.userName,
        email: userParams.email,
        phone: userParams.phone,
        password: userParams.password);
  }
}
