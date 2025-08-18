import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../di/injection_container.dart';

/// Authentication wrapper that checks user's auth status and redirects accordingly
class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(const AuthEvent.checkAuthStatus()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            authenticated: (user) {
              // User is authenticated, allow access to main app
              final location = GoRouter.of(
                context,
              ).routeInformationProvider.value.uri.path;
              if (location == '/auth') {
                // If user is on auth page, redirect to home
                GoRouter.of(context).goNamed('home');
              }
            },
            unauthenticated: () {
              // User is not authenticated, redirect to auth page
              final location = GoRouter.of(
                context,
              ).routeInformationProvider.value.uri.path;
              if (location != '/auth') {
                GoRouter.of(context).goNamed('auth');
              }
            },
            error: (message) {
              // Show error and redirect to login
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
              GoRouter.of(context).goNamed('auth');
            },
          );
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.when(
              initial: () => _buildLoadingScreen(),
              loading: () => _buildLoadingScreen(),
              authenticated: (user) => child,
              unauthenticated: () => child,
              error: (message) => child,
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Checking authentication...', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
