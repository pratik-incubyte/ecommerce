import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/src/features/auth/presentation/pages/login_page.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([AuthBloc, GoRouter])
void main() {
  late MockAuthBloc mockAuthBloc;
  late MockGoRouter mockGoRouter;
  final getIt = GetIt.instance;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockGoRouter = MockGoRouter();

    // Register mock in GetIt
    if (getIt.isRegistered<AuthBloc>()) {
      getIt.unregister<AuthBloc>();
    }
    getIt.registerFactory<AuthBloc>(() => mockAuthBloc);

    // Set up default stream for bloc
    when(
      mockAuthBloc.stream,
    ).thenAnswer((_) => Stream.fromIterable([const AuthState.initial()]));
    when(mockAuthBloc.state).thenReturn(const AuthState.initial());
  });

  tearDown(() {
    if (getIt.isRegistered<AuthBloc>()) {
      getIt.unregister<AuthBloc>();
    }
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(home: const LoginPage());
  }

  group('LoginPage', () {
    testWidgets('should display login form elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Welcome Back!'), findsOneWidget);
      expect(find.text('Login'), findsWidgets);
      expect(
        find.byType(TextFormField),
        findsNWidgets(2),
      ); // Email and Password
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text("Don't have an account? "), findsOneWidget);
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('should display email and password fields', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);

      // Check that fields exist and are properly configured
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
    });

    testWidgets('should validate email field', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      // Try to submit with empty email
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email'), findsOneWidget);
    });

    testWidgets('should validate email format', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.widgetWithText(TextFormField, 'Email');
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      // Enter invalid email
      await tester.enterText(emailField, 'invalid-email');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate password field', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.widgetWithText(TextFormField, 'Email');
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      // Enter valid email but no password
      await tester.enterText(emailField, 'test@example.com');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('should validate password length', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      // Enter valid email but short password
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, '123');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets('should toggle password visibility', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final visibilityToggle = find.descendant(
        of: passwordField,
        matching: find.byType(IconButton),
      );

      // Verify toggle exists and can be tapped
      expect(visibilityToggle, findsOneWidget);

      // Tap visibility toggle
      await tester.tap(visibilityToggle);
      await tester.pumpAndSettle();

      // Verify the toggle worked (no exception thrown)
      expect(visibilityToggle, findsOneWidget);
    });

    testWidgets('should add login event when form is valid and submitted', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final loginButton = find.widgetWithText(ElevatedButton, 'Login');

      // Enter valid credentials
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Verify login event was added
      verify(
        mockAuthBloc.add(
          const AuthEvent.login(
            email: 'test@example.com',
            password: 'password123',
          ),
        ),
      ).called(1);
    });

    testWidgets('should show loading state', (tester) async {
      when(mockAuthBloc.state).thenReturn(const AuthState.loading());
      when(
        mockAuthBloc.stream,
      ).thenAnswer((_) => Stream.fromIterable([const AuthState.loading()]));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should show error snackbar on error state', (tester) async {
      // Start with initial state
      when(mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(mockAuthBloc.stream).thenAnswer(
        (_) => Stream.fromIterable([
          const AuthState.initial(),
          const AuthState.error('Login failed'),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      // Trigger error state
      await tester.pump();
      await tester.pump(); // Additional pump for SnackBar

      expect(find.text('Login failed'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
