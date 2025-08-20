import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/change_password_usecase.dart';

import 'change_password_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late ChangePasswordUseCase usecase;
  late MockProfileRepository mockProfileRepository;
  late ChangePasswordParams tParams;
  late String tCurrentPassword;
  late String tNewPassword;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = ChangePasswordUseCase(mockProfileRepository);
    tCurrentPassword = 'currentPassword123';
    tNewPassword = 'newPassword456';
    tParams = ChangePasswordParams(
      currentPassword: tCurrentPassword,
      newPassword: tNewPassword,
    );
  });

  group('ChangePasswordUseCase', () {
    test('should change password through the repository', () async {
      // arrange
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Right(unit));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Right(unit));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return failure when repository fails', () async {
      // arrange
      const tFailure = ServerFailure('Failed to change password');
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return AuthFailure when current password is incorrect', () async {
      // arrange
      const tFailure = AuthFailure('Current password is incorrect');
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return ValidationFailure when new password is too weak', () async {
      // arrange
      const tFailure = ValidationFailure('Password must be at least 8 characters');
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return NetworkFailure when network connection fails', () async {
      // arrange
      const tFailure = NetworkFailure('No internet connection');
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should return ValidationFailure when passwords are the same', () async {
      // arrange
      const tFailure = ValidationFailure('New password must be different from current password');
      final samePasswordParams = ChangePasswordParams(
        currentPassword: 'samePassword',
        newPassword: 'samePassword',
      );
      
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(samePasswordParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: 'samePassword',
        newPassword: 'samePassword',
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should handle empty current password', () async {
      // arrange
      const tFailure = ValidationFailure('Current password cannot be empty');
      final emptyCurrentPasswordParams = ChangePasswordParams(
        currentPassword: '',
        newPassword: tNewPassword,
      );
      
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(emptyCurrentPasswordParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: '',
        newPassword: tNewPassword,
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });

    test('should handle empty new password', () async {
      // arrange
      const tFailure = ValidationFailure('New password cannot be empty');
      final emptyNewPasswordParams = ChangePasswordParams(
        currentPassword: tCurrentPassword,
        newPassword: '',
      );
      
      when(mockProfileRepository.changePassword(
        currentPassword: anyNamed('currentPassword'),
        newPassword: anyNamed('newPassword'),
      )).thenAnswer((_) async => const Left(tFailure));

      // act
      final result = await usecase(emptyNewPasswordParams);

      // assert
      expect(result, const Left(tFailure));
      verify(mockProfileRepository.changePassword(
        currentPassword: tCurrentPassword,
        newPassword: '',
      ));
      verifyNoMoreInteractions(mockProfileRepository);
    });
  });
}
