import 'package:qrg/app/modules/login_email/domain/entities/logged_user.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({
    required String name,
    required String email,
  }) : super(
          name: name,
          email: email,
        );

  LoggedUser toLoggedUser() => this;
}
