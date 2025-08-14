import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/register_usecase.dart';

import 'register_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository repository;
  late RegisterUseCase useCase;
  late UserEntity tUser;
  late RegisterParams tRegisterParams;

  setUp(() {
    repository = MockAuthRepository();
    useCase = RegisterUseCase(repository);
    tUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: false,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );
    tRegisterParams = const RegisterParams(
      email: 'test@example.com',
      password: 'password123',
      firstName: 'John',
      lastName: 'Doe',
    );
  });

  group('RegisterUseCase', () {
    test('should return UserEntity when registration is successful', () async {
      // arrange
      when(
        repository.register(tRegisterParams),
      ).thenAnswer((_) async => Right(tUser));

      // act
      final result = await useCase(tRegisterParams);

      // assert
      expect(result, Right(tUser));
      verify(repository.register(tRegisterParams));
      verifyNoMoreInteractions(repository);
    });

    test(
      'should return AuthFailure when registration fails with existing email',
      () async {
        // arrange
        const tFailure = AuthFailure('Email already exists');
        when(
          repository.register(tRegisterParams),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(tRegisterParams);

        // assert
        expect(result, const Left(tFailure));
        verify(repository.register(tRegisterParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test(
      'should return ValidationFailure when registration fails with weak password',
      () async {
        // arrange
        const tFailure = ValidationFailure('Password is too weak');
        when(
          repository.register(tRegisterParams),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(tRegisterParams);

        // assert
        expect(result, const Left(tFailure));
        verify(repository.register(tRegisterParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test(
      'should return NetworkFailure when there is no internet connection',
      () async {
        // arrange
        const tFailure = NetworkFailure('No internet connection');
        when(
          repository.register(tRegisterParams),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(tRegisterParams);

        // assert
        expect(result, const Left(tFailure));
        verify(repository.register(tRegisterParams));
        verifyNoMoreInteractions(repository);
      },
    );

    test('should return ServerFailure when server error occurs', () async {
      // arrange
      const tFailure = ServerFailure('Server error occurred');
      when(
        repository.register(tRegisterParams),
      ).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(tRegisterParams);

      // assert
      expect(result, const Left(tFailure));
      verify(repository.register(tRegisterParams));
      verifyNoMoreInteractions(repository);
    });
  });
}
