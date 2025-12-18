import 'dart:convert';

import 'package:chat_app/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chat_app/core/error/exceptions.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheUser(UserModel userModel);

  Future<UserModel?> getCachedUser();

  Future<void> clearCache();

  Future<bool> hasCache();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferences _sharedPreferences;
  static const String _cachedUserKey = 'CACHED_USER';

  AuthLocalDatasourceImpl({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  @override
  Future<void> cacheUser(UserModel userModel) async {
    try {
      final jsonString = json.encode(userModel.toJson());
      await _sharedPreferences.setString(_cachedUserKey, jsonString);
    } catch (e) {
      throw CacheException('Failed to cache user: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await _sharedPreferences.remove(_cachedUserKey);
    } catch (e) {
      throw CacheException('Failed to clear cache: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final jsonString = _sharedPreferences.getString(_cachedUserKey);

      if (jsonString == null) return null;

      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return UserModel.fromJson(jsonMap);
    } catch (e) {
      throw CacheException('Failed to get cached user: ${e.toString()}');
    }
  }

  @override
  Future<bool> hasCache() async {
    return _sharedPreferences.containsKey(_cachedUserKey);
  }
}
