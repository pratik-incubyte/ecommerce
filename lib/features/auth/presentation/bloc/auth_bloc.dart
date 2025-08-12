import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/watch_auth_state_usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final WatchAuthStateUseCase watchAuthStateUseCase;
  final AuthRepository authRepository;

  StreamSubscription? _authStateSubscription;

  AuthBloc({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserUseCase,
    required this.watchAuthStateUseCase,
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<ResetPasswordRequested>(_onResetPasswordRequested);
    on<UpdatePasswordRequested>(_onUpdatePasswordRequested);
    on<UpdateProfileRequested>(_onUpdateProfileRequested);
    on<SendEmailVerificationRequested>(_onSendEmailVerificationRequested);
    on<DeleteAccountRequested>(_onDeleteAccountRequested);

    _initAuthStateListener();
  }

  void _initAuthStateListener() {
    _authStateSubscription = watchAuthStateUseCase().listen((user) {
      if (user != null) {
        emit(AuthState.authenticated(user: user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await signInUseCase(
      SignInParams(
        email: event.email,
        password: event.password,
      ),
    );
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await signUpUseCase(
      SignUpParams(
        email: event.email,
        password: event.password,
        displayName: event.displayName,
      ),
    );
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (user) => emit(AuthState.authenticated(user: user)),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await signOutUseCase(const NoParams());
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await getCurrentUserUseCase(const NoParams());
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user: user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  Future<void> _onResetPasswordRequested(
    ResetPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.resetPassword(event.email);
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.passwordResetSent()),
    );
  }

  Future<void> _onUpdatePasswordRequested(
    UpdatePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.updatePassword(event.newPassword);
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.profileUpdated()),
    );
  }

  Future<void> _onUpdateProfileRequested(
    UpdateProfileRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.updateProfile(
      displayName: event.displayName,
      photoUrl: event.photoUrl,
    );
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.profileUpdated()),
    );
  }

  Future<void> _onSendEmailVerificationRequested(
    SendEmailVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.sendEmailVerification();
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.emailVerificationSent()),
    );
  }

  Future<void> _onDeleteAccountRequested(
    DeleteAccountRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    final result = await authRepository.deleteAccount();
    
    result.fold(
      (failure) => emit(AuthState.error(failure: failure)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}