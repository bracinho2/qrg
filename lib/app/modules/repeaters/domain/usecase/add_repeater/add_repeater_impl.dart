import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/repeaters/domain/entity/repeater_entity.dart';
import 'package:qrg/app/modules/repeaters/domain/errors/failure.dart';
import 'package:qrg/app/modules/repeaters/domain/repositories/add_repeater_repository.dart';
import 'package:qrg/app/modules/repeaters/domain/usecase/add_repeater/add_repeater.dart';
import 'package:qrg/app/modules/repeaters/domain/validators/validators.dart';

class AddRepeaterUsecaseImpl implements IAddRepeaterUsecase {
  final IAddRepeaterRepository _iAddRepeaterRepository;

  AddRepeaterUsecaseImpl(this._iAddRepeaterRepository);
  @override
  Future<Either<Failure, bool>> add(
      {required RepeaterEntity repeaterEntity}) async {
    if (repeaterEntity.callSign.length < 5) {
      return Left(UsecaseError(message: 'Digite um indicativo válido!'));
    }

    if (!validateFrequency(value: repeaterEntity.tx)) {
      return Left(UsecaseError(message: 'TX: Formato: 146.710'));
    }
    if (!validateFrequency(value: repeaterEntity.rx)) {
      return Left(UsecaseError(message: 'RX: Formato: 146.110'));
    }
    if (repeaterEntity.protocol.isEmpty) {
      return Left(UsecaseError(message: 'Informe o Modo!'));
    }
    if (repeaterEntity.tone.isEmpty && repeaterEntity.protocol == 'FM') {
      return Left(UsecaseError(message: 'Informe o Subtom!'));
    }
    if (repeaterEntity.city.isEmpty) {
      return Left(UsecaseError(message: 'Informe a cidade!'));
    }
    if (repeaterEntity.state.isEmpty) {
      return Left(UsecaseError(message: 'Informe o Estado!'));
    }
    if (repeaterEntity.country.isEmpty) {
      return Left(UsecaseError(message: 'Informe o País!'));
    }
    if (repeaterEntity.informedBy.isEmpty) {
      return Left(
          UsecaseError(message: 'Informe seu indicativo. Exemplo: PY5TH!'));
    }

    if (repeaterEntity.active != true) {
      return Left(UsecaseError(message: 'A repetidora não está instalada?'));
    }

    if (repeaterEntity.operation != true) {
      return Left(UsecaseError(message: 'A repetidora está em operação?'));
    }

    return _iAddRepeaterRepository.add(repeater: repeaterEntity);
  }
}


 

//       tx: tx,
//       rx: rx,
//       tone: tone,
//       coverage: coverage,
//       protocol: protocol,
//       informedBy: informedBy,
//       active: active,
//       operation: operation,