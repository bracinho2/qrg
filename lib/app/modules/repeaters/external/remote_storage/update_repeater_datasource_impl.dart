import 'package:qrg/app/modules/repeaters/external/firebase/firebase_service.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/update_repeater_datasource.dart';

class UpdateRepeaterDatasourceImpl implements IUpdateRepeaterDatasource {
  final IRemoteStorage _firebaseService;

  UpdateRepeaterDatasourceImpl(this._firebaseService);

  @override
  Future<bool> call(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    final response =
        await _firebaseService.update(collectionPath: collectionPath, map: map);

    return response;
  }
}
