import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource, NetworkInfo])
void main() {
  late AuthRepositoryImpl repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late UserModel tUserModel;
  late UserEntity tUserEntity;
  late LoginParams tLoginParams;
  late RegisterParams tRegisterParams;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    tUserModel = UserModel(
      id: 'user123',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );

    tUserEntity = tUserModel.toDomain();

    tLoginParams = const LoginParams(
      email: 'test@example.com',
      password: 'password123',
    );

    tRegisterParams = const RegisterParams(
      email: 'test@example.com',
      password: 'password123',
      firstName: 'John',
      lastName: 'Doe',
    );
  });

  group('AuthRepositoryImpl', () {
    group('login', () {
      test(
        'should return UserEntity when login is successful and device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.login(any),
          ).thenAnswer((_) async => tUserModel);
          when(mockLocalDataSource.cacheUser(any)).thenAnswer((_) async {});

          // act
          final result = await repository.login(tLoginParams);

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.login(tLoginParams));
          verify(mockLocalDataSource.cacheUser(tUserModel));
          expect(result, Right(tUserEntity));
        },
      );

      test(
        'should return AuthFailure when login fails with invalid credentials',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.login(any)).thenThrow(
            const ServerException(
              'Invalid credentials',
              code: 'invalid-credential',
            ),
          );

          // act
          final result = await repository.login(tLoginParams);

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.login(tLoginParams));
          expect(result, const Left(AuthFailure('Invalid credentials')));
        },
      );

      test('should return NetworkFailure when device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.login(tLoginParams);

        // assert
        verify(mockNetworkInfo.isConnected);
        verifyNever(mockRemoteDataSource.login(any));
        expect(result, const Left(NetworkFailure('No internet connection')));
      });

      test(
        'should return ServerFailure when remote data source throws ServerException',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.login(any),
          ).thenThrow(const ServerException('Server error'));

          // act
          final result = await repository.login(tLoginParams);

          // assert
          expect(result, const Left(ServerFailure('Server error')));
        },
      );
    });

    group('register', () {
      test(
        'should return UserEntity when registration is successful and device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.register(any),
          ).thenAnswer((_) async => tUserModel);
          when(mockLocalDataSource.cacheUser(any)).thenAnswer((_) async {});

          // act
          final result = await repository.register(tRegisterParams);

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.register(tRegisterParams));
          verify(mockLocalDataSource.cacheUser(tUserModel));
          expect(result, Right(tUserEntity));
        },
      );

      test(
        'should return AuthFailure when registration fails with email already in use',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.register(any)).thenThrow(
            const ServerException(
              'Email already in use',
              code: 'email-already-in-use',
            ),
          );

          // act
          final result = await repository.register(tRegisterParams);

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.register(tRegisterParams));
          expect(result, const Left(AuthFailure('Email already in use')));
        },
      );

      test('should return NetworkFailure when device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.register(tRegisterParams);

        // assert
        verify(mockNetworkInfo.isConnected);
        verifyNever(mockRemoteDataSource.register(any));
        expect(result, const Left(NetworkFailure('No internet connection')));
      });
    });

    group('logout', () {
      test(
        'should return Unit when logout is successful and device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(mockRemoteDataSource.logout()).thenAnswer((_) async {});
          when(mockLocalDataSource.clearCachedUser()).thenAnswer((_) async {});

          // act
          final result = await repository.logout();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.logout());
          verify(mockLocalDataSource.clearCachedUser());
          expect(result, const Right(unit));
        },
      );

      test('should return AuthFailure when logout fails', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.logout(),
        ).thenThrow(const ServerException('Logout failed'));

        // act
        final result = await repository.logout();

        // assert
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteDataSource.logout());
        expect(result, const Left(AuthFailure('Logout failed')));
      });

      test('should clear local cache even when offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockLocalDataSource.clearCachedUser()).thenAnswer((_) async {});

        // act
        final result = await repository.logout();

        // assert
        verify(mockNetworkInfo.isConnected);
        verifyNever(mockRemoteDataSource.logout());
        verify(mockLocalDataSource.clearCachedUser());
        expect(result, const Right(unit));
      });
    });

    group('getCurrentUser', () {
      test(
        'should return cached user when device is offline and user is cached',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
          when(
            mockLocalDataSource.getCachedUser(),
          ).thenAnswer((_) async => tUserModel);

          // act
          final result = await repository.getCurrentUser();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockLocalDataSource.getCachedUser());
          verifyNever(mockRemoteDataSource.getCurrentUser());
          expect(result, Right(tUserEntity));
        },
      );

      test(
        'should return null when device is offline and no user is cached',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
          when(
            mockLocalDataSource.getCachedUser(),
          ).thenAnswer((_) async => null);

          // act
          final result = await repository.getCurrentUser();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockLocalDataSource.getCachedUser());
          expect(result, const Right(null));
        },
      );

      test(
        'should return remote user and cache it when device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.getCurrentUser(),
          ).thenAnswer((_) async => tUserModel);
          when(mockLocalDataSource.cacheUser(any)).thenAnswer((_) async {});

          // act
          final result = await repository.getCurrentUser();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.getCurrentUser());
          verify(mockLocalDataSource.cacheUser(tUserModel));
          expect(result, Right(tUserEntity));
        },
      );

      test(
        'should return null when device is online but no user is authenticated',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.getCurrentUser(),
          ).thenAnswer((_) async => null);

          // act
          final result = await repository.getCurrentUser();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.getCurrentUser());
          expect(result, const Right(null));
        },
      );

      test(
        'should return cached user when remote fails and user is cached',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.getCurrentUser(),
          ).thenThrow(const ServerException('Network error'));
          when(
            mockLocalDataSource.getCachedUser(),
          ).thenAnswer((_) async => tUserModel);

          // act
          final result = await repository.getCurrentUser();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.getCurrentUser());
          verify(mockLocalDataSource.getCachedUser());
          expect(result, Right(tUserEntity));
        },
      );

      test(
        'should return CacheFailure when both remote and local fail',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.getCurrentUser(),
          ).thenThrow(const ServerException('Network error'));
          when(
            mockLocalDataSource.getCachedUser(),
          ).thenThrow(const CacheException('Cache error'));

          // act
          final result = await repository.getCurrentUser();

          // assert
          expect(result, const Left(CacheFailure('Cache error')));
        },
      );
    });

    group('isAuthenticated', () {
      test('should return true when user is authenticated online', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(
          mockRemoteDataSource.isAuthenticated(),
        ).thenAnswer((_) async => true);

        // act
        final result = await repository.isAuthenticated();

        // assert
        verify(mockNetworkInfo.isConnected);
        verify(mockRemoteDataSource.isAuthenticated());
        expect(result, const Right(true));
      });

      test(
        'should return false when user is not authenticated online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          when(
            mockRemoteDataSource.isAuthenticated(),
          ).thenAnswer((_) async => false);

          // act
          final result = await repository.isAuthenticated();

          // assert
          verify(mockNetworkInfo.isConnected);
          verify(mockRemoteDataSource.isAuthenticated());
          expect(result, const Right(false));
        },
      );

      test('should check local cache when device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockLocalDataSource.isUserCached()).thenAnswer((_) async => true);

        // act
        final result = await repository.isAuthenticated();

        // assert
        verify(mockNetworkInfo.isConnected);
        verify(mockLocalDataSource.isUserCached());
        verifyNever(mockRemoteDataSource.isAuthenticated());
        expect(result, const Right(true));
      });
    });
  });
}
