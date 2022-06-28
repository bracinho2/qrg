import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/update_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/update_repeater_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/mappers/mappers.dart';

class UpdateRepeaterRepositoryImpl implements IUpdateRepeaterRepository {
  final IUpdateRepeaterDatasource _iAddAllRepeatersDataSource;

  UpdateRepeaterRepositoryImpl(this._iAddAllRepeatersDataSource);
  @override
  Future<Either<Failure, bool>> update(
      {required RepeaterEntity repeater}) async {
    final response = await _iAddAllRepeatersDataSource.call(
        collectionPath: 'repeaters', map: RepeaterEntityMapper.toMap(repeater));
    try {
      return Right(response);
    } catch (failure) {
      return Left(
        RepositoryError(message: 'Update Repository Error'),
      );
    }
  }
}
