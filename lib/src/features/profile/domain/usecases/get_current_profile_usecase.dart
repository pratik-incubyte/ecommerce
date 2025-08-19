import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';

/// Use case for getting current user profile
class GetCurrentProfileUseCase implements UseCase<UserEntity, NoParams> {
  final ProfileRepository repository;

  GetCurrentProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getCurrentProfile();
  }
}
