abstract class IAddAllRepeatersDataSource {
  Future<bool> call(
      {required String collectionPath, required Map<String, dynamic> map});
}
