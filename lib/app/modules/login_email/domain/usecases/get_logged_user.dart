import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';

abstract class IGetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements IGetLoggedUser {
  final ILoginRepository _iLoginRepository;

  GetLoggedUserImpl(this._iLoginRepository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await _iLoginRepository.loggedUser();
  }
}
