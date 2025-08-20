import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_local_data_source.dart';

import 'profile_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late ProfileLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;
  late UserModel tUserModel;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProfileLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
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
  });

  group('ProfileLocalDataSource', () {
    group('getCachedProfile', () {
      test('should return UserModel from SharedPreferences when there is one in the cache', () async {
        // arrange
        final expectedJsonString = json.encode(tUserModel.toJson());
        when(mockSharedPreferences.getString(any))
            .thenReturn(expectedJsonString);

        // act
        final result = await dataSource.getCachedProfile();

        // assert
        verify(mockSharedPreferences.getString(ProfileLocalDataSourceImpl.cachedProfileKey));
        expect(result?.id, equals(tUserModel.id));
        expect(result?.email, equals(tUserModel.email));
        expect(result?.firstName, equals(tUserModel.firstName));
        expect(result?.lastName, equals(tUserModel.lastName));
      });

      test('should return null when there is no cached profile', () async {
        // arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);

        // act
        final result = await dataSource.getCachedProfile();

        // assert
        verify(mockSharedPreferences.getString(ProfileLocalDataSourceImpl.cachedProfileKey));
        expect(result, null);
      });

      test('should throw CacheException when getting cached profile fails', () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenThrow(Exception('SharedPreferences error'));

        // act
        final call = dataSource.getCachedProfile;

        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      });

      test('should throw CacheException when JSON parsing fails', () async {
        // arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn('invalid json');

        // act
        final call = dataSource.getCachedProfile;

        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      });
    });

    group('cacheProfile', () {
      test('should call SharedPreferences to cache the profile', () async {
        // arrange
        final expectedJsonString = json.encode(tUserModel.toJson());
        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);

        // act
        await dataSource.cacheProfile(tUserModel);

        // assert
        verify(mockSharedPreferences.setString(
          ProfileLocalDataSourceImpl.cachedProfileKey,
          expectedJsonString,
        ));
      });

      test('should throw CacheException when caching fails', () async {
        // arrange
        when(mockSharedPreferences.setString(any, any))
            .thenThrow(Exception('SharedPreferences error'));

        // act
        final call = dataSource.cacheProfile;

        // assert
        expect(() => call(tUserModel), throwsA(isA<CacheException>()));
      });
    });

    group('clearCachedProfile', () {
      test('should call SharedPreferences to clear the cached profile', () async {
        // arrange
        when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);

        // act
        await dataSource.clearCachedProfile();

        // assert
        verify(mockSharedPreferences.remove(ProfileLocalDataSourceImpl.cachedProfileKey));
      });

      test('should throw CacheException when clearing cache fails', () async {
        // arrange
        when(mockSharedPreferences.remove(any))
            .thenThrow(Exception('SharedPreferences error'));

        // act
        final call = dataSource.clearCachedProfile;

        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      });
    });

    group('cache key consistency', () {
      test('should use the same key for all operations', () async {
        // arrange
        const expectedKey = 'CACHED_PROFILE';
        final jsonString = json.encode(tUserModel.toJson());
        
        when(mockSharedPreferences.getString(expectedKey)).thenReturn(jsonString);
        when(mockSharedPreferences.setString(expectedKey, any)).thenAnswer((_) async => true);
        when(mockSharedPreferences.remove(expectedKey)).thenAnswer((_) async => true);

        // act & assert
        await dataSource.getCachedProfile();
        verify(mockSharedPreferences.getString(expectedKey));

        await dataSource.cacheProfile(tUserModel);
        verify(mockSharedPreferences.setString(expectedKey, any));

        await dataSource.clearCachedProfile();
        verify(mockSharedPreferences.remove(expectedKey));
      });
    });
  });
}
