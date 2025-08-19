import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

/// Cart item entity representing a product in the user's cart
class CartItem extends Equatable {
  final int? id;
  final String userId;
  final Product product;
  final int quantity;
  final Map<String, dynamic>? selectedVariants;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CartItem({
    this.id,
    required this.userId,
    required this.product,
    required this.quantity,
    this.selectedVariants,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Get the total price for this cart item (price * quantity)
  double get totalPrice => product.price * quantity;

  /// Copy with method for creating modified instances
  CartItem copyWith({
    int? id,
    String? userId,
    Product? product,
    int? quantity,
    Map<String, dynamic>? selectedVariants,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartItem(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedVariants: selectedVariants ?? this.selectedVariants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        product,
        quantity,
        selectedVariants,
        createdAt,
        updatedAt,
      ];
}
