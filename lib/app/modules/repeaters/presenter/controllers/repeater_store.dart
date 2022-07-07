import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/update_repeater/update_repeater.dart';

// ignore: must_be_immutable
class RepeaterStore extends NotifierStore<Failure, List<RepeaterEntity>> {
  final IGetAllRepeatersUsecase _iGetAllRepeatersUsecase;
  final IAddRepeaterUsecase _iAddRepeaterUsecase;
  final IUpdateRepeaterUsecase _iUpdateRepeaterUsecase;
  final SnackBarManager _snackBarManager;

  RepeaterStore(
    this._iGetAllRepeatersUsecase,
    this._iAddRepeaterUsecase,
    this._snackBarManager,
    this._iUpdateRepeaterUsecase,
  ) : super([]) {
    fetch();
  }

  List<RepeaterEntity> _cachedList = [];
  List<RepeaterEntity> filteredList = [];

  onChanged(String filter) {
    setLoading(true);
    final tmpList = _cachedList
        .where((farmer) =>
            farmer.callSign.toLowerCase().contains(filter.toLowerCase()) ||
            farmer.city.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    update(tmpList);
    setLoading(false);
  }

  Future<void> fetch() async {
    setLoading(true);
    var result = await _iGetAllRepeatersUsecase.getAll();

    //await Future.delayed(Duration(seconds: 2));
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
    required String tx,
    required String rx,
    required String tone,
    required String coverage,
    required String protocol,
    required String informedBy,
    required bool active,
    required bool operation,
  }) async {
    final repeaterEntity = RepeaterEntity(
      id: id ?? '',
      callSign: callSign,
      city: city,
      state: state,
      country: country,
      grid: grid,
      tx: tx,
      rx: rx,
      tone: tone,
      coverage: coverage,
      protocol: protocol,
      informedBy: informedBy,
      active: active,
      operation: operation,
    );

    if (repeaterEntity.id != '') {
      var result =
          await _iUpdateRepeaterUsecase.update(repeaterEntity: repeaterEntity);

      result.fold(
        (error) => _snackBarManager.showError(message: error.message),
        (
          success,
        ) {
          fetch();
          //_snackBarManager.showSuccess(message: 'Atualizado com sucesso!');
          Modular.to.navigate('/repeaters/');
        },
      );
    } else {
      var result =
          await _iAddRepeaterUsecase.add(repeaterEntity: repeaterEntity);

      result.fold((error) {
        _snackBarManager.showError(message: error.message);
      }, (sucess) {
        //_snackBarManager.showSuccess(message: 'Cadastrado com sucesso!');
        Modular.to.navigate('/');
      });
    }
  }
}
