import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:ecommerce/src/features/profile/data/repositories/profile_repository_impl.dart';

import 'profile_repository_impl_test.mocks.dart';

@GenerateMocks([
  ProfileRemoteDataSource,
  ProfileLocalDataSource,
  NetworkInfo,
])
void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileRemoteDataSource mockRemoteDataSource;
  late MockProfileLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late UserModel tUserModel;
  late UserEntity tUserEntity;

  setUp(() {
    mockRemoteDataSource = MockProfileRemoteDataSource();
    mockLocalDataSource = MockProfileLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
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

  group('ProfileRepositoryImpl', () {
    group('getCurrentProfile', () {
      test('should return remote data when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getCurrentProfile())
            .thenAnswer((_) async => tUserModel);
        when(mockLocalDataSource.cacheProfile(any)).thenAnswer((_) async => {});

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentProfile());
        verify(mockLocalDataSource.cacheProfile(tUserModel));
        expect(result, Right(tUserEntity));
      });

      test('should cache the data locally when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getCurrentProfile())
            .thenAnswer((_) async => tUserModel);
        when(mockLocalDataSource.cacheProfile(any)).thenAnswer((_) async => {});

        // act
        await repository.getCurrentProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentProfile());
        verify(mockLocalDataSource.cacheProfile(tUserModel));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getCurrentProfile())
            .thenThrow(const ServerException('Server error'));

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentProfile());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, const Left(ServerFailure('Server error')));
      });

      test('should return last locally cached data when the device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockLocalDataSource.getCachedProfile())
            .thenAnswer((_) async => tUserModel);

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProfile());
        expect(result, Right(tUserEntity));
      });

      test('should return CacheFailure when the device is offline and no cached data is available', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockLocalDataSource.getCachedProfile()).thenAnswer((_) async => null);

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProfile());
        expect(result, const Left(CacheFailure('No cached profile available')));
      });

      test('should return CacheFailure when the device is offline and cache operation fails', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        when(mockLocalDataSource.getCachedProfile())
            .thenThrow(const CacheException('Cache error'));

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getCachedProfile());
        expect(result, const Left(CacheFailure('Cache error')));
      });

      test('should return general failure when an unexpected error occurs', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getCurrentProfile())
            .thenThrow(Exception('Unexpected error'));

        // act
        final result = await repository.getCurrentProfile();

        // assert
        verify(mockRemoteDataSource.getCurrentProfile());
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<GeneralFailure>()),
          (profile) => fail('Expected a failure'),
        );
      });
    });

    group('updateProfile', () {
      test('should return updated profile when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfile(any))
            .thenAnswer((_) async => tUserModel);
        when(mockLocalDataSource.cacheProfile(any)).thenAnswer((_) async => {});

        // act
        final result = await repository.updateProfile(tUserEntity);

        // assert
        verify(mockRemoteDataSource.updateProfile(any));
        verify(mockLocalDataSource.cacheProfile(tUserModel));
        expect(result, Right(tUserEntity));
      });

      test('should cache the updated profile locally when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfile(any))
            .thenAnswer((_) async => tUserModel);
        when(mockLocalDataSource.cacheProfile(any)).thenAnswer((_) async => {});

        // act
        await repository.updateProfile(tUserEntity);

        // assert
        verify(mockRemoteDataSource.updateProfile(any));
        verify(mockLocalDataSource.cacheProfile(tUserModel));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfile(any))
            .thenThrow(const ServerException('Server error'));

        // act
        final result = await repository.updateProfile(tUserEntity);

        // assert
        verify(mockRemoteDataSource.updateProfile(any));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, const Left(ServerFailure('Server error')));
      });

      test('should return network failure when the device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.updateProfile(tUserEntity);

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, const Left(NetworkFailure('No internet connection')));
      });

      test('should return general failure when an unexpected error occurs', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfile(any))
            .thenThrow(Exception('Unexpected error'));

        // act
        final result = await repository.updateProfile(tUserEntity);

        // assert
        verify(mockRemoteDataSource.updateProfile(any));
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<GeneralFailure>()),
          (profile) => fail('Expected a failure'),
        );
      });
    });

    group('updateProfilePicture', () {
      test('should return image URL when the call to remote data source is successful', () async {
        // arrange
        const imagePath = '/path/to/image.jpg';
        const imageUrl = 'https://example.com/image.jpg';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfilePicture(imagePath))
            .thenAnswer((_) async => imageUrl);

        // act
        final result = await repository.updateProfilePicture(imagePath);

        // assert
        verify(mockRemoteDataSource.updateProfilePicture(imagePath));
        expect(result, const Right(imageUrl));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        const imagePath = '/path/to/image.jpg';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfilePicture(imagePath))
            .thenThrow(const ServerException('Server error'));

        // act
        final result = await repository.updateProfilePicture(imagePath);

        // assert
        verify(mockRemoteDataSource.updateProfilePicture(imagePath));
        expect(result, const Left(ServerFailure('Server error')));
      });

      test('should return network failure when the device is offline', () async {
        // arrange
        const imagePath = '/path/to/image.jpg';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.updateProfilePicture(imagePath);

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, const Left(NetworkFailure('No internet connection')));
      });

      test('should return general failure when an unexpected error occurs', () async {
        // arrange
        const imagePath = '/path/to/image.jpg';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.updateProfilePicture(imagePath))
            .thenThrow(Exception('Unexpected error'));

        // act
        final result = await repository.updateProfilePicture(imagePath);

        // assert
        verify(mockRemoteDataSource.updateProfilePicture(imagePath));
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<GeneralFailure>()),
          (url) => fail('Expected a failure'),
        );
      });
    });

    group('deleteProfile', () {
      test('should return unit when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.deleteProfile()).thenAnswer((_) async => {});
        when(mockLocalDataSource.clearCachedProfile()).thenAnswer((_) async => {});

        // act
        final result = await repository.deleteProfile();

        // assert
        verify(mockRemoteDataSource.deleteProfile());
        verify(mockLocalDataSource.clearCachedProfile());
        expect(result, const Right(unit));
      });

      test('should clear cached profile when the call to remote data source is successful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.deleteProfile()).thenAnswer((_) async => {});
        when(mockLocalDataSource.clearCachedProfile()).thenAnswer((_) async => {});

        // act
        await repository.deleteProfile();

        // assert
        verify(mockRemoteDataSource.deleteProfile());
        verify(mockLocalDataSource.clearCachedProfile());
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.deleteProfile())
            .thenThrow(const ServerException('Server error'));

        // act
        final result = await repository.deleteProfile();

        // assert
        verify(mockRemoteDataSource.deleteProfile());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, const Left(ServerFailure('Server error')));
      });

      test('should return network failure when the device is offline', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.deleteProfile();

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, const Left(NetworkFailure('No internet connection')));
      });

      test('should return general failure when an unexpected error occurs', () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.deleteProfile())
            .thenThrow(Exception('Unexpected error'));

        // act
        final result = await repository.deleteProfile();

        // assert
        verify(mockRemoteDataSource.deleteProfile());
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<GeneralFailure>()),
          (_) => fail('Expected a failure'),
        );
      });
    });

    group('changePassword', () {
      test('should return unit when the call to remote data source is successful', () async {
        // arrange
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.changePassword(
          currentPassword: anyNamed('currentPassword'),
          newPassword: anyNamed('newPassword'),
        )).thenAnswer((_) async => {});

        // act
        final result = await repository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // assert
        verify(mockRemoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ));
        expect(result, const Right(unit));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // arrange
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.changePassword(
          currentPassword: anyNamed('currentPassword'),
          newPassword: anyNamed('newPassword'),
        )).thenThrow(const ServerException('Server error'));

        // act
        final result = await repository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // assert
        verify(mockRemoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ));
        expect(result, const Left(ServerFailure('Server error')));
      });

      test('should return network failure when the device is offline', () async {
        // arrange
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

        // act
        final result = await repository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, const Left(NetworkFailure('No internet connection')));
      });

      test('should return general failure when an unexpected error occurs', () async {
        // arrange
        const currentPassword = 'currentPassword';
        const newPassword = 'newPassword';
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.changePassword(
          currentPassword: anyNamed('currentPassword'),
          newPassword: anyNamed('newPassword'),
        )).thenThrow(Exception('Unexpected error'));

        // act
        final result = await repository.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        // assert
        verify(mockRemoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        ));
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<GeneralFailure>()),
          (_) => fail('Expected a failure'),
        );
      });
    });
  });
}
