import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';

/// Cart entity representing a user's shopping cart
class Cart extends Equatable {
  final String userId;
  final List<CartItem> items;
  final DateTime updatedAt;

  const Cart({
    required this.userId,
    required this.items,
    required this.updatedAt,
  });

  /// Get the total number of items in the cart
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  /// Get the total price of all items in the cart
  double get totalPrice => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Check if the cart is empty
  bool get isEmpty => items.isEmpty;

  /// Check if the cart is not empty
  bool get isNotEmpty => items.isNotEmpty;

  /// Get a specific cart item by product ID
  CartItem? getItemByProductId(int productId) {
    try {
      return items.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }

  /// Check if a product is already in the cart
  bool containsProduct(int productId) {
    return items.any((item) => item.product.id == productId);
  }

  /// Get the quantity of a specific product in the cart
  int getProductQuantity(int productId) {
    final item = getItemByProductId(productId);
    return item?.quantity ?? 0;
  }

  /// Copy with method for creating modified instances
  Cart copyWith({
    String? userId,
    List<CartItem>? items,
    DateTime? updatedAt,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      items: items ?? this.items,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [userId, items, updatedAt];
}
