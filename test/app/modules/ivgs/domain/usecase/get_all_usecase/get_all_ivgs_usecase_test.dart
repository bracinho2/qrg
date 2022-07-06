import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/get_all_ivgs_repository.dart';
import 'package:qrg/app/modules/ivgs/domain/usecase/get_all_usecase/get_all_ivgs_usecase.dart';

class MockRepository implements IGetAllIvgsRepository {
  @override
  Future<Either<Failure, List<IvgEntity>>> call() async {
    final List<IvgEntity> result = [];

    try {
      return Left(ErrorMessage(message: 'teste'));
    } catch (failure) {
      return Left(
        ErrorMessage(message: 'Erro no Repositório dos IVG\'s'),
      );
    }
  }
}

void main() {
  test('get all ivgs usecase ...', () async {
    IGetAllIvgUsecase getAll = GetAllIvgUsecase(MockRepository());

    var result = await getAll.call();

    result.fold((error) => print(error.message), (r) => print(r));

    expect(actual, matcher)
  });
}
