import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

export 'auth_event.dart';
export 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  }) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        login: (email, password) => _onLogin(email, password, emit),
        register: (email, password, firstName, lastName) =>
            _onRegister(email, password, firstName, lastName, emit),
        logout: () => _onLogout(emit),
        checkAuthStatus: () => _onCheckAuthStatus(emit),
      );
    });
  }

  Future<void> _onLogin(
    String email,
    String password,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final params = LoginParams(email: email, password: password);
    final result = await loginUseCase(params);

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onRegister(
    String email,
    String password,
    String firstName,
    String lastName,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final params = RegisterParams(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
    final result = await registerUseCase(params);

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await logoutUseCase(const NoParams());

    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await getCurrentUserUseCase(const NoParams());

    result.fold((failure) => emit(AuthState.error(failure.message)), (user) {
      if (user != null) {
        emit(AuthState.authenticated(user));
      } else {
        emit(const AuthState.unauthenticated());
      }
    });
  }
}
