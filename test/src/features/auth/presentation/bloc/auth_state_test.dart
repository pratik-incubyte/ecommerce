import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_state.dart';

void main() {
  group('AuthState', () {
    late UserEntity tUser;

    setUp(() {
      tUser = UserEntity(
        id: '1',
        email: 'test@example.com',
        firstName: 'John',
        lastName: 'Doe',
        createdAt: DateTime(2024),
        updatedAt: DateTime(2024),
      );
    });

    group('Initial', () {
      test('should create initial state', () {
        const state = AuthState.initial();

        expect(state, isA<AuthState>());
        state.when(
          initial: () {
            // Success - this is the expected branch
          },
          loading: () => fail('Should not be loading'),
          authenticated: (_) => fail('Should not be authenticated'),
          unauthenticated: () => fail('Should not be unauthenticated'),
          error: (_) => fail('Should not be error'),
        );
      });

      test('should support equality', () {
        const state1 = AuthState.initial();
        const state2 = AuthState.initial();

        expect(state1, equals(state2));
      });

      test('should have correct toString representation', () {
        const state = AuthState.initial();

        expect(state.toString(), contains('initial'));
      });
    });

    group('Loading', () {
      test('should create loading state', () {
        const state = AuthState.loading();

        expect(state, isA<AuthState>());
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () {
            // Success - this is the expected branch
          },
          authenticated: (_) => fail('Should not be authenticated'),
          unauthenticated: () => fail('Should not be unauthenticated'),
          error: (_) => fail('Should not be error'),
        );
      });

      test('should support equality', () {
        const state1 = AuthState.loading();
        const state2 = AuthState.loading();

        expect(state1, equals(state2));
      });

      test('should have correct toString representation', () {
        const state = AuthState.loading();

        expect(state.toString(), contains('loading'));
      });
    });

    group('Authenticated', () {
      test('should create authenticated state with user', () {
        final state = AuthState.authenticated(tUser);

        expect(state, isA<AuthState>());
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          authenticated: (user) {
            expect(user, equals(tUser));
          },
          unauthenticated: () => fail('Should not be unauthenticated'),
          error: (_) => fail('Should not be error'),
        );
      });

      test('should support equality', () {
        final state1 = AuthState.authenticated(tUser);
        final state2 = AuthState.authenticated(tUser);
        final differentUser = UserEntity(
          id: '2',
          email: 'different@example.com',
          firstName: 'Jane',
          lastName: 'Smith',
          createdAt: DateTime(2024),
          updatedAt: DateTime(2024),
        );
        final state3 = AuthState.authenticated(differentUser);

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should have correct toString representation', () {
        final state = AuthState.authenticated(tUser);

        expect(state.toString(), contains('authenticated'));
        expect(state.toString(), contains('test@example.com'));
      });
    });

    group('Unauthenticated', () {
      test('should create unauthenticated state', () {
        const state = AuthState.unauthenticated();

        expect(state, isA<AuthState>());
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          authenticated: (_) => fail('Should not be authenticated'),
          unauthenticated: () {
            // Success - this is the expected branch
          },
          error: (_) => fail('Should not be error'),
        );
      });

      test('should support equality', () {
        const state1 = AuthState.unauthenticated();
        const state2 = AuthState.unauthenticated();

        expect(state1, equals(state2));
      });

      test('should have correct toString representation', () {
        const state = AuthState.unauthenticated();

        expect(state.toString(), contains('unauthenticated'));
      });
    });

    group('Error', () {
      test('should create error state with message', () {
        const errorMessage = 'Authentication failed';
        const state = AuthState.error(errorMessage);

        expect(state, isA<AuthState>());
        state.when(
          initial: () => fail('Should not be initial'),
          loading: () => fail('Should not be loading'),
          authenticated: (_) => fail('Should not be authenticated'),
          unauthenticated: () => fail('Should not be unauthenticated'),
          error: (message) {
            expect(message, equals(errorMessage));
          },
        );
      });

      test('should support equality', () {
        const state1 = AuthState.error('Authentication failed');
        const state2 = AuthState.error('Authentication failed');
        const state3 = AuthState.error('Different error');

        expect(state1, equals(state2));
        expect(state1, isNot(equals(state3)));
      });

      test('should have correct toString representation', () {
        const state = AuthState.error('Authentication failed');

        expect(state.toString(), contains('error'));
        expect(state.toString(), contains('Authentication failed'));
      });
    });

    group('State Properties', () {
      test('all states should extend AuthState', () {
        const initialState = AuthState.initial();
        const loadingState = AuthState.loading();
        final authenticatedState = AuthState.authenticated(tUser);
        const unauthenticatedState = AuthState.unauthenticated();
        const errorState = AuthState.error('Error');

        expect(initialState, isA<AuthState>());
        expect(loadingState, isA<AuthState>());
        expect(authenticatedState, isA<AuthState>());
        expect(unauthenticatedState, isA<AuthState>());
        expect(errorState, isA<AuthState>());
      });

      test('different state types should not be equal', () {
        const initialState = AuthState.initial();
        const loadingState = AuthState.loading();
        const unauthenticatedState = AuthState.unauthenticated();

        expect(initialState, isNot(equals(loadingState)));
        expect(loadingState, isNot(equals(unauthenticatedState)));
        expect(initialState, isNot(equals(unauthenticatedState)));
      });

      test('should handle maybeWhen correctly', () {
        const loadingState = AuthState.loading();

        final result = loadingState.maybeWhen(
          loading: () => 'loading',
          orElse: () => 'other',
        );

        expect(result, equals('loading'));
      });

      test('should handle map correctly', () {
        const errorState = AuthState.error('Test error');

        final result = errorState.map(
          initial: (_) => 'initial',
          loading: (_) => 'loading',
          authenticated: (_) => 'authenticated',
          unauthenticated: (_) => 'unauthenticated',
          error: (_) => 'error',
        );

        expect(result, equals('error'));
      });
    });
  });
}
