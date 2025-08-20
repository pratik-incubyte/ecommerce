import 'dart:convert';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import '../../../fixtures/fixture_reader.dart';

class ProfileTestHelper {
  /// Returns a test UserModel with complete data
  static UserModel get tUserModel =>
      UserModel.fromJson(json.decode(fixture('user.json')));

  /// Returns a test UserModel with null fields
  static UserModel get tUserModelWithNulls =>
      UserModel.fromJson(json.decode(fixture('user_with_nulls.json')));

  /// Returns a test UserModel with updated data
  static UserModel get tUpdatedUserModel =>
      UserModel.fromJson(json.decode(fixture('updated_user.json')));

  /// Returns a test UserEntity with complete data
  static UserEntity get tUserEntity => tUserModel.toDomain();

  /// Returns a test UserEntity with null fields
  static UserEntity get tUserEntityWithNulls => tUserModelWithNulls.toDomain();

  /// Returns a test UserEntity with updated data
  static UserEntity get tUpdatedUserEntity => tUpdatedUserModel.toDomain();

  /// Returns JSON string for user fixture
  static String get userJsonString => fixture('user.json');

  /// Returns JSON string for user with nulls fixture
  static String get userWithNullsJsonString => fixture('user_with_nulls.json');

  /// Returns JSON string for updated user fixture
  static String get updatedUserJsonString => fixture('updated_user.json');

  /// Returns JSON Map for user fixture
  static Map<String, dynamic> get userJsonMap => json.decode(userJsonString);

  /// Returns JSON Map for user with nulls fixture
  static Map<String, dynamic> get userWithNullsJsonMap =>
      json.decode(userWithNullsJsonString);

  /// Returns JSON Map for updated user fixture
  static Map<String, dynamic> get updatedUserJsonMap =>
      json.decode(updatedUserJsonString);

  /// Creates a custom UserModel with provided parameters
  static UserModel createUserModel({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? profilePicture,
    String? address,
    String? city,
    String? country,
    String? postalCode,
    bool? isVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? 'test_id',
      email: email ?? 'test@example.com',
      firstName: firstName ?? 'Test',
      lastName: lastName ?? 'User',
      phone: phone,
      profilePicture: profilePicture,
      address: address,
      city: city,
      country: country,
      postalCode: postalCode,
      isVerified: isVerified ?? true,
      isActive: isActive ?? true,
      createdAt: createdAt ?? DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: updatedAt ?? DateTime.parse('2024-01-01T00:00:00.000Z'),
    );
  }

  /// Creates a custom UserEntity with provided parameters
  static UserEntity createUserEntity({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? profilePicture,
    String? address,
    String? city,
    String? country,
    String? postalCode,
    bool? isVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? 'test_id',
      email: email ?? 'test@example.com',
      firstName: firstName ?? 'Test',
      lastName: lastName ?? 'User',
      phone: phone,
      profilePicture: profilePicture,
      address: address,
      city: city,
      country: country,
      postalCode: postalCode,
      isVerified: isVerified ?? true,
      isActive: isActive ?? true,
      createdAt: createdAt ?? DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: updatedAt ?? DateTime.parse('2024-01-01T00:00:00.000Z'),
    );
  }

  /// Common test image paths
  static const String testImagePath = '/test/path/to/image.jpg';
  static const String testImageUrl = 'https://example.com/test_image.jpg';
  static const String newTestImageUrl =
      'https://example.com/new_test_image.jpg';

  /// Common test passwords
  static const String testCurrentPassword = 'currentPassword123';
  static const String testNewPassword = 'newPassword456';
  static const String testWeakPassword = '123';

  /// Common test error messages
  static const String testServerErrorMessage = 'Server error occurred';
  static const String testNetworkErrorMessage = 'No internet connection';
  static const String testCacheErrorMessage = 'Cache error occurred';
  static const String testAuthErrorMessage = 'User not authenticated';
  static const String testValidationErrorMessage = 'Validation failed';

  /// Test Firebase UID
  static const String testFirebaseUid = 'firebase_test_uid_123';

  /// Test display name
  static const String testDisplayName = 'John Doe';
}
