import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/profile/presenter/ui/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: ((context, args) => const ProfilePage())),
  ];
}
