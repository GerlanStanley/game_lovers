abstract class ILocalIsDarkDataSource {
  bool get();

  Future<bool> save({required bool value});
}
