import 'package:qrg/app/modules/repeaters/external/firebase/firebase_service.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/get_all_repeaters_datasource.dart';

class GetAllRepeatersDataSourceImpl implements IGetAllRepeatersDataSource {
  final IRemoteStorage _firebaseService;

  GetAllRepeatersDataSourceImpl(this._firebaseService);
  @override
  Future<List<Map<String, dynamic>>> call() async {
    final response = await _firebaseService.getAll(collectionPath: 'repeaters');

    return response;
  }
}
