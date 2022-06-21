import 'package:dartz/dartz.dart';
import 'package:qrg/app/modules/login_email/domain/errors/errors.dart';

abstract class IConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
