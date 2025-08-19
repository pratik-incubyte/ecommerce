import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';

/// Parameters for changing password
class ChangePasswordParams {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });
}

/// Use case for changing user password
class ChangePasswordUseCase implements UseCase<Unit, ChangePasswordParams> {
  final ProfileRepository repository;

  ChangePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) async {
    return await repository.changePassword(
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );
  }
}
