import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';
import 'package:drift/drift.dart' as drift;

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getCachedUser();
  Future<void> clearCachedUser();
  Future<void> cacheAuthToken(String token);
  Future<String?> getCachedAuthToken();
  Future<void> clearAuthToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String _userKey = 'CACHED_USER';
  static const String _tokenKey = 'AUTH_TOKEN';

  final SharedPreferences _sharedPreferences;
  final AppDatabase _database;

  AuthLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
    required AppDatabase database,
  })  : _sharedPreferences = sharedPreferences,
        _database = database;

  @override
  Future<void> cacheUser(UserModel user) async {
    try {
      final jsonString = json.encode(user.toJson());
      await _sharedPreferences.setString(_userKey, jsonString);
      
      await _database.userDao.insertUser(
        UsersCompanion(
          uid: drift.Value(user.uid),
          email: drift.Value(user.email),
          name: drift.Value(user.displayName ?? ''),
          phoneNumber: drift.Value(user.phoneNumber),
          photoUrl: drift.Value(user.photoUrl),
        ),
      );
    } catch (e) {
      throw CacheException(message: 'Failed to cache user');
    }
  }

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final jsonString = _sharedPreferences.getString(_userKey);
      if (jsonString != null) {
        final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
        return UserModel.fromJson(jsonMap);
      }
      return null;
    } catch (e) {
      throw CacheException(message: 'Failed to get cached user');
    }
  }

  @override
  Future<void> clearCachedUser() async {
    try {
      await _sharedPreferences.remove(_userKey);
      final cachedUser = await getCachedUser();
      if (cachedUser != null) {
        await _database.userDao.deleteUser(cachedUser.uid);
      }
    } catch (e) {
      throw CacheException(message: 'Failed to clear cached user');
    }
  }

  @override
  Future<void> cacheAuthToken(String token) async {
    try {
      await _sharedPreferences.setString(_tokenKey, token);
    } catch (e) {
      throw CacheException(message: 'Failed to cache auth token');
    }
  }

  @override
  Future<String?> getCachedAuthToken() async {
    try {
      return _sharedPreferences.getString(_tokenKey);
    } catch (e) {
      throw CacheException(message: 'Failed to get cached auth token');
    }
  }

  @override
  Future<void> clearAuthToken() async {
    try {
      await _sharedPreferences.remove(_tokenKey);
    } catch (e) {
      throw CacheException(message: 'Failed to clear auth token');
    }
  }
}