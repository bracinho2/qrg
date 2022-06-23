// ignore: file_names

import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';
import 'package:qrg/app/modules/login_email/infra/datasources/login_datasource_interface.dart';

class LoginRepositoryImpl implements ILoginRepository {
  final ILoginDataSource _iLoginDataSource;

  LoginRepositoryImpl(
    this._iLoginDataSource,
  );

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      final user =
          await _iLoginDataSource.loginEmail(email: email, password: password);
      return Right(user);
    } catch (error) {
      return Left(
          ErrorLoginEmail(message: 'Suas credenciais não foram encontradas.'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> signInWithEmail({
    required String email,
    required String password,
    required String userName,
  }) async {
    return await _iLoginDataSource.signInWithEmail(
        email: email, password: password, userName: userName);
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await _iLoginDataSource.currentUser();
      return Right(user);
    } catch (error) {
      return Left(ErrorGetLoggedUser(
          message: "Error ao tentar recuperar usuario atual logado"));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _iLoginDataSource.logout();
      return const Right(unit);
    } catch (error) {
      return Left(ErrorLogout(message: 'Erro ao tentar fazer logout'));
    }
  }
}
