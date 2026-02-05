import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences sharedPreferences;
  const CacheHelper(this.sharedPreferences);

  // Generic save
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is String) return sharedPreferences.setString(key, value);
    if (value is bool) return sharedPreferences.setBool(key, value);
    if (value is int) return sharedPreferences.setInt(key, value);
    if (value is double) return sharedPreferences.setDouble(key, value);
    return false;
  }

  // Generic get
  dynamic getData({required String key}) => sharedPreferences.get(key);

  // Type-specific getters
  String? getString({required String key}) => sharedPreferences.getString(key);
  bool? getBool({required String key}) => sharedPreferences.getBool(key);
  int? getInt({required String key}) => sharedPreferences.getInt(key);
  double? getDouble({required String key}) => sharedPreferences.getDouble(key);

  // Remove
  Future<bool> removeData(String key) => sharedPreferences.remove(key);

  // Clear all
  Future<bool> clearData() => sharedPreferences.clear();
}
