import 'package:qrg/app/modules/login_email/domain/entities/logged_user.dart';
import 'package:qrg/app/modules/login_email/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({
    String? name,
    String? email,
  }) : super(
          userName: name,
          email: email,
        );

  LoggedUser toLoggedUser() => this;

  @override
  // ignore: recursive_getters
  String get name => name;

  @override
  // ignore: recursive_getters
  String get email => email;
}
