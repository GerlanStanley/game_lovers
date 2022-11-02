import 'package:shared_preferences/shared_preferences.dart';

import '../../../infra/data_sources/data_sources.dart';

class LocalIsDarkDataSourceImpl implements ILocalIsDarkDataSource {
  final SharedPreferences _sharedPreferences;
  final key = "is_dark_key";

  LocalIsDarkDataSourceImpl(this._sharedPreferences);

  @override
  bool get() {
    bool? isDark = _sharedPreferences.getBool(key);
    return isDark ?? false;
  }

  @override
  Future<bool> save({required bool value}) async {
    return await _sharedPreferences.setBool(key, value);
  }
}