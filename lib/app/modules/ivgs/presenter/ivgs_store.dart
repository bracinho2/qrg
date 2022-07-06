import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';

// ignore: must_be_immutable
class IvgStore extends NotifierStore<Failure, List<IvgEntity>> {
  final IGetAllIvgUsecase _iGetAllIvgUsecase;
  //final IAddRepeaterUsecase _iAddRepeaterUsecase;
  //final IUpdateRepeaterUsecase _iUpdateRepeaterUsecase;
  //final SnackBarManager _snackBarManager;

  IvgStore(
    this._iGetAllIvgUsecase,
    //this._iAddRepeaterUsecase,
    //this._snackBarManager,
    //this._iUpdateRepeaterUsecase,
  ) : super([]) {
    //fetch();
  }

  List<IvgEntity> _cachedList = [];
  List<IvgEntity> filteredList = [];

  onChanged(String filter) {
    setLoading(true);
    final tmpList = _cachedList
        .where((entity) =>
            entity.callSign.toLowerCase().contains(filter.toLowerCase()) ||
            entity.city.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    update(tmpList);
    setLoading(false);
  }

  filterList({String filter = ''}) {
    if (filter.isNotEmpty) {
      setLoading(true);
      filteredList = _cachedList
          .where((entity) =>
              entity.callSign.toLowerCase().contains(filter.toLowerCase()) ||
              entity.city.toLowerCase().contains(filter.toLowerCase()))
          .toList();

      update(filteredList);
      setLoading(false);
    } else {
      update(_cachedList);
    }
  }

  Future<void> fetch() async {
    setLoading(true);
    var result = await _iGetAllIvgUsecase();

    await Future.delayed(Duration(seconds: 2));
    result.fold(
      (failure) => setError(failure),
      (success) => {
        success.sort((a, b) => a.callSign.compareTo(b.callSign)),
        update(success),
        _cachedList = success,
      },
    );

    setLoading(false);
  }

  Future<void> send({
    String? id,
    required String callSign,
    required city,
    required String state,
    required String country,
    required String grid,
    required String qrg,
    required String tone,
    required String coverage,
    required String protocol,
    required String informedBy,
    required bool active,
    required bool operation,
  }) async {
    final repeaterEntity = IvgEntity(
      id: id ?? '',
      callSign: callSign,
      city: city,
      state: state,
      country: country,
      grid: grid,
      qrg: qrg,
      tone: tone,
      coverage: coverage,
      protocol: protocol,
      informedBy: informedBy,
      active: active,
      operation: operation,
    );

    if (repeaterEntity.id != '') {
      //var result =
      //    await _iUpdateRepeaterUsecase.update(repeaterEntity: repeaterEntity);

      // result.fold(
      //   (error) => _snackBarManager.showError(message: error.message),
      //   (
      //     success,
      //   ) {
      //     fetch();
      //     //_snackBarManager.showSuccess(message: 'Atualizado com sucesso!');
      //     Modular.to.navigate('/repeaters/');
      //   },
      // );
    } else {
      // var result =
      //     await _iAddRepeaterUsecase.add(repeaterEntity: repeaterEntity);

      // result.fold((error) {
      //   _snackBarManager.showError(message: error.message);
      // }, (sucess) {
      //   //_snackBarManager.showSuccess(message: 'Cadastrado com sucesso!');
      //   Modular.to.navigate('/');
      // });
    }
  }
}
