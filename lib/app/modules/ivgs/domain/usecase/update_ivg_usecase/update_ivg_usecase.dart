import 'package:dartz/dartz.dart';
import 'package:qrg/app/core/validators/validators.dart';
import 'package:qrg/app/modules/ivgs/domain/entity/entity.dart';
import 'package:qrg/app/modules/ivgs/domain/errors/errors.dart';
import 'package:qrg/app/modules/ivgs/domain/repository/update_ivg_repository.dart';

abstract class IUpdateIvgUsecase {
  Future<Either<Failure, bool>> call({required IvgEntity ivgEntity});
}

class UpdateIvgUsecase implements IUpdateIvgUsecase {
  final IUpdateIvgRepository _iUpdateIvgRepository;

  UpdateIvgUsecase(this._iUpdateIvgRepository);
  @override
  Future<Either<Failure, bool>> call({required IvgEntity ivgEntity}) async {
    if (ivgEntity.callSign.length < 5) {
      return Left(ErrorMessage(message: 'Digite um indicativo válido!'));
    }

    if (!validateFrequency(value: ivgEntity.qrg)) {
      return Left(ErrorMessage(message: 'Formato: 146.710 ou 27.450'));
    }

    if (ivgEntity.protocol.isEmpty) {
      return Left(ErrorMessage(message: 'Informe o Modo!'));
    }
    if (ivgEntity.tone.isEmpty && ivgEntity.protocol == 'FM') {
      return Left(ErrorMessage(message: 'Informe o Subtom!'));
    }
    if (ivgEntity.city.isEmpty) {
      return Left(ErrorMessage(message: 'Informe a cidade!'));
    }
    if (ivgEntity.state.isEmpty) {
      return Left(ErrorMessage(message: 'Informe o Estado!'));
    }
    if (ivgEntity.country.isEmpty) {
      return Left(ErrorMessage(message: 'Informe o País!'));
    }
    if (ivgEntity.informedBy.isEmpty) {
      return Left(
          ErrorMessage(message: 'Informe seu indicativo. Exemplo: PY5TH!'));
    }

    // if (ivgEntity.active != true) {
    //   return Left(ErrorMessage(message: 'O IVG não está instalado?'));
    // }

    // if (ivgEntity.operation != true) {
    //   return Left(ErrorMessage(message: 'O IVG está em operação?'));
    // }
    return await _iUpdateIvgRepository.call(ivgEntity: ivgEntity);
  }
}
