import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/core_module.dart';
import 'package:qrg/app/core/pages/splash_page.dart';
import 'package:qrg/app/modules/login_email/login_email_module.dart';
import 'package:qrg/app/modules/profile/profile_module.dart';
import 'package:qrg/app/modules/repeaters/repeater_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    LoginModule(),
    RepeaterModule(),
    ProfileModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/repeaters/', module: RepeaterModule()),
    ModuleRoute('/profile/', module: ProfileModule()),
  ];
}
