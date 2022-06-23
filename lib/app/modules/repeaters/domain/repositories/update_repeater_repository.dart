import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';

abstract class IUpdateRepeaterRepository {
  Future<Either<Failure, bool>> update({
    required RepeaterEntity repeater,
  });
}
