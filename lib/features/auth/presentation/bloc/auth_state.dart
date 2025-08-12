import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  
  const factory AuthState.loading() = AuthLoading;
  
  const factory AuthState.authenticated({
    required UserEntity user,
  }) = Authenticated;
  
  const factory AuthState.unauthenticated() = Unauthenticated;
  
  const factory AuthState.error({
    required Failure failure,
  }) = AuthError;
  
  const factory AuthState.passwordResetSent() = PasswordResetSent;
  
  const factory AuthState.profileUpdated() = ProfileUpdated;
  
  const factory AuthState.emailVerificationSent() = EmailVerificationSent;
}