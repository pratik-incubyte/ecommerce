import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';

/// Parameters for updating user profile
class UpdateProfileParams {
  final UserEntity user;

  const UpdateProfileParams({required this.user});
}

/// Use case for updating user profile
class UpdateProfileUseCase implements UseCase<UserEntity, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(params.user);
  }
}
