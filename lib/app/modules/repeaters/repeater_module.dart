import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/get_all_repeaters_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters_impl.dart';
import 'package:qrg/app/modules/repeaters/external/remote_storage/get_all_repeaters_datasource_impl.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/get_all_repeaters_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/repositories/get_all_repeaters_repository_impl.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page.dart';

class RepeaterModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.lazySingleton<IGetAllRepeatersDataSource>(
        (i) => GetAllRepeatersDataSourceImpl(i())),

    //repository
    Bind.lazySingleton<IGetAllRepeatersRepository>(
        (i) => GetAllRepeatersRepositoryImpl(i())),

    //usecase
    Bind.lazySingleton<IGetAllRepeatersUsecase>(
        (i) => GetAllRepeatersUseCaseImpl(i())),

    //farmer controller
    Bind.factory<RepeaterStore>((i) => RepeaterStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: ((context, args) =>
            RepeaterPage(repeaterStore: Modular.get<RepeaterStore>()))),
  ];
}