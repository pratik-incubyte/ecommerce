import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';

void main() {
  late UserModel tUserModel;
  late UserEntity tUserEntity;

  setUp(() {
    tUserModel = UserModel(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phone: '+1234567890',
      profilePicture: 'https://example.com/profile.jpg',
      address: '123 Main St',
      city: 'New York',
      country: 'USA',
      postalCode: '10001',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
    );

    tUserEntity = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      phone: '+1234567890',
      profilePicture: 'https://example.com/profile.jpg',
      address: '123 Main St',
      city: 'New York',
      country: 'USA',
      postalCode: '10001',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
    );
  });

  group('UserModel', () {
    test('should convert to and from JSON correctly', () {
      // arrange
      const jsonString = '''
      {
        "id": "1",
        "email": "test@example.com",
        "first_name": "John",
        "last_name": "Doe",
        "phone": "+1234567890",
        "profile_picture": "https://example.com/profile.jpg",
        "address": "123 Main St",
        "city": "New York",
        "country": "USA",
        "postal_code": "10001",
        "is_verified": true,
        "is_active": true,
        "created_at": "2024-01-01T00:00:00.000Z",
        "updated_at": "2024-01-01T00:00:00.000Z"
      }
      ''';
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // act - from JSON
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result.id, tUserModel.id);
      expect(result.email, tUserModel.email);
      expect(result.firstName, tUserModel.firstName);
      expect(result.lastName, tUserModel.lastName);
      expect(result.phone, tUserModel.phone);
      expect(result.profilePicture, tUserModel.profilePicture);
      expect(result.address, tUserModel.address);
      expect(result.city, tUserModel.city);
      expect(result.country, tUserModel.country);
      expect(result.postalCode, tUserModel.postalCode);
      expect(result.isVerified, tUserModel.isVerified);
      expect(result.isActive, tUserModel.isActive);
      expect(result.createdAt, tUserModel.createdAt);
      expect(result.updatedAt, tUserModel.updatedAt);

      // act - to JSON
      final resultJson = result.toJson();

      // assert
      expect(resultJson['id'], tUserModel.id);
      expect(resultJson['email'], tUserModel.email);
      expect(resultJson['first_name'], tUserModel.firstName);
      expect(resultJson['last_name'], tUserModel.lastName);
      expect(resultJson['phone'], tUserModel.phone);
      expect(resultJson['profile_picture'], tUserModel.profilePicture);
      expect(resultJson['address'], tUserModel.address);
      expect(resultJson['city'], tUserModel.city);
      expect(resultJson['country'], tUserModel.country);
      expect(resultJson['postal_code'], tUserModel.postalCode);
      expect(resultJson['is_verified'], tUserModel.isVerified);
      expect(resultJson['is_active'], tUserModel.isActive);
      expect(resultJson['created_at'], tUserModel.createdAt.toIso8601String());
      expect(resultJson['updated_at'], tUserModel.updatedAt.toIso8601String());
    });

    test('should convert from domain entity correctly', () {
      // act
      final result = UserModel.fromDomain(tUserEntity);

      // assert
      expect(result.id, tUserEntity.id);
      expect(result.email, tUserEntity.email);
      expect(result.firstName, tUserEntity.firstName);
      expect(result.lastName, tUserEntity.lastName);
      expect(result.phone, tUserEntity.phone);
      expect(result.profilePicture, tUserEntity.profilePicture);
      expect(result.address, tUserEntity.address);
      expect(result.city, tUserEntity.city);
      expect(result.country, tUserEntity.country);
      expect(result.postalCode, tUserEntity.postalCode);
      expect(result.isVerified, tUserEntity.isVerified);
      expect(result.isActive, tUserEntity.isActive);
      expect(result.createdAt, tUserEntity.createdAt);
      expect(result.updatedAt, tUserEntity.updatedAt);
    });

    test('should convert to domain entity correctly', () {
      // act
      final result = tUserModel.toDomain();

      // assert
      expect(result.id, tUserModel.id);
      expect(result.email, tUserModel.email);
      expect(result.firstName, tUserModel.firstName);
      expect(result.lastName, tUserModel.lastName);
      expect(result.phone, tUserModel.phone);
      expect(result.profilePicture, tUserModel.profilePicture);
      expect(result.address, tUserModel.address);
      expect(result.city, tUserModel.city);
      expect(result.country, tUserModel.country);
      expect(result.postalCode, tUserModel.postalCode);
      expect(result.isVerified, tUserModel.isVerified);
      expect(result.isActive, tUserModel.isActive);
      expect(result.createdAt, tUserModel.createdAt);
      expect(result.updatedAt, tUserModel.updatedAt);
    });

    test('should create copy with updated values', () {
      // act
      final result = tUserModel.copyWith(
        firstName: 'Jane',
        lastName: 'Smith',
        isVerified: false,
      );

      // assert
      expect(result.id, tUserModel.id);
      expect(result.email, tUserModel.email);
      expect(result.firstName, 'Jane');
      expect(result.lastName, 'Smith');
      expect(result.phone, tUserModel.phone);
      expect(result.profilePicture, tUserModel.profilePicture);
      expect(result.address, tUserModel.address);
      expect(result.city, tUserModel.city);
      expect(result.country, tUserModel.country);
      expect(result.postalCode, tUserModel.postalCode);
      expect(result.isVerified, false);
      expect(result.isActive, tUserModel.isActive);
      expect(result.createdAt, tUserModel.createdAt);
      expect(result.updatedAt, tUserModel.updatedAt);
    });

    test('should handle null values in JSON', () {
      // arrange
      const jsonString = '''
      {
        "id": "1",
        "email": "test@example.com",
        "first_name": "John",
        "last_name": "Doe",
        "phone": null,
        "profile_picture": null,
        "address": null,
        "city": null,
        "country": null,
        "postal_code": null,
        "is_verified": false,
        "is_active": true,
        "created_at": "2024-01-01T00:00:00.000Z",
        "updated_at": "2024-01-01T00:00:00.000Z"
      }
      ''';
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // act
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result.id, '1');
      expect(result.email, 'test@example.com');
      expect(result.firstName, 'John');
      expect(result.lastName, 'Doe');
      expect(result.phone, null);
      expect(result.profilePicture, null);
      expect(result.address, null);
      expect(result.city, null);
      expect(result.country, null);
      expect(result.postalCode, null);
      expect(result.isVerified, false);
      expect(result.isActive, true);
    });
  });
}
