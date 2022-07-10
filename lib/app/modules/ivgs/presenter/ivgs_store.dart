import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/add_ivg_usecase/add_ivg_usecase.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';

// ignore: must_be_immutable
class IvgStore extends NotifierStore<Failure, List<IvgEntity>> {
  final IGetAllIvgUsecase _iGetAllIvgUsecase;
  final IAddIvgUsecase _iAddIvgUsecase;
  //final IUpdateRepeaterUsecase _iUpdateRepeaterUsecase;
  final SnackBarManager _snackBarManager;

  IvgStore(
    this._iGetAllIvgUsecase,
    this._iAddIvgUsecase,
    this._snackBarManager,
    //this._iUpdateRepeaterUsecase,
  ) : super([]) {
    fetch();
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

  Future<void> fetch() async {
    setLoading(true);
    var result = await _iGetAllIvgUsecase();

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
      var result = await _iAddIvgUsecase.call(ivgEntity: repeaterEntity);

      result.fold((error) {
        _snackBarManager.showError(message: error.message);
      }, (sucess) {
        Modular.to.navigate('/home/');
      });
    }
  }
}
