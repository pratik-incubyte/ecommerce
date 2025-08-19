import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';

part 'checkout_event.freezed.dart';

/// Events for checkout bloc
@freezed
class CheckoutEvent with _$CheckoutEvent {
  /// Calculate checkout totals
  const factory CheckoutEvent.calculateCheckout({
    required String userId,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
    String? promoCode,
  }) = _CalculateCheckout;

  /// Update shipping address
  const factory CheckoutEvent.updateShippingAddress({
    required Map<String, dynamic> address,
  }) = _UpdateShippingAddress;

  /// Update billing address
  const factory CheckoutEvent.updateBillingAddress({
    required Map<String, dynamic> address,
  }) = _UpdateBillingAddress;

  /// Update payment method
  const factory CheckoutEvent.updatePaymentMethod({
    required String paymentMethod,
  }) = _UpdatePaymentMethod;

  /// Update shipping method
  const factory CheckoutEvent.updateShippingMethod({
    required String userId,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
    String? promoCode,
  }) = _UpdateShippingMethod;

  /// Apply promo code
  const factory CheckoutEvent.applyPromoCode({
    required String userId,
    required String promoCode,
    required double subtotal,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
  }) = _ApplyPromoCode;

  /// Remove promo code
  const factory CheckoutEvent.removePromoCode({
    required String userId,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
  }) = _RemovePromoCode;

  /// Validate address
  const factory CheckoutEvent.validateAddress({
    required Map<String, dynamic> address,
  }) = _ValidateAddress;

  /// Get shipping methods
  const factory CheckoutEvent.getShippingMethods({
    required Map<String, dynamic> address,
    required double weight,
  }) = _GetShippingMethods;

  /// Process payment
  const factory CheckoutEvent.processPayment({
    required String paymentMethod,
    required double amount,
    required Map<String, dynamic> paymentDetails,
  }) = _ProcessPayment;

  /// Complete checkout
  const factory CheckoutEvent.completeCheckout({
    required Checkout checkout,
    required Map<String, dynamic> paymentResult,
  }) = _CompleteCheckout;

  /// Reset checkout
  const factory CheckoutEvent.resetCheckout() = _ResetCheckout;
}
