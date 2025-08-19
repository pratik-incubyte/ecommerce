import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> getCurrentProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProfile = await remoteDataSource.getCurrentProfile();
        await localDataSource.cacheProfile(remoteProfile);
        return Right(remoteProfile.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to get profile: ${e.toString()}'));
      }
    } else {
      try {
        final localProfile = await localDataSource.getCachedProfile();
        if (localProfile != null) {
          return Right(localProfile.toDomain());
        } else {
          return const Left(CacheFailure('No cached profile available'));
        }
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateProfile(UserEntity user) async {
    if (await networkInfo.isConnected) {
      try {
        // Convert entity to model for data layer
        final userModel = UserModel.fromDomain(user);
        final updatedProfile = await remoteDataSource.updateProfile(userModel);
        await localDataSource.cacheProfile(updatedProfile);
        return Right(updatedProfile.toDomain());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to update profile: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfilePicture(String imagePath) async {
    if (await networkInfo.isConnected) {
      try {
        final imageUrl = await remoteDataSource.updateProfilePicture(imagePath);
        return Right(imageUrl);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to update profile picture: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProfile() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProfile();
        await localDataSource.clearCachedProfile();
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to delete profile: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
        return const Right(unit);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } catch (e) {
        return Left(GeneralFailure('Failed to change password: ${e.toString()}'));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}
