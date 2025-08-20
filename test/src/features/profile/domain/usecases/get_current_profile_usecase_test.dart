import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/get_current_profile_usecase.dart';

import 'get_current_profile_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late GetCurrentProfileUseCase usecase;
  late MockProfileRepository mockProfileRepository;
  late UserEntity tUser;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = GetCurrentProfileUseCase(mockProfileRepository);
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
  });

  group('GetCurrentProfileUseCase', () {
    test('should get current user profile from the repository', () async {
      // arrange
      when(mockProfileRepository.getCurrentProfile())
          .thenAnswer((_) async => Right(tUser));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, Right(tUser));
      verify(mockProfileRepository.getCurrentProfile());
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to get profile');
      when(mockProfileRepository.getCurrentProfile())
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.getCurrentProfile());
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return AuthFailure when user is not authenticated', () async {
      // arrange
      const tFailure = AuthFailure('User not authenticated');
      when(mockProfileRepository.getCurrentProfile())
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.getCurrentProfile());
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return NetworkFailure when network connection fails', () async {
      // arrange
      const tFailure = NetworkFailure('No internet connection');
      when(mockProfileRepository.getCurrentProfile())
          .thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.getCurrentProfile());
      verifyNoMoreInteractions(mockProfileRepository);
    });
  });
}
