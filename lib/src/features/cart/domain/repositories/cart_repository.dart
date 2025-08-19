import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

abstract class CartRepository {
  /// Add a product to the user's cart
  Future<Either<Failure, CartItem>> addToCart({
    required String userId,
    required Product product,
    required int quantity,
    Map<String, dynamic>? selectedVariants,
  });

  /// Get all cart items for a specific user
  Future<Either<Failure, Cart>> getCart(String userId);

  /// Update the quantity of a cart item
  Future<Either<Failure, CartItem>> updateCartItemQuantity({
    required String userId,
    required int productId,
    required int quantity,
  });

  /// Remove an item from the cart
  Future<Either<Failure, void>> removeFromCart({
    required String userId,
    required int productId,
  });

  /// Clear all items from the cart
  Future<Either<Failure, void>> clearCart(String userId);

  /// Get the total number of items in the cart
  Future<Either<Failure, int>> getCartItemCount(String userId);
}
