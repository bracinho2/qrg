import 'package:dartz/dartz.dart';
import 'package:dartz_test/dartz_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';

class MockRepository implements IGetAllIvgsRepository {
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    final List<IvgEntity> result = [
      IvgEntity(
        id: 'id',
        callSign: 'callSign',
        city: 'city',
        state: 'state',
        country: 'country',
        grid: 'grid',
        qrg: 'qrg',
        tone: 'tone',
        coverage: 'coverage',
        protocol: 'protocol',
        informedBy: 'informedBy',
        active: false,
        operation: false,
      ),
    ];

    try {
      return Right(result);
    } catch (failure) {
      return Left(
        ErrorMessage(message: 'Erro no Repositório dos IVG\'s'),
      );
    }
  }
}

void main() {
  test('Should be an Right Return', () async {
    IGetAllIvgUsecase getAll = GetAllIvgUsecase(MockRepository());

    var result = await getAll.call();

    expect(result, isRight);
  });

  test('Should be an Filled List', () async {
    IGetAllIvgUsecase getAll = GetAllIvgUsecase(MockRepository());

    var result = await getAll.call();

    result.fold((error) => expect(error, isNotNull),
        (sucess) => expect(sucess, isNotEmpty));
  });
}
