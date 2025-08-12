import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/firestore_service.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  });

  Future<void> signOut();

  UserModel? getCurrentUser();

  Stream<UserModel?> get authStateChanges;

  Future<void> resetPassword(String email);

  Future<void> updatePassword(String newPassword);

  Future<void> updateProfile({
    String? displayName,
    String? photoUrl,
  });

  Future<void> sendEmailVerification();

  Future<void> deleteAccount();

  Future<void> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;

  AuthRemoteDataSourceImpl({
    required FirebaseAuthService authService,
    required FirestoreService firestoreService,
  })  : _authService = authService,
        _firestoreService = firestoreService;

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (user) => UserModel.fromFirebaseUser(user),
    );
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final result = await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
      displayName: displayName,
    );
    
    return result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (user) {
        final userModel = UserModel.fromFirebaseUser(user);
        _createUserDocument(userModel);
        return userModel;
      },
    );
  }

  Future<void> _createUserDocument(UserModel user) async {
    await _firestoreService.setDocument(
      'users',
      user.uid,
      user.toJson(),
    );
  }

  @override
  Future<void> signOut() async {
    final result = await _authService.signOut();
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  UserModel? getCurrentUser() {
    final user = _authService.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _authService.authStateChanges.map(
      (user) => user != null ? UserModel.fromFirebaseUser(user) : null,
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    final result = await _authService.resetPassword(email);
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    final result = await _authService.updatePassword(newPassword);
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  Future<void> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    final result = await _authService.updateProfile(
      displayName: displayName,
      photoURL: photoUrl,
    );
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  Future<void> sendEmailVerification() async {
    final result = await _authService.sendEmailVerification();
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  Future<void> deleteAccount() async {
    final result = await _authService.deleteAccount();
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }

  @override
  Future<void> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final result = await _authService.reauthenticateWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => throw AuthException(
        message: failure.message,
        code: failure.code,
      ),
      (_) => null,
    );
  }
}