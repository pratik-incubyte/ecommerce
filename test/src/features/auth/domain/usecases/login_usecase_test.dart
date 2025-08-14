import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/login_usecase.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository repository;
  late LoginUseCase useCase;
  late UserEntity tUser;
  late LoginParams tLoginParams;

  setUp(() {
    repository = MockAuthRepository();
    useCase = LoginUseCase(repository);
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
    tLoginParams = const LoginParams(
      email: 'test@example.com',
      password: 'password123',
    );
  });

  group('LoginUseCase', () {
    test('should return UserEntity when login is successful', () async {
      // arrange
      when(
        repository.login(tLoginParams),
      ).thenAnswer((_) async => Right(tUser));

      // act
      final result = await useCase(tLoginParams);

      // assert
      expect(result, Right(tUser));
      verify(repository.login(tLoginParams));
      verifyNoMoreInteractions(repository);
    });

    test(
      'should return AuthFailure when login fails with invalid credentials',
      () async {
        // arrange
        const tFailure = AuthFailure('Invalid email or password');
        when(
          repository.login(tLoginParams),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(tLoginParams);

        // assert
        expect(result, const Left(tFailure));
        verify(repository.login(tLoginParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test(
      'should return NetworkFailure when there is no internet connection',
      () async {
        // arrange
        const tFailure = NetworkFailure('No internet connection');
        when(
          repository.login(tLoginParams),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(tLoginParams);

        // assert
        expect(result, const Left(tFailure));
        verify(repository.login(tLoginParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test('should return ServerFailure when server error occurs', () async {
      // arrange
      const tFailure = ServerFailure('Server error occurred');
      when(
        repository.login(tLoginParams),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tLoginParams);

      // assert
      expect(result, const Left(tFailure));
      verify(repository.login(tLoginParams));
      verifyNoMoreInteractions(repository);
    });
  });
}
