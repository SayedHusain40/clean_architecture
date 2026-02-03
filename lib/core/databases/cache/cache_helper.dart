import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  // Initialize the SharedPreferences instance.
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // Specific method to get a String
   String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  // Generic method to save any supported data type (bool, String, int, double)
   Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);

    return false;
  }

  // Get data of any type
   dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // Remove data for a specific key
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  // Check if a key exists in the local storage
  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  // Clear all data from local storage
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // This method puts data in local database using a key.
  // It automatically detects the type and uses the correct setter.
  static Future<bool> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      // Return false if the type is not supported (like a Map or custom Object)
      return false;
    }
  }
}
