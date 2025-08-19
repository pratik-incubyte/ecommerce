import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  
  const factory CartState.loading() = _Loading;
  
  const factory CartState.loaded({
    required Cart cart,
    @Default(0) int itemCount,
  }) = _Loaded;
  
  const factory CartState.addingToCart() = _AddingToCart;
  
  const factory CartState.addedToCart({
    required CartItem cartItem,
    required Cart updatedCart,
  }) = _AddedToCart;
  
  const factory CartState.updatingCart() = _UpdatingCart;
  
  const factory CartState.updatedCart({
    required Cart updatedCart,
  }) = _UpdatedCart;
  
  const factory CartState.removingFromCart() = _RemovingFromCart;
  
  const factory CartState.removedFromCart({
    required Cart updatedCart,
  }) = _RemovedFromCart;
  
  const factory CartState.clearingCart() = _ClearingCart;
  
  const factory CartState.clearedCart() = _ClearedCart;
  
  const factory CartState.error({
    required String message,
    Cart? cart,
  }) = _Error;
}
