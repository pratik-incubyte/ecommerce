import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:ecommerce/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

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
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.login(params);
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toDomain());
      } on ServerException catch (e) {
        if (e.code == 'invalid-credential' ||
            e.code == 'user-not-found' ||
            e.code == 'wrong-password') {
          return Left(AuthFailure(e.message));
        }
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(RegisterParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.register(params);
        await localDataSource.cacheUser(userModel);
        return Right(userModel.toDomain());
      } on ServerException catch (e) {
        if (e.code == 'email-already-in-use' || e.code == 'weak-password') {
          return Left(AuthFailure(e.message));
        }
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.logout();
      }
      await localDataSource.clearCachedUser();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.getCurrentUser();
        if (userModel != null) {
          await localDataSource.cacheUser(userModel);
          return Right(userModel.toDomain());
        }
        return const Right(null);
      } on ServerException {
        // If remote fails, try local cache
        try {
          final cachedUser = await localDataSource.getCachedUser();
          if (cachedUser != null) {
            return Right(cachedUser.toDomain());
          }
          return const Right(null);
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } else {
      try {
        final cachedUser = await localDataSource.getCachedUser();
        if (cachedUser != null) {
          return Right(cachedUser.toDomain());
        }
        return const Right(null);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    try {
      if (await networkInfo.isConnected) {
        final isAuth = await remoteDataSource.isAuthenticated();
        return Right(isAuth);
      } else {
        final isUserCached = await localDataSource.isUserCached();
        return Right(isUserCached);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
