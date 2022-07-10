import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/update_ivg_repository.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/update_ivg_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/mappers/mappers.dart';

class UpdateIvgRepositoryImpl implements IUpdateIvgRepository {
  final IUpdateIvgDatasource _iUpdateIvgDatasource;

  UpdateIvgRepositoryImpl(this._iUpdateIvgDatasource);

  @override
  Future<Either<Failure, bool>> call({required IvgEntity ivgEntity}) async {
    final response = await _iUpdateIvgDatasource.call(
        collectionPath: 'ivgs', map: IvgEntityMapper.toMap(ivgEntity));

    try {
      return Right(response);
    } catch (failure) {
      return Left(ErrorMessage(message: 'Update Ivg Repository Error'));
    }
  }
}
