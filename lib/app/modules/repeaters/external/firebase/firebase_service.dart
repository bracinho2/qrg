abstract class IRemoteStorage {
  Future<List<Map<String, dynamic>>> getAll({required String collectionPath});
  Future<bool> add(
      {required String collectionPath, required Map<String, dynamic> map});
  Future<bool> update(
      {required String collectionPath, required Map<String, dynamic> map});
}
