import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/get_all_repeaters_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/get_all_repeaters/get_all_repeaters.dart';

class GetAllRepeatersUseCaseImpl implements IGetAllRepeatersUsecase {
  final IGetAllRepeatersRepository _iGetAllRepeatersRepository;

  GetAllRepeatersUseCaseImpl(this._iGetAllRepeatersRepository);

  @override
  Future<Either<Failure, List<RepeaterEntity>>> getAll() async {
    return await _iGetAllRepeatersRepository.getAll();
  }
}
