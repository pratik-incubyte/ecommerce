import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import '../error/failures.dart';
import '../error/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthService({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        return const Left(AuthenticationFailure(message: 'Sign in failed'));
      }
      return Right(credential.user!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) {
        return const Left(AuthenticationFailure(message: 'Sign up failed'));
      }
      
      if (displayName != null && displayName.isNotEmpty) {
        await credential.user!.updateDisplayName(displayName);
        await credential.user!.reload();
      }
      
      return Right(_firebaseAuth.currentUser!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
          AuthenticationFailure(message: 'No user logged in'),
        );
      }
      await user.updatePassword(newPassword);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
          AuthenticationFailure(message: 'No user logged in'),
        );
      }
      
      if (displayName != null) {
        await user.updateDisplayName(displayName);
      }
      if (photoURL != null) {
        await user.updatePhotoURL(photoURL);
      }
      await user.reload();
      return const Right(null);
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteAccount() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
          AuthenticationFailure(message: 'No user logged in'),
        );
      }
      await user.delete();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> sendEmailVerification() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
          AuthenticationFailure(message: 'No user logged in'),
        );
      }
      await user.sendEmailVerification();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> reauthenticateWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return const Left(
          AuthenticationFailure(message: 'No user logged in'),
        );
      }
      
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(AuthenticationFailure(
        message: _getMessageFromCode(e.code),
        code: e.code,
      ));
    } catch (e) {
      return Left(AuthenticationFailure(message: e.toString()));
    }
  }

  String _getMessageFromCode(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Wrong password provided';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'invalid-email':
        return 'Invalid email address';
      case 'operation-not-allowed':
        return 'Operation not allowed';
      case 'weak-password':
        return 'Password is too weak';
      case 'user-disabled':
        return 'This user has been disabled';
      case 'too-many-requests':
        return 'Too many requests. Try again later';
      case 'requires-recent-login':
        return 'This operation requires recent authentication';
      default:
        return 'An error occurred. Please try again';
    }
  }
}