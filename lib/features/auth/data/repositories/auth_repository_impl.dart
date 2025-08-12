import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Authentication failed',
          code: e.code,
        ));
      } on ServerException {
        return const Left(ServerFailure());
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.signUpWithEmailAndPassword(
          email: email,
          password: password,
          displayName: displayName,
        );
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Sign up failed',
          code: e.code,
        ));
      } on ServerException {
        return const Left(ServerFailure());
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCachedUser();
      await localDataSource.clearAuthToken();
      return const Right(null);
    } on AuthException catch (e) {
      return Left(AuthenticationFailure(
        message: e.message ?? 'Sign out failed',
        code: e.code,
      ));
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = remoteDataSource.getCurrentUser();
      if (userModel != null) {
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toEntity());
      }
      
      final cachedUser = await localDataSource.getCachedUser();
      return Right(cachedUser?.toEntity());
    } on CacheException {
      return const Left(CacheFailure());
    } catch (e) {
      return Left(UnexpectedFailure(message: e.toString()));
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return remoteDataSource.authStateChanges.map((userModel) {
      if (userModel != null) {
        localDataSource.cacheUser(userModel);
        return userModel.toEntity();
      }
      return null;
    });
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.resetPassword(email);
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Password reset failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updatePassword(newPassword);
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Password update failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProfile(
          displayName: displayName,
          photoUrl: photoUrl,
        );
        
        final updatedUser = remoteDataSource.getCurrentUser();
        if (updatedUser != null) {
          await localDataSource.cacheUser(updatedUser);
        }
        
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Profile update failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.sendEmailVerification();
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Email verification failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount() async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteAccount();
        await localDataSource.clearCachedUser();
        await localDataSource.clearAuthToken();
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Account deletion failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.reauthenticateWithEmailAndPassword(
          email: email,
          password: password,
        );
        return const Right(null);
      } on AuthException catch (e) {
        return Left(AuthenticationFailure(
          message: e.message ?? 'Reauthentication failed',
          code: e.code,
        ));
      } catch (e) {
        return Left(UnexpectedFailure(message: e.toString()));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}