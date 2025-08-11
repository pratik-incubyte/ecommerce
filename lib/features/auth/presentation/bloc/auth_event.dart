part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  
  const factory AuthEvent.register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) = _Register;
  
  const factory AuthEvent.logout() = _Logout;
  
  const factory AuthEvent.getCurrentUser() = _GetCurrentUser;
}
