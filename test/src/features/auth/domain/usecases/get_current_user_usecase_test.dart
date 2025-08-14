import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/get_current_user_usecase.dart';

import 'get_current_user_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository repository;
  late GetCurrentUserUseCase useCase;
  late UserEntity tUser;

  setUp(() {
    repository = MockAuthRepository();
    useCase = GetCurrentUserUseCase(repository);
    tUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );
  });

  group('GetCurrentUserUseCase', () {
    test('should return UserEntity when user is authenticated', () async {
      // arrange
      when(repository.getCurrentUser()).thenAnswer((_) async => Right(tUser));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, Right(tUser));
      verify(repository.getCurrentUser());
      verifyNoMoreInteractions(repository);
    });

    test('should return null when no user is authenticated', () async {
      // arrange
      when(
        repository.getCurrentUser(),
      ).thenAnswer((_) async => const Right(null));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Right(null));
      verify(repository.getCurrentUser());
      verifyNoMoreInteractions(repository);
    });

    test('should return AuthFailure when authentication check fails', () async {
      // arrange
      const tFailure = AuthFailure('Authentication check failed');
      when(
        repository.getCurrentUser(),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(repository.getCurrentUser());
      verifyNoMoreInteractions(repository);
    });

    test('should return CacheFailure when local storage fails', () async {
      // arrange
      const tFailure = CacheFailure('Failed to read from local storage');
      when(
        repository.getCurrentUser(),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(repository.getCurrentUser());
      verifyNoMoreInteractions(repository);
    });
  });
}
