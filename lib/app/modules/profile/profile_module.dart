import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/login_email/domain/usecases/update_user_data.dart';
import 'package:qrg/app/modules/profile/controllers/profile_controller.dart';
import 'package:qrg/app/modules/profile/presenter/ui/menu_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    //profile usecase
    Bind.lazySingleton<IUpdateUserParams>((i) => UpdateUserParamsImpl(i())),

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
