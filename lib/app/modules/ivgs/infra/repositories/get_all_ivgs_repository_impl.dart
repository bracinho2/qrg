import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/get_all_ivgs_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/mappers/mappers.dart';

class GetIAllIvgRepository implements IGetAllIvgsRepository {
  final IGetAllIvgsDatasource _iGetAllIvgDatasource;

  GetIAllIvgRepository(this._iGetAllIvgDatasource);
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    final response = await _iGetAllIvgDatasource();
    try {
      return Right(response.map(IvgEntityMapper.fromMap).toList());
    } catch (failure) {
      return Left(
        ErrorMessage(message: 'Erro no Repositório dos IVG\'s'),
      );
    }
  }
}
