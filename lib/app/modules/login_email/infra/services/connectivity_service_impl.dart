import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';
import 'package:qrg/app/modules/login_email/domain/services/connectivity_service_interface.dart';
import 'package:qrg/app/modules/login_email/infra/drivers/connectivity_driver_interface.dart';

class ConnectivityServiceImpl implements IConnectivityService {
  final IConnectivityDriver _iConennectivityDriver;

  ConnectivityServiceImpl(this._iConennectivityDriver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await _iConennectivityDriver.isOnline;
      if (check) {
        return const Right(unit);
      }
      throw ConnectionError(message: 'Você está offline');
      // ignore: unused_catch_clause
    } on Failure catch (error) {
      return left(
          ConnectionError(message: 'Conecte-se à Internet para entrar.'));
    }
  }
}
