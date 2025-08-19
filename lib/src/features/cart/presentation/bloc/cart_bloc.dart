import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/get_cart_item_count_usecase.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:ecommerce/src/features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'cart_event.dart';
import 'cart_state.dart';

export 'cart_event.dart';
export 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final ClearCartUseCase clearCartUseCase;
  final GetCartItemCountUseCase getCartItemCountUseCase;

  CartBloc({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.updateCartItemUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
    required this.getCartItemCountUseCase,
  }) : super(const CartState.initial()) {
    on<CartEvent>((event, emit) async {
      await event.when(
        loadCart: (userId) => _onLoadCart(userId, emit),
        addToCart: (userId, product, quantity, selectedVariants) =>
            _onAddToCart(userId, product, quantity, selectedVariants, emit),
        updateQuantity: (userId, productId, quantity) =>
            _onUpdateQuantity(userId, productId, quantity, emit),
        removeFromCart: (userId, productId) =>
            _onRemoveFromCart(userId, productId, emit),
        clearCart: (userId) => _onClearCart(userId, emit),
        getCartItemCount: (userId) => _onGetCartItemCount(userId, emit),
      );
    });
  }

  Future<void> _onLoadCart(String userId, Emitter<CartState> emit) async {
    emit(const CartState.loading());

    final result = await getCartItemsUseCase(
      GetCartItemsParams(userId: userId),
    );

    result.fold(
      (failure) => emit(CartState.error(message: failure.message)),
      (cart) => emit(CartState.loaded(cart: cart, itemCount: cart.totalItems)),
    );
  }

  Future<void> _onAddToCart(
    String userId,
    dynamic product,
    int quantity,
    Map<String, dynamic>? selectedVariants,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.addingToCart());

    final result = await addToCartUseCase(
      AddToCartParams(
        userId: userId,
        product: product,
        quantity: quantity,
        selectedVariants: selectedVariants,
      ),
    );

    await result.fold(
      (failure) async => emit(CartState.error(message: failure.message)),
      (cartItem) async {
        // Load the updated cart
        final cartResult = await getCartItemsUseCase(
          GetCartItemsParams(userId: userId),
        );

        cartResult.fold(
          (failure) => emit(CartState.error(message: failure.message)),
          (updatedCart) => emit(
            CartState.addedToCart(cartItem: cartItem, updatedCart: updatedCart),
          ),
        );
      },
    );
  }

  Future<void> _onUpdateQuantity(
    String userId,
    int productId,
    int quantity,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.updatingCart());

    final result = await updateCartItemUseCase(
      UpdateCartItemParams(
        userId: userId,
        productId: productId,
        quantity: quantity,
      ),
    );

    await result.fold(
      (failure) async => emit(CartState.error(message: failure.message)),
      (cartItem) async {
        // Load the updated cart
        final cartResult = await getCartItemsUseCase(
          GetCartItemsParams(userId: userId),
        );

        cartResult.fold(
          (failure) => emit(CartState.error(message: failure.message)),
          (updatedCart) =>
              emit(CartState.updatedCart(updatedCart: updatedCart)),
        );
      },
    );
  }

  Future<void> _onRemoveFromCart(
    String userId,
    int productId,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.removingFromCart());

    final result = await removeFromCartUseCase(
      RemoveFromCartParams(userId: userId, productId: productId),
    );

    await result.fold(
      (failure) async => emit(CartState.error(message: failure.message)),
      (_) async {
        // Load the updated cart
        final cartResult = await getCartItemsUseCase(
          GetCartItemsParams(userId: userId),
        );

        cartResult.fold(
          (failure) => emit(CartState.error(message: failure.message)),
          (updatedCart) =>
              emit(CartState.removedFromCart(updatedCart: updatedCart)),
        );
      },
    );
  }

  Future<void> _onClearCart(String userId, Emitter<CartState> emit) async {
    emit(const CartState.clearingCart());

    final result = await clearCartUseCase(ClearCartParams(userId: userId));

    await result.fold(
      (failure) async => emit(CartState.error(message: failure.message)),
      (_) async {
        // Show cleared message momentarily
        emit(const CartState.clearedCart());

        // Then reload the cart to show the empty state
        final cartResult = await getCartItemsUseCase(
          GetCartItemsParams(userId: userId),
        );

        cartResult.fold(
          (failure) => emit(CartState.error(message: failure.message)),
          (updatedCart) => emit(
            CartState.loaded(
              cart: updatedCart,
              itemCount: updatedCart.totalItems,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onGetCartItemCount(
    String userId,
    Emitter<CartState> emit,
  ) async {
    final result = await getCartItemCountUseCase(
      GetCartItemCountParams(userId: userId),
    );

    final currentState = state;
    result.fold(
      (failure) => emit(
        CartState.error(
          message: failure.message,
          cart: currentState.whenOrNull(loaded: (cart, _) => cart),
        ),
      ),
      (count) {
        currentState.whenOrNull(
          loaded: (cart, _) =>
              emit(CartState.loaded(cart: cart, itemCount: count)),
        );
      },
    );
  }
}
