import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';

abstract class IUpdateIvgRepository {
  Future<Either<Failure, bool>> call({required IvgEntity ivgEntity});
}
