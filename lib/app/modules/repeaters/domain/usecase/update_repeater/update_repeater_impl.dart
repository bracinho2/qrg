import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/update_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/update_repeater/update_repeater.dart';

class UpdateRepeaterUsecaseImpl implements IUpdateRepeaterUsecase {
  final IUpdateRepeaterRepository _iUpdateRepeaterRepository;

  UpdateRepeaterUsecaseImpl(this._iUpdateRepeaterRepository);
  @override
  Future<Either<Failure, bool>> update(
      {required RepeaterEntity repeaterEntity}) async {
    return await _iUpdateRepeaterRepository.update(
      repeater: repeaterEntity,
    );
  }
}
