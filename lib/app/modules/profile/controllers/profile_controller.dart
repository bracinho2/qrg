import 'package:qrg/app/core/authentication_store.dart/authentication_store.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/update_user_data.dart';
import 'package:qrg/app/modules/login_email/user_params.dart';

class ProfileStore {
  final IUpdateUserParams iUpdateUserParams;
  final IAuthentication _iAuthentication;
  final SnackBarManager _snackBarManager;

  ProfileStore(
    this.iUpdateUserParams,
    this._iAuthentication,
    this._snackBarManager,
  );
  Future<void> updateUserParams(UserParams userParams) async {
    var result = await iUpdateUserParams.call(userParams);
    result.fold(
        (failure) => _snackBarManager.showError(message: failure.message),
        (sucess) => {
              _iAuthentication.setUser(sucess),
              _snackBarManager.showSuccess(
                  message: 'Dados Atualizados com Sucesso'),
            });
  }
}
