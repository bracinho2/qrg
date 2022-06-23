import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/add_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater.dart';

class AddRepeaterUsecaseImpl implements IAddRepeaterUsecase {
  final IAddRepeaterRepository _iAddRepeaterRepository;

  AddRepeaterUsecaseImpl(this._iAddRepeaterRepository);
  @override
  Future<Either<Failure, bool>> add(
      {required RepeaterEntity repeaterEntity}) async {
    return _iAddRepeaterRepository.add(repeater: repeaterEntity);
  }
}
