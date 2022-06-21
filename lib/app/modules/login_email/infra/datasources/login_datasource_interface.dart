import 'package:qrg/app/modules/login_email/infra/models/user_model.dart';

abstract class ILoginDataSource {
  Future<UserModel> loginEmail(
      {required String email, required String password});
  Future<UserModel> currentUser();
  Future<void> logout();
}
