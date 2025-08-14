import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_event.dart';

void main() {
  group('AuthEvent', () {
    group('Login', () {
      test('should create login event with email and password', () {
        const email = 'test@example.com';
        const password = 'password123';

        const event = AuthEvent.login(email: email, password: password);

        expect(event, isA<AuthEvent>());
        event.when(
          login: (actualEmail, actualPassword) {
            expect(actualEmail, email);
            expect(actualPassword, password);
          },
          register: (_, __, ___, ____) => fail('Should not be register'),
          logout: () => fail('Should not be logout'),
          checkAuthStatus: () => fail('Should not be checkAuthStatus'),
        );
      });

      test('should support equality', () {
        const event1 = AuthEvent.login(
          email: 'test@example.com',
          password: 'password123',
        );
        const event2 = AuthEvent.login(
          email: 'test@example.com',
          password: 'password123',
        );
        const event3 = AuthEvent.login(
          email: 'different@example.com',
          password: 'password123',
        );

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });

      test('should have correct toString representation', () {
        const event = AuthEvent.login(
          email: 'test@example.com',
          password: 'password123',
        );

        expect(event.toString(), contains('login'));
        expect(event.toString(), contains('test@example.com'));
      });
    });

    group('Register', () {
      test('should create register event with all required fields', () {
        const email = 'test@example.com';
        const password = 'password123';
        const firstName = 'John';
        const lastName = 'Doe';

        const event = AuthEvent.register(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        );

        expect(event, isA<AuthEvent>());
        event.when(
          login: (_, __) => fail('Should not be login'),
          register:
              (actualEmail, actualPassword, actualFirstName, actualLastName) {
                expect(actualEmail, email);
                expect(actualPassword, password);
                expect(actualFirstName, firstName);
                expect(actualLastName, lastName);
              },
          logout: () => fail('Should not be logout'),
          checkAuthStatus: () => fail('Should not be checkAuthStatus'),
        );
      });

      test('should support equality', () {
        const event1 = AuthEvent.register(
          email: 'test@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );
        const event2 = AuthEvent.register(
          email: 'test@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );
        const event3 = AuthEvent.register(
          email: 'test@example.com',
          password: 'password123',
          firstName: 'Jane',
          lastName: 'Doe',
        );

        expect(event1, equals(event2));
        expect(event1, isNot(equals(event3)));
      });

      test('should have correct toString representation', () {
        const event = AuthEvent.register(
          email: 'test@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );

        expect(event.toString(), contains('register'));
        expect(event.toString(), contains('test@example.com'));
        expect(event.toString(), contains('John'));
      });
    });

    group('Logout', () {
      test('should create logout event', () {
        const event = AuthEvent.logout();

        expect(event, isA<AuthEvent>());
        event.when(
          login: (_, __) => fail('Should not be login'),
          register: (_, __, ___, ____) => fail('Should not be register'),
          logout: () {
            // Success - this is the expected branch
          },
          checkAuthStatus: () => fail('Should not be checkAuthStatus'),
        );
      });

      test('should support equality', () {
        const event1 = AuthEvent.logout();
        const event2 = AuthEvent.logout();

        expect(event1, equals(event2));
      });

      test('should have correct toString representation', () {
        const event = AuthEvent.logout();

        expect(event.toString(), contains('logout'));
      });
    });

    group('CheckAuthStatus', () {
      test('should create checkAuthStatus event', () {
        const event = AuthEvent.checkAuthStatus();

        expect(event, isA<AuthEvent>());
        event.when(
          login: (_, __) => fail('Should not be login'),
          register: (_, __, ___, ____) => fail('Should not be register'),
          logout: () => fail('Should not be logout'),
          checkAuthStatus: () {
            // Success - this is the expected branch
          },
        );
      });

      test('should support equality', () {
        const event1 = AuthEvent.checkAuthStatus();
        const event2 = AuthEvent.checkAuthStatus();

        expect(event1, equals(event2));
      });

      test('should have correct toString representation', () {
        const event = AuthEvent.checkAuthStatus();

        expect(event.toString(), contains('checkAuthStatus'));
      });
    });

    group('Event Properties', () {
      test('all events should extend AuthEvent', () {
        const loginEvent = AuthEvent.login(
          email: 'test@example.com',
          password: 'password123',
        );
        const registerEvent = AuthEvent.register(
          email: 'test@example.com',
          password: 'password123',
          firstName: 'John',
          lastName: 'Doe',
        );
        const logoutEvent = AuthEvent.logout();
        const checkAuthEvent = AuthEvent.checkAuthStatus();

        expect(loginEvent, isA<AuthEvent>());
        expect(registerEvent, isA<AuthEvent>());
        expect(logoutEvent, isA<AuthEvent>());
        expect(checkAuthEvent, isA<AuthEvent>());
      });

      test('different event types should not be equal', () {
        const loginEvent = AuthEvent.login(
          email: 'test@example.com',
          password: 'password123',
        );
        const logoutEvent = AuthEvent.logout();

        expect(loginEvent, isNot(equals(logoutEvent)));
      });
    });
  });
}
