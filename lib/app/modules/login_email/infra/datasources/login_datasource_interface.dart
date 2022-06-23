import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/infra/models/user_model.dart';

abstract class ILoginDataSource {
  Future<UserModel> loginEmail(
      {required String email, required String password});
  Future<UserModel> currentUser();
  Future<void> logout();
  Future<Either<Failure, UserModel>> signInWithEmail({
    required String email,
    required String password,
    required String userName,
  });
}
