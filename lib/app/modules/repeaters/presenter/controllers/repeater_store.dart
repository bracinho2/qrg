import 'package:flutter_triple/flutter_triple.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';

// ignore: must_be_immutable
class RepeaterStore extends NotifierStore<Failure, List<RepeaterEntity>> {
  final IGetAllRepeatersUsecase _iGetAllRepeatersUsecase;

  RepeaterStore(
    this._iGetAllRepeatersUsecase,
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
}
