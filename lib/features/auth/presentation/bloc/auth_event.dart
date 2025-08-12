import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = SignInRequested;

  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
    String? displayName,
  }) = SignUpRequested;

  const factory AuthEvent.signOutRequested() = SignOutRequested;

  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;

  const factory AuthEvent.resetPasswordRequested({
    required String email,
  }) = ResetPasswordRequested;

  const factory AuthEvent.updatePasswordRequested({
    required String newPassword,
  }) = UpdatePasswordRequested;

  const factory AuthEvent.updateProfileRequested({
    String? displayName,
    String? photoUrl,
  }) = UpdateProfileRequested;

  const factory AuthEvent.sendEmailVerificationRequested() = 
      SendEmailVerificationRequested;

  const factory AuthEvent.deleteAccountRequested() = DeleteAccountRequested;
}