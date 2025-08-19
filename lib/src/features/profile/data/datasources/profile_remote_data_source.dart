import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/auth/data/models/user_model.dart';

abstract class ProfileRemoteDataSource {
  /// Get current user profile
  Future<UserModel> getCurrentProfile();
  
  /// Update user profile information
  Future<UserModel> updateProfile(UserModel user);
  
  /// Update user profile picture
  Future<String> updateProfilePicture(String imagePath);
  
  /// Delete user profile
  Future<void> deleteProfile();
  
  /// Change user password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  ProfileRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firestore,
    required this.firebaseStorage,
  });

  @override
  Future<UserModel> getCurrentProfile() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        throw const ServerException('No authenticated user found');
      }

      // Try to get user data from Firestore first
      final userDoc = await firestore.collection('users').doc(user.uid).get();
      
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data()!);
      } else {
        // Fallback to Firebase Auth user data
        return _firebaseUserToModel(user);
      }
    } catch (e) {
      throw ServerException('Failed to get current profile: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> updateProfile(UserModel user) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw const ServerException('No authenticated user found');
      }

      // Update display name in Firebase Auth
      await currentUser.updateDisplayName('${user.firstName} ${user.lastName}');

      // Update user data in Firestore
      final updatedUser = user.copyWith(
        updatedAt: DateTime.now(),
      );

      await firestore
          .collection('users')
          .doc(currentUser.uid)
          .set(updatedUser.toJson(), SetOptions(merge: true));

      return updatedUser;
    } catch (e) {
      throw ServerException('Failed to update profile: ${e.toString()}');
    }
  }

  @override
  Future<String> updateProfilePicture(String imagePath) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw const ServerException('No authenticated user found');
      }

      // Upload image to Firebase Storage
      final file = File(imagePath);
      final storageRef = firebaseStorage
          .ref()
          .child('profile_pictures')
          .child('${currentUser.uid}.jpg');

      final uploadTask = await storageRef.putFile(file);
      final downloadURL = await uploadTask.ref.getDownloadURL();

      // Update user profile photo URL in Firebase Auth
      await currentUser.updatePhotoURL(downloadURL);

      // Update user data in Firestore
      await firestore.collection('users').doc(currentUser.uid).update({
        'profilePicture': downloadURL,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return downloadURL;
    } catch (e) {
      throw ServerException('Failed to update profile picture: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteProfile() async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw const ServerException('No authenticated user found');
      }

      // Delete user data from Firestore
      await firestore.collection('users').doc(currentUser.uid).delete();

      // Delete profile picture from Storage if exists
      try {
        final storageRef = firebaseStorage
            .ref()
            .child('profile_pictures')
            .child('${currentUser.uid}.jpg');
        await storageRef.delete();
      } catch (e) {
        // Profile picture might not exist, ignore error
      }

      // Delete Firebase Auth user account
      await currentUser.delete();
    } catch (e) {
      throw ServerException('Failed to delete profile: ${e.toString()}');
    }
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        throw const ServerException('No authenticated user found');
      }

      // Re-authenticate user with current password
      final credential = EmailAuthProvider.credential(
        email: currentUser.email!,
        password: currentPassword,
      );
      await currentUser.reauthenticateWithCredential(credential);

      // Update password
      await currentUser.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'wrong-password':
          errorMessage = 'Current password is incorrect';
          break;
        case 'weak-password':
          errorMessage = 'New password is too weak';
          break;
        case 'requires-recent-login':
          errorMessage = 'Please log in again before changing your password';
          break;
        default:
          errorMessage = 'Failed to change password: ${e.message}';
      }
      throw ServerException(errorMessage, code: e.code);
    } catch (e) {
      throw ServerException('Failed to change password: ${e.toString()}');
    }
  }

  /// Convert Firebase User to UserModel
  UserModel _firebaseUserToModel(User user) {
    final now = DateTime.now();
    final displayName = user.displayName ?? '';
    final names = displayName.split(' ');

    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      firstName: names.isNotEmpty ? names.first : '',
      lastName: names.length > 1 ? names.sublist(1).join(' ') : '',
      phone: user.phoneNumber,
      profilePicture: user.photoURL,
      isVerified: user.emailVerified,
      isActive: true,
      createdAt: user.metadata.creationTime ?? now,
      updatedAt: now,
    );
  }
}
