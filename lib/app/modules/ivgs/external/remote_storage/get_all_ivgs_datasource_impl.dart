import 'package:qrg/app/core/services/firebase_firestore/firebase_service.dart';
import 'package:qrg/app/modules/ivgs/infra/datasources/get_all_ivgs_datasource.dart';

class GetAllIvgsDataSourceImpl implements IGetAllIvgsDatasource {
  final IRemoteStorage _firebaseService;

  GetAllIvgsDataSourceImpl(this._firebaseService);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final response = await _firebaseService.call(collectionPath: 'ivgs');

    return response;
  }
}
