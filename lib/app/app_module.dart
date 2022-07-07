import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/core/core_module.dart';
import 'package:qrg/app/core/pages/splash_page.dart';
import 'package:qrg/app/modules/home_page/home_page_module.dart';
import 'package:qrg/app/modules/ivgs/ivg_module.dart';
import 'package:qrg/app/modules/login_email/login_email_module.dart';
import 'package:qrg/app/modules/profile/profile_module.dart';
import 'package:qrg/app/modules/repeaters/repeater_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
    HomePageModule(),
    LoginModule(),
    RepeaterModule(),
    IvgModule(),
    ProfileModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/home/', module: HomePageModule()),
    ModuleRoute('/login/', module: LoginModule()),
    ModuleRoute('/repeaters/', module: RepeaterModule()),
    ModuleRoute('/ivgs/', module: IvgModule()),
    ModuleRoute('/profile/', module: ProfileModule()),
  ];
}
