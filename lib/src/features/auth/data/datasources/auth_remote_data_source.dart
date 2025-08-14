import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

abstract class AuthRemoteDataSource {
  /// Login with email and password
  Future<UserModel> login(LoginParams params);

  /// Register a new user
  Future<UserModel> register(RegisterParams params);

  /// Logout the current user
  Future<void> logout();

  /// Get the current authenticated user
  Future<UserModel?> getCurrentUser();

  /// Check if user is currently authenticated
  Future<bool> isAuthenticated();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> login(LoginParams params) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      if (credential.user == null) {
        throw const ServerException('Login failed: No user returned');
      }

      return _userToModel(credential.user!);
    } on FirebaseAuthException catch (e) {
      throw ServerException('Login failed: ${e.message}', code: e.code);
    } catch (e) {
      throw ServerException('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> register(RegisterParams params) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      if (credential.user == null) {
        throw const ServerException('Registration failed: No user returned');
      }

      // Update display name
      await credential.user!.updateDisplayName(
        '${params.firstName} ${params.lastName}',
      );

      return _userToModel(
        credential.user!,
        firstName: params.firstName,
        lastName: params.lastName,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException('Registration failed: ${e.message}', code: e.code);
    } catch (e) {
      throw ServerException('Registration failed: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw ServerException('Logout failed: ${e.toString()}');
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) return null;

      return _userToModel(user);
    } catch (e) {
      throw ServerException('Failed to get current user: ${e.toString()}');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      return firebaseAuth.currentUser != null;
    } catch (e) {
      throw ServerException('Failed to check authentication: ${e.toString()}');
    }
  }

  /// Convert Firebase User to UserModel
  UserModel _userToModel(User user, {String? firstName, String? lastName}) {
    final now = DateTime.now();
    final displayName = user.displayName ?? '';
    final names = displayName.split(' ');

    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      firstName: firstName ?? (names.isNotEmpty ? names.first : ''),
      lastName:
          lastName ?? (names.length > 1 ? names.sublist(1).join(' ') : ''),
      isVerified: user.emailVerified,
      isActive: true,
      createdAt: user.metadata.creationTime ?? now,
      updatedAt: now,
    );
  }
}
