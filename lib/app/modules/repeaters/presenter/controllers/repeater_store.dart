import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/core/snack_bar_manager/snack_bar_manager.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';

// ignore: must_be_immutable
class RepeaterStore extends NotifierStore<Failure, List<RepeaterEntity>> {
  final IGetAllRepeatersUsecase _iGetAllRepeatersUsecase;
  // final IAddRepeaterUsecase _iAddRepeaterUsecase;
  //final SnackBarManager _snackBarManager;

  RepeaterStore(
    this._iGetAllRepeatersUsecase,
    // this._iAddRepeaterUsecase,
    //this._snackBarManager,
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

  filterList({String filter = ''}) {
    if (filter.isNotEmpty) {
      setLoading(true);
      filteredList = _cachedList
          .where((farmer) =>
              farmer.callSign.toLowerCase().contains(filter.toLowerCase()) ||
              farmer.city.toLowerCase().contains(filter.toLowerCase()))
          .toList();

      update(filteredList);
      setLoading(false);
    } else {
      update(_cachedList);
    }
  }

  fetch() async {
    var result = await _iGetAllRepeatersUsecase.getAll();
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
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

  // Future<void> addRepeater(
  //   String id,
  //   String callSign,
  //   String city,
  //   String state,
  //   String country,
  //   String grid,
  //   String tx,
  //   String rx,
  //   String tone,
  //   String coverage,
  //   String protocol,
  //   String informedBy,
  //   bool active,
  //   bool operation,
  // ) async {
  //   final repeaterEntity = RepeaterEntity(
  //     id: id,
  //     callSign: callSign,
  //     city: city,
  //     state: state,
  //     country: country,
  //     grid: grid,
  //     tx: tx,
  //     rx: rx,
  //     tone: tone,
  //     coverage: coverage,
  //     protocol: protocol,
  //     informedBy: informedBy,
  //     active: active,
  //     operation: operation,
  //   );
  //   var result = await _iAddRepeaterUsecase.add(repeaterEntity: repeaterEntity);

  //   result.fold(
  //       (error) => {
  //             _snackBarManager.showError(message: error.message),
  //           },
  //       (sucess) => {
  //             _snackBarManager.showSuccess(message: 'Cadastrado com sucesso!'),
  //           });
  // }
}
