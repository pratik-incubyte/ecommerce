import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/features/checkout/domain/usecases/calculate_checkout_usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/usecases/process_payment_usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/usecases/complete_checkout_usecase.dart';
import 'package:ecommerce/src/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/clear_cart_usecase.dart';
import '../../../../core/notifications/domain/usecases/send_order_notification.dart';
import 'checkout_event.dart';
import 'checkout_state.dart';

export 'checkout_event.dart';
export 'checkout_state.dart';

/// BLoC for managing checkout flow
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CalculateCheckoutUseCase calculateCheckoutUseCase;
  final ProcessPaymentUseCase processPaymentUseCase;
  final CompleteCheckoutUseCase completeCheckoutUseCase;
  final CheckoutRepository checkoutRepository;
  final SendOrderNotification sendOrderNotification;
  final ClearCartUseCase clearCartUseCase;

  CheckoutBloc({
    required this.calculateCheckoutUseCase,
    required this.processPaymentUseCase,
    required this.completeCheckoutUseCase,
    required this.checkoutRepository,
    required this.sendOrderNotification,
    required this.clearCartUseCase,
  }) : super(const CheckoutState.initial()) {
    on<CheckoutEvent>((event, emit) async {
      await event.when(
        calculateCheckout:
            (userId, shippingMethod, shippingAddress, promoCode) =>
                _onCalculateCheckout(
                  userId,
                  shippingMethod,
                  shippingAddress,
                  promoCode,
                  emit,
                ),
        updateShippingAddress: (address) =>
            _onUpdateShippingAddress(address, emit),
        updateBillingAddress: (address) =>
            _onUpdateBillingAddress(address, emit),
        updatePaymentMethod: (paymentMethod) =>
            _onUpdatePaymentMethod(paymentMethod, emit),
        updateShippingMethod:
            (userId, shippingMethod, shippingAddress, promoCode) =>
                _onUpdateShippingMethod(
                  userId,
                  shippingMethod,
                  shippingAddress,
                  promoCode,
                  emit,
                ),
        applyPromoCode:
            (userId, promoCode, subtotal, shippingMethod, shippingAddress) =>
                _onApplyPromoCode(
                  userId,
                  promoCode,
                  subtotal,
                  shippingMethod,
                  shippingAddress,
                  emit,
                ),
        removePromoCode: (userId, shippingMethod, shippingAddress) =>
            _onRemovePromoCode(userId, shippingMethod, shippingAddress, emit),
        validateAddress: (address) => _onValidateAddress(address, emit),
        getShippingMethods: (address, weight) =>
            _onGetShippingMethods(address, weight, emit),
        processPayment: (paymentMethod, amount, paymentDetails) =>
            _onProcessPayment(paymentMethod, amount, paymentDetails, emit),
        completeCheckout: (checkout, paymentResult) =>
            _onCompleteCheckout(checkout, paymentResult, emit),
        resetCheckout: () => _onResetCheckout(emit),
      );
    });
  }

  Future<void> _onCalculateCheckout(
    String userId,
    String shippingMethod,
    Map<String, dynamic> shippingAddress,
    String? promoCode,
    Emitter<CheckoutState> emit,
  ) async {
    // print('CheckoutBloc - _onCalculateCheckout called');
    // print('  userId: $userId');
    // print('  shippingMethod: $shippingMethod');
    // print('  shippingAddress: $shippingAddress');
    // print('  promoCode: $promoCode');

    emit(const CheckoutState.calculating());

    final result = await calculateCheckoutUseCase(
      CalculateCheckoutParams(
        userId: userId,
        shippingMethod: shippingMethod,
        shippingAddress: shippingAddress,
        promoCode: promoCode,
      ),
    );

    result.fold(
      (failure) {
        // print('CheckoutBloc - Calculation failed: ${failure.message}');
        emit(CheckoutState.error(message: failure.message));
      },
      (checkout) {
        // print('CheckoutBloc - Calculation successful: ${checkout.toString()}');
        emit(CheckoutState.calculated(checkout: checkout));
      },
    );
  }

  Future<void> _onUpdateShippingAddress(
    Map<String, dynamic> address,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    if (currentCheckout != null) {
      final updatedCheckout = currentCheckout.copyWith(
        shippingAddress: address,
        billingAddress: address, // Update billing to match by default
      );
      emit(CheckoutState.calculated(checkout: updatedCheckout));
    } else {
      emit(const CheckoutState.error(message: 'No checkout session to update'));
    }
  }

  Future<void> _onUpdateBillingAddress(
    Map<String, dynamic> address,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    if (currentCheckout != null) {
      final updatedCheckout = currentCheckout.copyWith(billingAddress: address);
      emit(CheckoutState.calculated(checkout: updatedCheckout));
    } else {
      emit(const CheckoutState.error(message: 'No checkout session to update'));
    }
  }

  Future<void> _onUpdatePaymentMethod(
    String paymentMethod,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    if (currentCheckout != null) {
      final updatedCheckout = currentCheckout.copyWith(
        paymentMethod: paymentMethod,
      );
      emit(CheckoutState.calculated(checkout: updatedCheckout));
    } else {
      emit(const CheckoutState.error(message: 'No checkout session to update'));
    }
  }

  Future<void> _onUpdateShippingMethod(
    String userId,
    String shippingMethod,
    Map<String, dynamic> shippingAddress,
    String? promoCode,
    Emitter<CheckoutState> emit,
  ) async {
    // Recalculate checkout with new shipping method
    await _onCalculateCheckout(
      userId,
      shippingMethod,
      shippingAddress,
      promoCode,
      emit,
    );
  }

  Future<void> _onApplyPromoCode(
    String userId,
    String promoCode,
    double subtotal,
    String shippingMethod,
    Map<String, dynamic> shippingAddress,
    Emitter<CheckoutState> emit,
  ) async {
    final promoResult = await checkoutRepository.applyPromoCode(
      promoCode: promoCode,
      subtotal: subtotal,
    );

    await promoResult.fold(
      (failure) async => emit(CheckoutState.error(message: failure.message)),
      (result) async {
        if (result['isValid'] == true) {
          // Recalculate checkout with promo code
          await _onCalculateCheckout(
            userId,
            shippingMethod,
            shippingAddress,
            promoCode,
            emit,
          );
        } else {
          emit(const CheckoutState.error(message: 'Invalid promo code'));
        }
      },
    );
  }

  Future<void> _onRemovePromoCode(
    String userId,
    String shippingMethod,
    Map<String, dynamic> shippingAddress,
    Emitter<CheckoutState> emit,
  ) async {
    // Recalculate checkout without promo code
    await _onCalculateCheckout(
      userId,
      shippingMethod,
      shippingAddress,
      null,
      emit,
    );
  }

  Future<void> _onValidateAddress(
    Map<String, dynamic> address,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    final result = await checkoutRepository.validateAddress(address: address);

    result.fold(
      (failure) => emit(
        CheckoutState.error(
          message: failure.message,
          checkout: currentCheckout,
        ),
      ),
      (isValid) => emit(
        CheckoutState.addressValidated(
          isValid: isValid,
          address: address,
          checkout: currentCheckout,
        ),
      ),
    );
  }

  Future<void> _onGetShippingMethods(
    Map<String, dynamic> address,
    double weight,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    final result = await checkoutRepository.getShippingMethods(
      address: address,
      weight: weight,
    );

    result.fold(
      (failure) => emit(
        CheckoutState.error(
          message: failure.message,
          checkout: currentCheckout,
        ),
      ),
      (shippingMethods) => emit(
        CheckoutState.shippingMethodsLoaded(
          shippingMethods: shippingMethods,
          checkout: currentCheckout,
        ),
      ),
    );
  }

  Future<void> _onProcessPayment(
    String paymentMethod,
    double amount,
    Map<String, dynamic> paymentDetails,
    Emitter<CheckoutState> emit,
  ) async {
    final currentState = state;
    final currentCheckout = currentState.whenOrNull(
      calculated: (checkout, _) => checkout,
      promoCodeApplied: (_, checkout) => checkout,
      promoCodeRemoved: (checkout) => checkout,
      error: (_, checkout) => checkout,
    );

    if (currentCheckout == null) {
      emit(const CheckoutState.error(message: 'No checkout session available'));
      return;
    }

    emit(CheckoutState.processingPayment(checkout: currentCheckout));

    final result = await processPaymentUseCase(
      ProcessPaymentParams(
        paymentMethod: paymentMethod,
        amount: amount,
        paymentDetails: paymentDetails,
      ),
    );

    result.fold(
      (failure) => emit(
        CheckoutState.error(
          message: failure.message,
          checkout: currentCheckout,
        ),
      ),
      (paymentResult) => emit(
        CheckoutState.paymentProcessed(
          paymentResult: paymentResult,
          checkout: currentCheckout,
        ),
      ),
    );
  }

  Future<void> _onCompleteCheckout(
    checkout,
    Map<String, dynamic> paymentResult,
    Emitter<CheckoutState> emit,
  ) async {
    emit(
      CheckoutState.completingCheckout(
        checkout: checkout,
        paymentResult: paymentResult,
      ),
    );

    final result = await completeCheckoutUseCase(
      CompleteCheckoutParams(checkout: checkout, paymentResult: paymentResult),
    );

    await result.fold(
      (failure) async {
        emit(CheckoutState.error(message: failure.message, checkout: checkout));
      },
      (order) async {
        // Clear the user's cart after successful order completion
        try {
          final clearCartResult = await clearCartUseCase(
            ClearCartParams(userId: checkout.userId),
          );
          
          clearCartResult.fold(
            (failure) => print('Cart clearing failed: ${failure.message}'),
            (_) => print('Cart cleared successfully after order completion'),
          );
        } catch (e) {
          // Log cart clearing error but don't fail checkout
          print('Error clearing cart after order completion: $e');
        }
        
        // Send order confirmation notification (don't fail checkout if notification fails)
        try {
          final notificationResult = await sendOrderNotification(
            SendOrderNotificationParams(
              userId: checkout.userId,
              orderId: order.id!,
              orderTotal: order.totalAmount.toStringAsFixed(2),
            ),
          );
          
          // Log notification result but don't fail checkout
          notificationResult.fold(
            (failure) => print('Notification sending failed: ${failure.message}'),
            (_) => print('Order notification sent successfully'),
          );
        } catch (e) {
          // Log notification error but don't fail checkout
          print('Error sending order notification: $e');
        }
        
        // Check if emit is still valid before calling
        if (!emit.isDone) {
          emit(CheckoutState.checkoutCompleted(order: order));
        }
      },
    );
  }

  Future<void> _onResetCheckout(Emitter<CheckoutState> emit) async {
    emit(const CheckoutState.initial());
  }
}
