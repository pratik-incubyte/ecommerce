import 'dart:convert';
import 'package:ecommerce/src/features/orders/domain/entities/order_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

/// Order item model for data layer
class OrderItemModel extends OrderItem {
  const OrderItemModel({
    super.id,
    required super.orderId,
    required super.product,
    required super.quantity,
    required super.productPrice,
    super.selectedVariants,
  });

  /// Convert from JSON map
  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'] is String ? int.tryParse(json['id']) : json['id'],
      orderId: json['orderId'] is String
          ? int.tryParse(json['orderId']) ?? 0
          : json['orderId'] ?? 0,
      product: ProductModel.fromJson(json['product'] ?? {}),
      quantity: json['quantity'] is String
          ? int.tryParse(json['quantity']) ?? 1
          : json['quantity'] ?? 1,
      productPrice: (json['productPrice'] ?? 0.0).toDouble(),
      selectedVariants: json['selectedVariants'],
    );
  }

  /// Convert from database row
  factory OrderItemModel.fromDatabaseRow(
    Map<String, dynamic> row,
    Product product,
  ) {
    return OrderItemModel(
      id: row['id'],
      orderId: row['orderId'] ?? 0,
      product: product,
      quantity: row['quantity'] ?? 1,
      productPrice: (row['productPrice'] ?? 0.0).toDouble(),
      selectedVariants: row['selectedVariants'] != null
          ? jsonDecode(row['selectedVariants'])
          : null,
    );
  }

  /// Convert to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'orderId': orderId,
      'product': (product as ProductModel).toJson(),
      'quantity': quantity,
      'productPrice': productPrice,
      'selectedVariants': selectedVariants,
    };
  }

  /// Convert to database row
  Map<String, dynamic> toDatabaseRow() {
    return {
      'id': id,
      'orderId': orderId,
      'productId': product.id,
      'productServerId': product.id.toString(),
      'productName': product.title,
      'quantity': quantity,
      'productPrice': productPrice,
      'selectedVariants': selectedVariants != null
          ? jsonEncode(selectedVariants)
          : null,
    };
  }

  /// Create from entity
  factory OrderItemModel.fromEntity(OrderItem orderItem) {
    return OrderItemModel(
      id: orderItem.id,
      orderId: orderItem.orderId,
      product: orderItem.product,
      quantity: orderItem.quantity,
      productPrice: orderItem.productPrice,
      selectedVariants: orderItem.selectedVariants,
    );
  }

  /// Convert to entity
  OrderItem toEntity() {
    return OrderItem(
      id: id,
      orderId: orderId,
      product: product,
      quantity: quantity,
      productPrice: productPrice,
      selectedVariants: selectedVariants,
    );
  }

  /// Copy with method for creating modified instances
  @override
  OrderItemModel copyWith({
    int? id,
    int? orderId,
    Product? product,
    int? quantity,
    double? productPrice,
    Map<String, dynamic>? selectedVariants,
  }) {
    return OrderItemModel(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      productPrice: productPrice ?? this.productPrice,
      selectedVariants: selectedVariants ?? this.selectedVariants,
    );
  }
}
