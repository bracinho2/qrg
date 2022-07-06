abstract class IRemoteStorage {
  Future<List<Map<String, dynamic>>> call({required String collectionPath});
  Future<bool> add(
      {required String collectionPath, required Map<String, dynamic> map});
  Future<bool> update(
      {required String collectionPath, required Map<String, dynamic> map});
}
