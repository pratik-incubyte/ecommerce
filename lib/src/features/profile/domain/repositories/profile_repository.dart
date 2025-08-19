import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';

/// Repository interface for profile operations
abstract class ProfileRepository {
  /// Get current user profile
  Future<Either<Failure, UserEntity>> getCurrentProfile();
  
  /// Update user profile information
  Future<Either<Failure, UserEntity>> updateProfile(UserEntity user);
  
  /// Update user profile picture
  Future<Either<Failure, String>> updateProfilePicture(String imagePath);
  
  /// Delete user profile
  Future<Either<Failure, Unit>> deleteProfile();
  
  /// Change user password
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
