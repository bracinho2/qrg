import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';

abstract class IGetAllIvgUsecase {
  Future<Either<Failure, List<IvgEntity>>> call();
}

class GetAllIvgUsecase implements IGetAllIvgUsecase {
  final IGetAllIvgsRepository _iGetIvgRepository;

  GetAllIvgUsecase(this._iGetIvgRepository);
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    return await _iGetIvgRepository();
  }
}
