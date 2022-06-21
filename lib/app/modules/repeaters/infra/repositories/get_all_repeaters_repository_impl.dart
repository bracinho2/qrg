import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/get_all_repeaters_repository.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/get_all_repeaters_datasource.dart';
import 'package:qrg/app/modules/repeaters/infra/mappers/mappers.dart';

class GetAllRepeatersRepositoryImpl implements IGetAllRepeatersRepository {
  final IGetAllRepeatersDataSource _iGetAllRepeatersDataSource;

  GetAllRepeatersRepositoryImpl(this._iGetAllRepeatersDataSource);
  @override
  Future<Either<Failure, List<RepeaterEntity>>> getAll() async {
    final response = await _iGetAllRepeatersDataSource.call();

    try {
      return Right(response.map(RepeaterEntityMapper.fromMap).toList());
    } catch (failure) {
      return Left(
        RepositoryError(message: 'Erro no Repositório'),
      );
    }
  }
}
