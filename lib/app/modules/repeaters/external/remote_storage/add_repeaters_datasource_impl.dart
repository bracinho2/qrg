import 'package:qrg/app/modules/repeaters/external/firebase/firebase_service.dart';
import 'package:qrg/app/modules/repeaters/infra/datasources/add_repeaters_datasource.dart';

class AddRepeaterDataSourceImpl implements IAddAllRepeatersDataSource {
  final IRemoteStorage _firebaseService;

  AddRepeaterDataSourceImpl(this._firebaseService);

  @override
  Future<bool> call(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    final response =
        await _firebaseService.add(collectionPath: collectionPath, map: map);

    return response;
  }
}
