import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

abstract class AuthRepository {
  /// Login with email and password
  Future<Either<Failure, UserEntity>> login(LoginParams params);

  /// Register a new user
  Future<Either<Failure, UserEntity>> register(RegisterParams params);

  /// Logout the current user
  Future<Either<Failure, Unit>> logout();

  /// Get the current authenticated user
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Check if user is currently authenticated
  Future<Either<Failure, bool>> isAuthenticated();
}
