import 'package:qrg/app/core/services/firebase_firestore/firebase_service.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/add_ivg_datasource.dart';

class AddIvgDatasourceImpl implements IAddIvgDatasource {
  final IRemoteStorage _firebaseService;

  AddIvgDatasourceImpl(this._firebaseService);

  @override
  Future<bool> call(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    final response =
        await _firebaseService.add(collectionPath: collectionPath, map: map);

    return response;
  }
}
