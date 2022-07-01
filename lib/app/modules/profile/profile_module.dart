import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/profile/controllers/profile_controller.dart';
import 'package:qrg/app/modules/profile/presenter/ui/menu_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    //profile store
    Bind.lazySingleton<ProfileStore>((i) => ProfileStore(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) =>
            ProfilePage(store: Modular.get<ProfileStore>()))),
  ];
}
