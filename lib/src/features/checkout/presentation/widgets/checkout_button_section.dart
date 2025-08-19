import 'package:flutter/material.dart';
import 'package:ecommerce/src/features/checkout/presentation/bloc/checkout_bloc.dart';

/// Enhanced widget for the checkout button with proper state handling
class CheckoutButtonSection extends StatefulWidget {
  final CheckoutState state;
  final GlobalKey<FormState> formKey;
  final VoidCallback onCheckout;
  final bool? forceEnable;
  final String? buttonText;

  const CheckoutButtonSection({
    Key? key,
    required this.state,
    required this.formKey,
    required this.onCheckout,
    this.forceEnable,
    this.buttonText,
  }) : super(key: key);

  @override
  State<CheckoutButtonSection> createState() => _CheckoutButtonSectionState();
}

class _CheckoutButtonSectionState extends State<CheckoutButtonSection> {
  bool _wasCompleted = false;

  @override
  void didUpdateWidget(CheckoutButtonSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // Check if we've transitioned to completed state
    final wasCompleted = oldWidget.state.maybeWhen(
      checkoutCompleted: (_) => true,
      orElse: () => false,
    );
    
    final isCompleted = widget.state.maybeWhen(
      checkoutCompleted: (_) => true,
      orElse: () => false,
    );
    
    if (!wasCompleted && isCompleted) {
      setState(() {
        _wasCompleted = true;
      });
      debugPrint('CheckoutButtonSection - Detected completion transition');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = _isButtonEnabled();
    final isLoading = _isButtonLoading();
    
    // Debug logging to track state changes
    debugPrint('CheckoutButtonSection - State: ${widget.state.toString()}');
    debugPrint('CheckoutButtonSection - isEnabled: $isEnabled, isLoading: $isLoading');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: (isEnabled && !isLoading) ? _handleCheckout : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          elevation: isEnabled && !isLoading ? 4 : 0,
          shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: _getButtonColor(context, isEnabled, isLoading),
          foregroundColor: _getTextColor(context, isEnabled, isLoading),
        ),
        child: SizedBox(
          height: 24,
          child: isLoading
              ? _buildLoadingWidget(context)
              : _buildButtonContent(context, isEnabled),
        ),
      ),
    );
  }

  Color _getButtonColor(BuildContext context, bool isEnabled, bool isLoading) {
    if (isLoading) {
      return Theme.of(context).primaryColor.withOpacity(0.8);
    }
    if (!isEnabled) {
      return Theme.of(context).disabledColor;
    }
    return Theme.of(context).primaryColor;
  }

  Color _getTextColor(BuildContext context, bool isEnabled, bool isLoading) {
    if (!isEnabled && !isLoading) {
      return Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
    }
    return Theme.of(context).colorScheme.onPrimary;
  }

  bool _isButtonEnabled() {
    // If forceEnable is explicitly set, use that
    if (widget.forceEnable != null) {
      return widget.forceEnable!;
    }

    // Check state-based enabling
    return widget.state.maybeWhen(
      calculated: (_, __) => true,
      promoCodeApplied: (_, __) => true,
      promoCodeRemoved: (_) => true,
      error: (_, __) => true, // Allow retry on error
      orElse: () => false,
    );
  }

  bool _isButtonLoading() {
    return widget.state.maybeWhen(
      calculating: () => true,
      processingPayment: (_) => true,
      completingCheckout: (_, __) => true,
      checkoutCompleted: (_) => false, // Explicitly stop loading when completed
      orElse: () => false,
    );
  }

  void _handleCheckout() {
    try {
      // Validate form before processing
      final isFormValid = widget.formKey.currentState?.validate() ?? false;

      if (isFormValid) {
        widget.onCheckout();
      } else {
        // Form validation failed - the form will show the errors
        debugPrint('CheckoutButton: Form validation failed');
      }
    } catch (e) {
      debugPrint('CheckoutButton: Error during checkout - $e');
      // Could show a snackbar here if needed
    }
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            _getLoadingText(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonContent(BuildContext context, bool isEnabled) {
    final totalAmount = _getTotalAmount();
    final displayText = _getButtonText(totalAmount);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            displayText,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: _getTextColor(context, isEnabled, false),
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  IconData _getButtonIcon(bool isEnabled) {
    if (!isEnabled) {
      return Icons.lock_outline;
    }

    return widget.state.maybeWhen(
      calculated: (_, __) => Icons.security,
      promoCodeApplied: (_, __) => Icons.security,
      promoCodeRemoved: (_) => Icons.security,
      error: (_, __) => Icons.refresh,
      orElse: () => Icons.lock_outline,
    );
  }

  String _getButtonText(double? totalAmount) {
    // Use custom button text if provided
    if (widget.buttonText != null) {
      return widget.buttonText!;
    }

    // Handle error state
    final errorText = widget.state.maybeWhen(
      error: (message, __) => 'Retry Order',
      orElse: () => null,
    );
    if (errorText != null) {
      return errorText;
    }

    // Default text with amount
    if (totalAmount != null && totalAmount > 0) {
      return 'Place Order - \$${totalAmount.toStringAsFixed(2)}';
    }

    return 'Place Order';
  }

  String _getLoadingText() {
    return widget.state.maybeWhen(
      calculating: () => 'Calculating...',
      processingPayment: (_) => 'Processing Payment...',
      completingCheckout: (_, __) => 'Completing Order...',
      orElse: () => 'Processing...',
    );
  }

  double? _getTotalAmount() {
    try {
      return widget.state.maybeWhen(
        calculated: (checkout, _) => checkout.totalAmount,
        promoCodeApplied: (_, checkout) => checkout.totalAmount,
        promoCodeRemoved: (checkout) => checkout.totalAmount,
        orElse: () => null,
      );
    } catch (e) {
      debugPrint('CheckoutButton: Error getting total amount - $e');
      return null;
    }
  }
}
