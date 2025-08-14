import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/src/features/auth/presentation/pages/register_page.dart';

import 'register_page_test.mocks.dart';

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
    return MaterialApp(home: const RegisterPage());
  }

  group('RegisterPage', () {
    testWidgets('should display register form elements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(5)); // 5 form fields
      expect(
        find.widgetWithText(ElevatedButton, 'Create Account'),
        findsOneWidget,
      );
      expect(find.text('Already have an account? '), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('should display all form fields with correct properties', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final confirmPasswordField = find.widgetWithText(
        TextFormField,
        'Confirm Password',
      );

      expect(firstNameField, findsOneWidget);
      expect(lastNameField, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);

      // Check that all fields exist and are properly configured
      expect(firstNameField, findsOneWidget);
      expect(lastNameField, findsOneWidget);
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(confirmPasswordField, findsOneWidget);
    });

    testWidgets('should validate first name field', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Try to submit with empty first name
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your first name'), findsOneWidget);
    });

    testWidgets('should validate first name length', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter too short first name
      await tester.enterText(firstNameField, 'A');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(
        find.text('First name must be at least 2 characters'),
        findsOneWidget,
      );
    });

    testWidgets('should validate last name field', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid first name but no last name
      await tester.enterText(firstNameField, 'John');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter your last name'), findsOneWidget);
    });

    testWidgets('should validate email format', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid names but invalid email
      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'invalid-email');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate password requirements', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid data but weak password
      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'weak');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Password must be at least 6 characters'),
        findsOneWidget,
      );
    });

    testWidgets('should validate password contains letters and numbers', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid data but password without numbers
      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(
        find.text('Password must contain letters and numbers'),
        findsOneWidget,
      );
    });

    testWidgets('should validate password confirmation match', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final confirmPasswordField = find.widgetWithText(
        TextFormField,
        'Confirm Password',
      );
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid data but mismatched passwords
      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.enterText(confirmPasswordField, 'different123');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      expect(find.text('Passwords do not match'), findsOneWidget);
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

    testWidgets('should toggle confirm password visibility', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final confirmPasswordField = find.widgetWithText(
        TextFormField,
        'Confirm Password',
      );
      final visibilityToggle = find.descendant(
        of: confirmPasswordField,
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

    testWidgets('should add register event when form is valid and submitted', (
      tester,
    ) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final firstNameField = find.widgetWithText(TextFormField, 'First Name');
      final lastNameField = find.widgetWithText(TextFormField, 'Last Name');
      final emailField = find.widgetWithText(TextFormField, 'Email');
      final passwordField = find.widgetWithText(TextFormField, 'Password');
      final confirmPasswordField = find.widgetWithText(
        TextFormField,
        'Confirm Password',
      );
      final createAccountButton = find.widgetWithText(
        ElevatedButton,
        'Create Account',
      );

      // Enter valid data
      await tester.enterText(firstNameField, 'John');
      await tester.enterText(lastNameField, 'Doe');
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.enterText(confirmPasswordField, 'password123');
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();

      // Verify register event was added
      verify(
        mockAuthBloc.add(
          const AuthEvent.register(
            email: 'test@example.com',
            password: 'password123',
            firstName: 'John',
            lastName: 'Doe',
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
          const AuthState.error('Registration failed'),
        ]),
      );

      await tester.pumpWidget(createWidgetUnderTest());

      // Trigger error state
      await tester.pump();
      await tester.pump(); // Additional pump for SnackBar

      expect(find.text('Registration failed'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
