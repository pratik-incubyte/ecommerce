import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

part 'cart_event.freezed.dart';

@freezed
sealed class CartEvent with _$CartEvent {
  const factory CartEvent.loadCart({
    required String userId,
  }) = _LoadCart;

  const factory CartEvent.addToCart({
    required String userId,
    required Product product,
    @Default(1) int quantity,
    Map<String, dynamic>? selectedVariants,
  }) = _AddToCart;

  const factory CartEvent.updateQuantity({
    required String userId,
    required int productId,
    required int quantity,
  }) = _UpdateQuantity;

  const factory CartEvent.removeFromCart({
    required String userId,
    required int productId,
  }) = _RemoveFromCart;

  const factory CartEvent.clearCart({
    required String userId,
  }) = _ClearCart;

  const factory CartEvent.getCartItemCount({
    required String userId,
  }) = _GetCartItemCount;
}
