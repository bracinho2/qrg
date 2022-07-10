import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/add_ivg_repository.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/add_ivg_datasource.dart';
import 'package:qrg/app/modules/ivgs/infra/mappers/mappers.dart';

class AddIvgRepositoryImpl implements IAddIvgRepository {
  final IAddIvgDatasource _iAddIvgDatasource;

  AddIvgRepositoryImpl(this._iAddIvgDatasource);

  @override
  Future<Either<Failure, bool>> call({required IvgEntity ivgEntity}) async {
    final response = await _iAddIvgDatasource.call(
        collectionPath: 'ivgs', map: IvgEntityMapper.toMap(ivgEntity));

    try {
      return Right(response);
    } catch (failure) {
      return Left(ErrorMessage(message: 'Add Ivg Repository Error'));
    }
  }
}
