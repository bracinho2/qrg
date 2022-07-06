import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qrg/app/modules/ivgs/external/firebase/firebase_service.dart';

class FirebaseServiceImpl implements IRemoteStorage {
  final FirebaseFirestore _firestore;

  FirebaseServiceImpl(this._firestore);
  @override
  Future<List<Map<String, dynamic>>> call(
      {required String collectionPath}) async {
    final response = await _firestore.collection(collectionPath).get();

    final lista = response.docs.map((doc) {
      final map = {
        'id': doc.reference.id,
        ...doc.data(),
      };

      return map;
    }).toList();

    return lista;
  }

  @override
  Future<bool> add(
      {required String collectionPath,
      required Map<String, dynamic> map}) async {
    await _firestore.collection(collectionPath).add(map);

    return true;
  }

  @override
  Future<bool> update({
    required String collectionPath,
    required Map<String, dynamic> map,
  }) async {
    final id = map['id'];
    map.remove('id');

    await _firestore.collection(collectionPath).doc(id).update(map);
    return true;
  }
}
