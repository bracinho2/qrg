import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/home_page/presenter/ui/home_page.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';

class HomePageModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => HomePage(
          repeaterStore: Modular.get<RepeaterStore>(),
          ivgStore: Modular.get<IvgStore>())),
    ),
  ];
}
