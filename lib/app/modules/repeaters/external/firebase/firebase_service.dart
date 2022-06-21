abstract class IRemoteStorage {
  Future<List<Map<String, dynamic>>> getAll({required String collectionPath});
}
