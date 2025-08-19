import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';

abstract class ProfileLocalDataSource {
  /// Get cached user profile
  Future<UserModel?> getCachedProfile();
  
  /// Cache user profile
  Future<void> cacheProfile(UserModel user);
  
  /// Clear cached profile
  Future<void> clearCachedProfile();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedProfileKey = 'CACHED_PROFILE';

  ProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel?> getCachedProfile() async {
    try {
      final profileJson = sharedPreferences.getString(cachedProfileKey);
      if (profileJson != null) {
        return UserModel.fromJson(json.decode(profileJson));
      }
      return null;
    } catch (e) {
      throw CacheException('Failed to get cached profile: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheProfile(UserModel user) async {
    try {
      final profileJson = json.encode(user.toJson());
      await sharedPreferences.setString(cachedProfileKey, profileJson);
    } catch (e) {
      throw CacheException('Failed to cache profile: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCachedProfile() async {
    try {
      await sharedPreferences.remove(cachedProfileKey);
    } catch (e) {
      throw CacheException('Failed to clear cached profile: ${e.toString()}');
    }
  }
}
