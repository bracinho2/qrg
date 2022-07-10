import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/add_ivg_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/update_ivg_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/add_ivg_usecase/add_ivg_usecase.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/update_ivg_usecase/update_ivg_usecase.dart';
import 'package:qrg/app/modules/ivgs/external/remote_storage/add_ivg_datasource_impl.dart';
import 'package:qrg/app/modules/ivgs/external/remote_storage/get_all_ivgs_datasource_impl.dart';
import 'package:qrg/app/modules/ivgs/external/remote_storage/update_ivg_datasource_impl.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/add_ivg_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/get_all_ivgs_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/update_ivg_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/repositories/add_ivg_repository_impl.dart';
import 'package:qrg/app/modules/ivgs/infra/repositories/get_all_ivgs_repository_impl.dart';
import 'package:qrg/app/modules/ivgs/infra/repositories/update_ivg_repository_impl.dart';
import 'package:qrg/app/modules/ivgs/presenter/add_page/add_page.dart';
import 'package:qrg/app/modules/ivgs/presenter/ivgs_store.dart';

import 'presenter/list_page/ivg_page.dart';

class IvgModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.lazySingleton<IGetAllIvgsDatasource>(
        (i) => GetAllIvgsDataSourceImpl(i()),
        export: true),

    Bind.lazySingleton<IAddIvgDatasource>((i) => AddIvgDatasourceImpl(i()),
        export: true),

    Bind.lazySingleton<IUpdateIvgDatasource>(
        (i) => UpdateIvgDatasourceImpl(i()),
        export: true),

    //repository
    Bind.lazySingleton<IGetAllIvgsRepository>(
        (i) => GetIAllIvgRepositoryImpl(i()),
        export: true),

    Bind.lazySingleton<IAddIvgRepository>((i) => AddIvgRepositoryImpl(i()),
        export: true),

    Bind.lazySingleton<IUpdateIvgRepository>(
        (i) => UpdateIvgRepositoryImpl(i()),
        export: true),

    //usecase
    Bind.lazySingleton<IGetAllIvgUsecase>((i) => GetAllIvgUsecase(i()),
        export: true),

    Bind.lazySingleton<IAddIvgUsecase>((i) => AddIvgUsecaseImpl(i()),
        export: true),

    Bind.lazySingleton<IUpdateIvgUsecase>((i) => UpdateIvgUsecase(i()),
        export: true),

    //farmer controller
    Bind.lazySingleton<IvgStore>((i) => IvgStore(i(), i(), i(), i()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => IvgPage(ivgStore: Modular.get<IvgStore>())),
      maintainState: false,
    ),
    ChildRoute(
      '/add/',
      child: ((context, args) => IvgAddPage(
            store: Modular.get<IvgStore>(),
            entity: args.data,
          )),
      transition: TransitionType.fadeIn,
      duration: Duration(microseconds: 500),
      maintainState: false,
    ),
  ];
}
