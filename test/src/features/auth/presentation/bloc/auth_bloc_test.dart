import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/logout_usecase.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_state.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([
  LoginUseCase,
  RegisterUseCase,
  LogoutUseCase,
  GetCurrentUserUseCase,
])
void main() {
  late AuthBloc authBloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockRegisterUseCase mockRegisterUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockGetCurrentUserUseCase mockGetCurrentUserUseCase;
  late UserEntity tUser;
  late LoginParams tLoginParams;
  late RegisterParams tRegisterParams;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockGetCurrentUserUseCase = MockGetCurrentUserUseCase();

    authBloc = AuthBloc(
      loginUseCase: mockLoginUseCase,
      registerUseCase: mockRegisterUseCase,
      logoutUseCase: mockLogoutUseCase,
      getCurrentUserUseCase: mockGetCurrentUserUseCase,
    );

    tUser = UserEntity(
      id: '1',
      email: 'test@example.com',
      firstName: 'John',
      lastName: 'Doe',
      isVerified: true,
      isActive: true,
      createdAt: DateTime.parse('2024-01-01'),
      updatedAt: DateTime.parse('2024-01-01'),
    );

    tLoginParams = const LoginParams(
      email: 'test@example.com',
      password: 'password123',
    );

    tRegisterParams = const RegisterParams(
      email: 'test@example.com',
      password: 'password123',
      firstName: 'John',
      lastName: 'Doe',
    );
  });

  group('AuthBloc', () {
    test('initial state should be AuthState.initial()', () {
      expect(authBloc.state, const AuthState.initial());
    });

    group('LoginEvent', () {
      blocTest<AuthBloc, AuthState>(
        'should emit [loading, authenticated] when login is successful',
        build: () {
          when(
            mockLoginUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          return authBloc;
        },
        act: (bloc) => bloc.add(
          AuthEvent.login(
            email: tLoginParams.email,
            password: tLoginParams.password,
          ),
        ),
        expect: () => [
          const AuthState.loading(),
          AuthState.authenticated(tUser),
        ],
        verify: (_) {
          verify(mockLoginUseCase.call(tLoginParams));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, error] when login fails with AuthFailure',
        build: () {
          when(mockLoginUseCase.call(any)).thenAnswer(
            (_) async => const Left(AuthFailure('Invalid credentials')),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          AuthEvent.login(
            email: tLoginParams.email,
            password: tLoginParams.password,
          ),
        ),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error('Invalid credentials'),
        ],
        verify: (_) {
          verify(mockLoginUseCase.call(tLoginParams));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, error] when login fails with NetworkFailure',
        build: () {
          when(mockLoginUseCase.call(any)).thenAnswer(
            (_) async => const Left(NetworkFailure('No internet connection')),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          AuthEvent.login(
            email: tLoginParams.email,
            password: tLoginParams.password,
          ),
        ),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error('No internet connection'),
        ],
        verify: (_) {
          verify(mockLoginUseCase.call(tLoginParams));
        },
      );
    });

    group('RegisterEvent', () {
      blocTest<AuthBloc, AuthState>(
        'should emit [loading, authenticated] when registration is successful',
        build: () {
          when(
            mockRegisterUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          return authBloc;
        },
        act: (bloc) => bloc.add(
          AuthEvent.register(
            email: tRegisterParams.email,
            password: tRegisterParams.password,
            firstName: tRegisterParams.firstName,
            lastName: tRegisterParams.lastName,
          ),
        ),
        expect: () => [
          const AuthState.loading(),
          AuthState.authenticated(tUser),
        ],
        verify: (_) {
          verify(mockRegisterUseCase.call(tRegisterParams));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, error] when registration fails with AuthFailure',
        build: () {
          when(mockRegisterUseCase.call(any)).thenAnswer(
            (_) async => const Left(AuthFailure('Email already exists')),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
          AuthEvent.register(
            email: tRegisterParams.email,
            password: tRegisterParams.password,
            firstName: tRegisterParams.firstName,
            lastName: tRegisterParams.lastName,
          ),
        ),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error('Email already exists'),
        ],
        verify: (_) {
          verify(mockRegisterUseCase.call(tRegisterParams));
        },
      );
    });

    group('LogoutEvent', () {
      blocTest<AuthBloc, AuthState>(
        'should emit [loading, unauthenticated] when logout is successful',
        build: () {
          when(
            mockLogoutUseCase.call(any),
          ).thenAnswer((_) async => const Right(unit));
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.logout()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
        verify: (_) {
          verify(mockLogoutUseCase.call(const NoParams()));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, error] when logout fails',
        build: () {
          when(
            mockLogoutUseCase.call(any),
          ).thenAnswer((_) async => const Left(AuthFailure('Logout failed')));
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.logout()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error('Logout failed'),
        ],
        verify: (_) {
          verify(mockLogoutUseCase.call(const NoParams()));
        },
      );
    });

    group('CheckAuthStatusEvent', () {
      blocTest<AuthBloc, AuthState>(
        'should emit [loading, authenticated] when user is authenticated',
        build: () {
          when(
            mockGetCurrentUserUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuthStatus()),
        expect: () => [
          const AuthState.loading(),
          AuthState.authenticated(tUser),
        ],
        verify: (_) {
          verify(mockGetCurrentUserUseCase.call(const NoParams()));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, unauthenticated] when no user is authenticated',
        build: () {
          when(
            mockGetCurrentUserUseCase.call(any),
          ).thenAnswer((_) async => const Right(null));
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuthStatus()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
        verify: (_) {
          verify(mockGetCurrentUserUseCase.call(const NoParams()));
        },
      );

      blocTest<AuthBloc, AuthState>(
        'should emit [loading, error] when getting current user fails',
        build: () {
          when(mockGetCurrentUserUseCase.call(any)).thenAnswer(
            (_) async => const Left(CacheFailure('Failed to get user')),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(const AuthEvent.checkAuthStatus()),
        expect: () => [
          const AuthState.loading(),
          const AuthState.error('Failed to get user'),
        ],
        verify: (_) {
          verify(mockGetCurrentUserUseCase.call(const NoParams()));
        },
      );
    });

    group('state transitions', () {
      blocTest<AuthBloc, AuthState>(
        'should maintain user state after successful login and check auth status',
        build: () {
          when(
            mockLoginUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          when(
            mockGetCurrentUserUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          return authBloc;
        },
        act: (bloc) {
          bloc.add(
            AuthEvent.login(
              email: tLoginParams.email,
              password: tLoginParams.password,
            ),
          );
          bloc.add(const AuthEvent.checkAuthStatus());
        },
        expect: () => [
          const AuthState.loading(),
          AuthState.authenticated(tUser),
          const AuthState.loading(),
          AuthState.authenticated(tUser),
        ],
      );

      blocTest<AuthBloc, AuthState>(
        'should transition from authenticated to unauthenticated after logout',
        build: () {
          when(
            mockLoginUseCase.call(any),
          ).thenAnswer((_) async => Right(tUser));
          when(
            mockLogoutUseCase.call(any),
          ).thenAnswer((_) async => const Right(unit));
          return authBloc;
        },
        act: (bloc) {
          bloc.add(
            AuthEvent.login(
              email: tLoginParams.email,
              password: tLoginParams.password,
            ),
          );
          bloc.add(const AuthEvent.logout());
        },
        expect: () => [
          const AuthState.loading(),
          AuthState.authenticated(tUser),
          const AuthState.loading(),
          const AuthState.unauthenticated(),
        ],
      );
    });
  });
}
