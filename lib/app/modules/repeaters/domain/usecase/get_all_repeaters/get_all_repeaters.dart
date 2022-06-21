import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';

abstract class IGetAllRepeatersUsecase {
  Future<Either<Failure, List<RepeaterEntity>>> getAll();
}
