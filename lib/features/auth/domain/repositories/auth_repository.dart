import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, UserEntity?>> getCurrentUser();

  Stream<UserEntity?> get authStateChanges;

  Future<Either<Failure, void>> resetPassword(String email);

  Future<Either<Failure, void>> updatePassword(String newPassword);

  Future<Either<Failure, void>> updateProfile({
    String? displayName,
    String? photoUrl,
  });

  Future<Either<Failure, void>> sendEmailVerification();

  Future<Either<Failure, void>> deleteAccount();

  Future<Either<Failure, void>> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  });
}