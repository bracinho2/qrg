import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store.dart';
import 'package:qrg/app/core/authentication_store.dart/authentication_store_impl.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/login_email/domain/repositories/login_repository_interface.dart';
import 'package:qrg/app/modules/login_email/domain/services/connectivity_service_interface.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/get_logged_user.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/login_with_email.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/logout.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/sign_in_with_email.dart';
import 'package:qrg/app/modules/login_email/external/datasources/firebase_auth_email.impl.dart';
import 'package:qrg/app/modules/login_email/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:qrg/app/modules/login_email/infra/drivers/connectivity_driver_interface.dart';
import 'package:qrg/app/modules/login_email/infra/repositories/login_repository_impl.dart';
import 'package:qrg/app/modules/login_email/infra/services/connectivity_service_impl.dart';
import 'package:qrg/app/modules/login_email/presenter/page/login_page.dart';
import 'package:qrg/app/modules/login_email/presenter/page/register_page.dart';
import 'package:qrg/app/modules/login_email/presenter/store/login_store_controller.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    //DATASOURCE
    Bind.lazySingleton<FirebaseDataSourceImpl>(
        (i) => FirebaseDataSourceImpl(i()),
        export: true),

    //REPOSITORY
    Bind.lazySingleton<ILoginRepository>((i) => LoginRepositoryImpl(i()),
        export: true),

    Bind.lazySingleton<IConnectivityDriver>((i) => FlutterConnectivyDriver(i()),
        export: true),

    Bind.lazySingleton<IConnectivityService>(
        (i) => ConnectivityServiceImpl(i()),
        export: true),

    Bind.lazySingleton<ILogout>((i) => LogoutImpl(i()), export: true),

    Bind.factory((i) => Connectivity()),
    Bind.factory((i) => SnackBarManager()),
    Bind.factory<IGetLoggedUser>((i) => GetLoggedUserImpl(i()), export: true),
    Bind.singleton<IAuthentication>((i) => AuthenticationImpl(i(), i()),
        export: true),

    //USERCASE
    Bind.lazySingleton<IloginWithEmail>((i) => LoginWithEmailImpl(i(), i()),
        export: true),

    Bind.lazySingleton<ISignInWithEmailUseCase>(
        (i) => SignInWithEmailImpl(i(), i()),
        export: true),

    Bind.lazySingleton<IGetLoggedUser>((i) => GetLoggedUserImpl(i()),
        export: true),

    //STORE
    Bind.lazySingleton<LoginStore>((i) => LoginStore(i(), i(), i(), i(), i()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) =>
            LoginPage(loginStore: Modular.get<LoginStore>()))),
    ChildRoute('/register/',
        child: ((context, args) =>
            RegisterPage(loginStore: Modular.get<LoginStore>()))),
  ];
}
