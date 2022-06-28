import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/infra/datasources/login_datasource_interface.dart';
import 'package:qrg/app/modules/login_email/infra/models/user_model.dart';

class FirebaseDataSourceImpl implements ILoginDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseDataSourceImpl(this._firebaseAuth);

  @override
  Future<UserModel> loginEmail(
      {required String email, required String password}) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    var user = result.user;

    return UserModel(
      name: user!.displayName!,
      email: user.email!,
    );
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmail(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (userCredencial.user != null) {
        await _firebaseAuth.currentUser!.updateDisplayName(userName);
      }

      return Right(
        UserModel(
          name: userCredencial.user!.displayName!,
          email: userCredencial.user!.email!,
        ),
      );
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        return Left(ErrorSignIn(message: 'Este email já foi cadastrado!'));
      }
    } catch (e) {
      return Left(ErrorSignIn(message: 'Erro ao cadastrar o email!'));
    }
    return Left(ErrorSignIn(message: 'Erro ao cadastrar o email!'));
  }

  @override
  Future<void> logout() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<UserModel> currentUser() async {
    var user = _firebaseAuth.currentUser;

    if (user == null) {
      throw ErrorGetLoggedUser(message: 'Não pegou o usuário logado');
    }

    return UserModel(
      name: user.displayName!,
      email: user.email!,
    );
  }
}
