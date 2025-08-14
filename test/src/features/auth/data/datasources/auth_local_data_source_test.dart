import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';

void main() {
  late AppDatabase database;
  late AuthLocalDataSource dataSource;
  late UserModel tUserModel;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = AuthLocalDataSourceImpl(database: database);

    tUserModel = UserModel(
      id: 'user123',
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
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('AuthLocalDataSource', () {
    group('cacheUser', () {
      test('should cache user data successfully', () async {
        // act
        await dataSource.cacheUser(tUserModel);

        // assert
        final users = await database.select(database.userTable).get();
        expect(users, hasLength(1));
        expect(users.first.id, tUserModel.id);
        expect(users.first.email, tUserModel.email);
        expect(users.first.firstName, tUserModel.firstName);
        expect(users.first.lastName, tUserModel.lastName);
      });

      test('should update existing user when caching with same id', () async {
        // arrange
        await dataSource.cacheUser(tUserModel);
        final updatedUser = tUserModel.copyWith(firstName: 'Jane');

        // act
        await dataSource.cacheUser(updatedUser);

        // assert
        final users = await database.select(database.userTable).get();
        expect(users, hasLength(1));
        expect(users.first.firstName, 'Jane');
      });

      test('should throw CacheException when caching fails', () async {
        // arrange
        await database.close(); // Close database to simulate failure

        // act & assert
        expect(
          () => dataSource.cacheUser(tUserModel),
          throwsA(isA<CacheException>()),
        );
      });
    });

    group('getCachedUser', () {
      test('should return cached user when user exists', () async {
        // arrange
        await dataSource.cacheUser(tUserModel);

        // act
        final result = await dataSource.getCachedUser();

        // assert
        expect(result, isA<UserModel>());
        expect(result!.id, tUserModel.id);
        expect(result.email, tUserModel.email);
        expect(result.firstName, tUserModel.firstName);
        expect(result.lastName, tUserModel.lastName);
      });

      test('should return null when no user is cached', () async {
        // act
        final result = await dataSource.getCachedUser();

        // assert
        expect(result, null);
      });

      test(
        'should return most recently cached user when multiple users exist',
        () async {
          // arrange
          final user1 = tUserModel;
          final user2 = tUserModel.copyWith(
            id: 'user456',
            email: 'test2@example.com',
            updatedAt: DateTime.parse('2024-01-02'),
          );

          await dataSource.cacheUser(user1);
          await dataSource.cacheUser(user2);

          // act
          final result = await dataSource.getCachedUser();

          // assert
          expect(result!.id, user2.id);
          expect(result.email, user2.email);
        },
      );

      test('should throw CacheException when retrieval fails', () async {
        // arrange
        await database.close(); // Close database to simulate failure

        // act & assert
        expect(
          () => dataSource.getCachedUser(),
          throwsA(isA<CacheException>()),
        );
      });
    });

    group('clearCachedUser', () {
      test('should clear all cached users successfully', () async {
        // arrange
        await dataSource.cacheUser(tUserModel);

        // Verify user is cached first
        final usersBefore = await database.select(database.userTable).get();
        expect(usersBefore, hasLength(1));

        // act
        await dataSource.clearCachedUser();

        // assert
        final usersAfter = await database.select(database.userTable).get();
        expect(usersAfter, isEmpty);
      });

      test('should complete successfully when no users are cached', () async {
        // act & assert - should not throw
        await dataSource.clearCachedUser();

        final users = await database.select(database.userTable).get();
        expect(users, isEmpty);
      });

      test('should throw CacheException when clearing fails', () async {
        // arrange
        await database.close(); // Close database to simulate failure

        // act & assert
        expect(
          () => dataSource.clearCachedUser(),
          throwsA(isA<CacheException>()),
        );
      });
    });

    group('isUserCached', () {
      test('should return true when user is cached', () async {
        // arrange
        await dataSource.cacheUser(tUserModel);

        // act
        final result = await dataSource.isUserCached();

        // assert
        expect(result, true);
      });

      test('should return false when no user is cached', () async {
        // act
        final result = await dataSource.isUserCached();

        // assert
        expect(result, false);
      });

      test('should throw CacheException when check fails', () async {
        // arrange
        await database.close(); // Close database to simulate failure

        // act & assert
        expect(() => dataSource.isUserCached(), throwsA(isA<CacheException>()));
      });
    });
  });
}
