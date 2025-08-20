import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_usecase.dart';

import 'update_profile_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late UpdateProfileUseCase usecase;
  late MockProfileRepository mockProfileRepository;
  late UserEntity tUser;
  late UserEntity tUpdatedUser;
  late UpdateProfileParams tParams;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = UpdateProfileUseCase(mockProfileRepository);
    tUser = UserEntity(
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
    
    tUpdatedUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'Jane',
      lastName: 'Smith',
      phone: '+1987654321',
      profilePicture: 'https://example.com/new_profile.jpg',
      address: '456 Oak Ave',
      city: 'Los Angeles',
      country: 'USA',
      postalCode: '90210',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01T00:00:00.000Z'),
      updatedAt: DateTime.parse('2024-01-02T00:00:00.000Z'),
    );

    tParams = UpdateProfileParams(user: tUpdatedUser);
  });

  group('UpdateProfileUseCase', () {
    test('should update user profile through the repository', () async {
      // arrange
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => Right(tUpdatedUser));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, Right(tUpdatedUser));
      verify(mockProfileRepository.updateProfile(tUpdatedUser));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Failed to update profile');
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfile(tUpdatedUser));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return AuthFailure when user is not authenticated', () async {
      // arrange
      const tFailure = AuthFailure('User not authenticated');
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfile(tUpdatedUser));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return ValidationFailure when invalid data is provided', () async {
      // arrange
      const tFailure = ValidationFailure('Invalid email format');
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfile(tUpdatedUser));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return NetworkFailure when network connection fails', () async {
      // arrange
      const tFailure = NetworkFailure('No internet connection');
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.updateProfile(tUpdatedUser));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should handle partial profile updates correctly', () async {
      // arrange
      final partialUpdate = UserEntity(
        id: '1',
        email: 'test@example.com',
        firstName: 'UpdatedName',
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
        updatedAt: DateTime.parse('2024-01-02T00:00:00.000Z'),
      );
      
      final tPartialParams = UpdateProfileParams(user: partialUpdate);
      
      when(mockProfileRepository.updateProfile(any))
          .thenAnswer((_) async => Right(partialUpdate));

      // act
      final result = await usecase(tPartialParams);

      // assert
      expect(result, Right(partialUpdate));
      verify(mockProfileRepository.updateProfile(partialUpdate));
      verifyNoMoreInteractions(mockProfileRepository);
    });
  });
}
