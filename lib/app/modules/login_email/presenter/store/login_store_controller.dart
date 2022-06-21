import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/login_email/domain/credencial_params.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/login_with_email.dart';

class LoginStore {
  final IAuthentication _iAuthentication;
  final IloginWithEmail _iloginWithEmail;
  final SnackBarManager _snackBarManager;

  LoginStore(
    this._iAuthentication,
    this._iloginWithEmail,
    this._snackBarManager,
  );

  Future<void> checkLogin({
    required String password,
    required String email,
  }) async {
    var result = await _iloginWithEmail.call(
      CredentialsParams(
        password: password,
        email: email,
      ),
    );

    result.fold(
        (failure) => {
              _snackBarManager.showError(message: failure.message),
            }, (loggedUser) {
      _iAuthentication.setUser(loggedUser);
      //Modular.to.pushNamed('/profile/');
      Modular.to.pushNamedAndRemoveUntil('/profile/', (_) => false);
      print(loggedUser);
      _iAuthentication.setUser(loggedUser);
    });
  }
}
