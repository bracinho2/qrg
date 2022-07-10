abstract class IAddIvgDatasource {
  Future<bool> call(
      {required String collectionPath, required Map<String, dynamic> map});
}
