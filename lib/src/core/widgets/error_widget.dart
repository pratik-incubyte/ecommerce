import 'package:flutter/material.dart';
import '../error/failures.dart';
import '../constants/app_constants.dart';

/// Widget for displaying error states
class AppErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final String? customMessage;
  
  const AppErrorWidget({
    Key? key,
    required this.failure,
    this.onRetry,
    this.customMessage,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getErrorIcon(),
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              customMessage ?? failure.message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppConstants.defaultPadding),
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
  
  IconData _getErrorIcon() {
    if (failure is NetworkFailure) {
      return Icons.wifi_off;
    } else if (failure is ServerFailure) {
      return Icons.cloud_off;
    } else if (failure is AuthFailure) {
      return Icons.lock;
    } else if (failure is ValidationFailure) {
      return Icons.error_outline;
    } else {
      return Icons.error;
    }
  }
}

/// Widget for displaying simple error messages
class SimpleErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  
  const SimpleErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.error,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(width: AppConstants.smallPadding),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(width: AppConstants.smallPadding),
            IconButton(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ],
      ),
    );
  }
}
