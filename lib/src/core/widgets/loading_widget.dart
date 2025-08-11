import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Widget for displaying loading states
class AppLoadingWidget extends StatelessWidget {
  final String? message;
  final double? size;
  
  const AppLoadingWidget({
    Key? key,
    this.message,
    this.size,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size ?? 40,
            height: size ?? 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Overlay loading widget that covers the entire screen
class OverlayLoadingWidget extends StatelessWidget {
  final String? message;
  final bool isVisible;
  final Widget child;
  
  const OverlayLoadingWidget({
    Key? key,
    required this.child,
    this.message,
    this.isVisible = false,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isVisible)
          Container(
            color: Colors.black54,
            child: AppLoadingWidget(message: message),
          ),
      ],
    );
  }
}

/// Linear progress indicator widget
class AppLinearProgressIndicator extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Color? valueColor;
  
  const AppLinearProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.valueColor,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surfaceVariant,
      valueColor: AlwaysStoppedAnimation<Color>(
        valueColor ?? Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
