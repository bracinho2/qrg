import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/add_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/add_repeaters_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/mappers/mappers.dart';

class AddRepeaterRepositoryImpl implements IAddRepeaterRepository {
  final IAddAllRepeatersDataSource _iAddAllRepeatersDataSource;

  AddRepeaterRepositoryImpl(this._iAddAllRepeatersDataSource);
  @override
  Future<Either<Failure, bool>> add({required RepeaterEntity repeater}) async {
    final response = await _iAddAllRepeatersDataSource.call(
        collectionPath: 'repeaters', map: RepeaterEntityMapper.toMap(repeater));
    try {
      return Right(response);
    } catch (failure) {
      return Left(
        RepositoryError(message: 'Erro no Repositório'),
      );
    }
  }
}
