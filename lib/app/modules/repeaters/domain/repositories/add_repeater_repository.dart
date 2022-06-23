import 'package:dartz/dartz.dart';

import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';

abstract class IAddRepeaterRepository {
  Future<Either<Failure, bool>> add({required RepeaterEntity repeater});
}
