import 'package:flutter/material.dart';
import '../error/failures.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIconForFailure(failure),
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              _getTitleForFailure(failure),
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              failure.message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIconForFailure(Failure failure) {
    if (failure is NetworkFailure) {
      return Icons.wifi_off;
    } else if (failure is ServerFailure) {
      return Icons.cloud_off;
    } else if (failure is NotFoundFailure) {
      return Icons.search_off;
    } else if (failure is AuthenticationFailure) {
      return Icons.lock_outline;
    } else {
      return Icons.error_outline;
    }
  }

  String _getTitleForFailure(Failure failure) {
    if (failure is NetworkFailure) {
      return 'No Internet Connection';
    } else if (failure is ServerFailure) {
      return 'Server Error';
    } else if (failure is NotFoundFailure) {
      return 'Not Found';
    } else if (failure is AuthenticationFailure) {
      return 'Authentication Error';
    } else {
      return 'Something went wrong';
    }
  }
}