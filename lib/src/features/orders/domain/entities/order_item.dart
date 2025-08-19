import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

/// Order item entity representing an individual item in an order
class OrderItem extends Equatable {
  final int? id;
  final String orderId;
  final Product product;
  final int quantity;
  final double productPrice;
  final Map<String, dynamic>? selectedVariants;

  const OrderItem({
    this.id,
    required this.orderId,
    required this.product,
    required this.quantity,
    required this.productPrice,
    this.selectedVariants,
  });

  /// Get the total price for this order item (price * quantity)
  double get totalPrice => productPrice * quantity;

  /// Copy with method for creating modified instances
  OrderItem copyWith({
    int? id,
    String? orderId,
    Product? product,
    int? quantity,
    double? productPrice,
    Map<String, dynamic>? selectedVariants,
  }) {
    return OrderItem(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      productPrice: productPrice ?? this.productPrice,
      selectedVariants: selectedVariants ?? this.selectedVariants,
    );
  }

  @override
  List<Object?> get props => [
    id,
    orderId,
    product,
    quantity,
    productPrice,
    selectedVariants,
  ];
}
