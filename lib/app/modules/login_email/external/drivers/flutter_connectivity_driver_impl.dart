import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:qrg/app/modules/login_email/infra/drivers/connectivity_driver_interface.dart';

class FlutterConnectivyDriver implements IConnectivityDriver {
  final Connectivity _connectivity;

  FlutterConnectivyDriver(this._connectivity);

  @override
  Future<bool> get isOnline async {
    var result = await _connectivity.checkConnectivity();
    return result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile;
  }
}
