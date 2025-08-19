import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';

/// Parameters for updating profile picture
class UpdateProfilePictureParams {
  final String imagePath;

  const UpdateProfilePictureParams({required this.imagePath});
}

/// Use case for updating user profile picture
class UpdateProfilePictureUseCase implements UseCase<String, UpdateProfilePictureParams> {
  final ProfileRepository repository;

  UpdateProfilePictureUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(UpdateProfilePictureParams params) async {
    return await repository.updateProfilePicture(params.imagePath);
  }
}
