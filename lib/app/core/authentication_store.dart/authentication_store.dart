import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';

abstract class IAuthentication {
  Future<bool> currentUser();
  Future<void> logout();
  setUser(LoggedUserInfo? user);
}
