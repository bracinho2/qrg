import 'package:qrg/app/core/authentication_store.dart/authentication_store.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/get_logged_user.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/logout.dart';

class AuthenticationImpl implements IAuthentication {
  // ignore: prefer_typing_uninitialized_variables
  LoggedUserInfo? loggedUser;
  final IGetLoggedUser _iGetLoggedUser;
  final ILogout _iLogout;

  AuthenticationImpl(this._iGetLoggedUser, this._iLogout);

  @override
  Future<void> logout() async {
    _iLogout.call();
    setUser(null);
  }

  @override
  Future<bool> currentUser() async {
    var result = await _iGetLoggedUser.call();
    return result.fold((error) => false, (sucess) {
      setUser(sucess);
      return true;
    });
  }

  @override
  setUser(LoggedUserInfo? user) => loggedUser = user;
}
