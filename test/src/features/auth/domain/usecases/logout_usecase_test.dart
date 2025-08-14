import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/logout_usecase.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late AuthRepository repository;
  late LogoutUseCase useCase;

  setUp(() {
    repository = MockAuthRepository();
    useCase = LogoutUseCase(repository);
  });

  group('LogoutUseCase', () {
    test('should return Unit when logout is successful', () async {
      // arrange
      when(repository.logout()).thenAnswer((_) async => const Right(unit));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Right(unit));
      verify(repository.logout());
      verifyNoMoreInteractions(repository);
    });

    test('should return AuthFailure when logout fails', () async {
      // arrange
      const tFailure = AuthFailure('Logout failed');
      when(repository.logout()).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await useCase(const NoParams());

      // assert
      expect(result, const Left(tFailure));
      verify(repository.logout());
      verifyNoMoreInteractions(repository);
    });

    test(
      'should return NetworkFailure when there is no internet connection',
      () async {
        // arrange
        const tFailure = NetworkFailure('No internet connection');
        when(repository.logout()).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await useCase(const NoParams());

        // assert
        expect(result, const Left(tFailure));
        verify(repository.logout());
        verifyNoMoreInteractions(repository);
      },
    );
  });
}
