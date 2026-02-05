import 'dart:convert';

import 'package:clean_architecture/core/cache/cache_helper.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final String key = "cachedUser";
  final CacheHelper cache;

  UserLocalDataSource({required this.cache});

  Future<void> cacheUser(UserModel? userModel) async {
    if (userModel != null) {
      await cache.saveData(key: key, value: json.encode(userModel.toJson()));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection');
    }
  }

  Future<UserModel> getCachedUser() async {
    final jsonString = cache.getString(key: key);
    if (jsonString != null) {
      return UserModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException(errorMessage: 'No Internet Connection');
    }
  }
}
