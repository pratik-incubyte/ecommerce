import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';
import '../../../../core/error/failures.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Use cases will be injected here
  final dynamic loginUseCase;
  final dynamic registerUseCase;
  final dynamic logoutUseCase;
  final dynamic getCurrentUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(const AuthState.initial()) {
    on<_Login>(_onLogin);
    on<_Register>(_onRegister);
    on<_Logout>(_onLogout);
    on<_GetCurrentUser>(_onGetCurrentUser);
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    // TODO: Implement login logic
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthState.authenticated(UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )));
  }

  Future<void> _onRegister(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    // TODO: Implement register logic
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthState.authenticated(UserEntity(
      id: '1',
      email: event.email,
      firstName: event.firstName,
      lastName: event.lastName,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )));
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    // TODO: Implement logout logic
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onGetCurrentUser(_GetCurrentUser event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    // TODO: Implement get current user logic
    await Future.delayed(const Duration(seconds: 1));
    emit(const AuthState.unauthenticated());
  }
}
