import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/add_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/get_all_repeaters_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater_impl.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters_impl.dart';
import 'package:qrg/app/modules/repeaters/external/remote_storage/add_repeaters_datasource.impl.dart';
import 'package:qrg/app/modules/repeaters/external/remote_storage/get_all_repeaters_datasource_impl.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/add_repeaters_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/get_all_repeaters_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/repositories/add_repeater_repository_impl.dart';
import 'package:qrg/app/modules/repeaters/infra/repositories/get_all_repeaters_repository_impl.dart';
import 'package:qrg/app/modules/repeaters/presenter/controllers/repeater_store.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_add_page.dart';
import 'package:qrg/app/modules/repeaters/presenter/ui/repeater_page.dart';

class RepeaterModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.lazySingleton<IGetAllRepeatersDataSource>(
        (i) => GetAllRepeatersDataSourceImpl(i())),

    Bind.lazySingleton<IAddAllRepeatersDataSource>(
        (i) => AddRepeaterDataSourceImpl(i())),

    //repository
    Bind.lazySingleton<IGetAllRepeatersRepository>(
        (i) => GetAllRepeatersRepositoryImpl(i())),

    Bind.lazySingleton<IAddRepeaterRepository>(
        (i) => AddRepeaterRepositoryImpl(i())),

    //usecase
    Bind.lazySingleton<IGetAllRepeatersUsecase>(
        (i) => GetAllRepeatersUseCaseImpl(i())),

    Bind.lazySingleton<IAddRepeaterUsecase>((i) => AddRepeaterUsecaseImpl(i())),

    //farmer controller
    Bind.factory<RepeaterStore>((i) => RepeaterStore(i(), i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) =>
          RepeaterPage(repeaterStore: Modular.get<RepeaterStore>())),
      maintainState: false,
    ),
    ChildRoute(
      '/add/',
      child: ((context, args) => RepeaterAddPage(
            repeaterStore: Modular.get<RepeaterStore>(),
            repeaterEntity: args.data,
          )),
      transition: TransitionType.fadeIn,
      duration: Duration(microseconds: 500),
      maintainState: false,
    ),
  ];
}
