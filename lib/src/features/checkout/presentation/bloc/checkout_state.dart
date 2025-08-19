import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';

part 'checkout_state.freezed.dart';

/// States for checkout bloc
@freezed
class CheckoutState with _$CheckoutState {
  /// Initial state
  const factory CheckoutState.initial() = _Initial;

  /// Loading calculation
  const factory CheckoutState.calculating() = _Calculating;

  /// Checkout calculated successfully
  const factory CheckoutState.calculated({
    required Checkout checkout,
    List<Map<String, dynamic>>? availableShippingMethods,
  }) = _Calculated;

  /// Shipping methods loaded
  const factory CheckoutState.shippingMethodsLoaded({
    required List<Map<String, dynamic>> shippingMethods,
    Checkout? checkout,
  }) = _ShippingMethodsLoaded;

  /// Address validated
  const factory CheckoutState.addressValidated({
    required bool isValid,
    required Map<String, dynamic> address,
    Checkout? checkout,
  }) = _AddressValidated;

  /// Promo code applied
  const factory CheckoutState.promoCodeApplied({
    required Map<String, dynamic> promoResult,
    required Checkout checkout,
  }) = _PromoCodeApplied;

  /// Promo code removed
  const factory CheckoutState.promoCodeRemoved({required Checkout checkout}) =
      _PromoCodeRemoved;

  /// Processing payment
  const factory CheckoutState.processingPayment({required Checkout checkout}) =
      _ProcessingPayment;

  /// Payment processed successfully
  const factory CheckoutState.paymentProcessed({
    required Map<String, dynamic> paymentResult,
    required Checkout checkout,
  }) = _PaymentProcessed;

  /// Completing checkout
  const factory CheckoutState.completingCheckout({
    required Checkout checkout,
    required Map<String, dynamic> paymentResult,
  }) = _CompletingCheckout;

  /// Checkout completed successfully
  const factory CheckoutState.checkoutCompleted({required Order order}) =
      _CheckoutCompleted;

  /// Error state
  const factory CheckoutState.error({
    required String message,
    Checkout? checkout,
  }) = _Error;
}
