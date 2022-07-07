import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';
import 'package:qrg/app/modules/ivgs/external/remote_storage/get_all_ivgs_datasource_impl.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/get_all_ivgs_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/repositories/get_all_ivgs_repository_impl.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';

import 'presenter/list_page/ivg_page.dart';

class IvgModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.lazySingleton<IGetAllIvgsDatasource>(
        (i) => GetAllIvgsDataSourceImpl(i()),
        export: true),

    // Bind.lazySingleton<IAddAllRepeatersDataSource>(
    //     (i) => AddRepeaterDataSourceImpl(i()),
    //     export: true),

    // Bind.lazySingleton<IUpdateRepeaterDatasource>(
    //     (i) => UpdateRepeaterDatasourceImpl(i()),
    //     export: true),

    //repository
    Bind.lazySingleton<IGetAllIvgsRepository>(
        (i) => GetIAllIvgRepositoryImpl(i()),
        export: true),

    // Bind.lazySingleton<IAddRepeaterRepository>(
    //     (i) => AddRepeaterRepositoryImpl(i()),
    //     export: true),

    // Bind.lazySingleton<IUpdateRepeaterRepository>(
    //     (i) => UpdateRepeaterRepositoryImpl(i()),
    //     export: true),

    //usecase
    Bind.lazySingleton<IGetAllIvgUsecase>((i) => GetAllIvgUsecase(i()),
        export: true),

    // Bind.lazySingleton<IAddRepeaterUsecase>((i) => AddRepeaterUsecaseImpl(i()),
    //     export: true),

    // Bind.lazySingleton<IUpdateRepeaterUsecase>(
    //     (i) => UpdateRepeaterUsecaseImpl(i()),
    //     export: true),

    //farmer controller
    Bind.lazySingleton<IvgStore>((i) => IvgStore(i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => IvgPage(ivgStore: Modular.get<IvgStore>())),
      maintainState: false,
    ),
    // ChildRoute(
    //   '/add/',
    //   child: ((context, args) => RepeaterAddPage(
    //         repeaterStore: Modular.get<RepeaterStore>(),
    //         repeaterEntity: args.data,
    //       )),
    //   transition: TransitionType.fadeIn,
    //   duration: Duration(microseconds: 500),
    //   maintainState: false,
    // ),
  ];
}
