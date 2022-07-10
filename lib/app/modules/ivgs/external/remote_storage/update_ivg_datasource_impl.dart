import 'package:qrg/app/core/services/firebase_firestore/firebase_service.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/update_ivg_datasource.dart';

class UpdateIvgDatasourceImpl implements IUpdateIvgDatasource {
  final IRemoteStorage _firebaseService;

  UpdateIvgDatasourceImpl(this._firebaseService);

  @override
  Future<bool> call(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    final response =
        await _firebaseService.update(collectionPath: collectionPath, map: map);

    return response;
  }
}
