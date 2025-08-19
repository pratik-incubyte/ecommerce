import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    super.id,
    required super.userId,
    required super.product,
    required super.quantity,
    super.selectedVariants,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Creates a [CartItemModel] from a JSON map (for Firebase)
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    // Handle id conversion from String (Firestore doc ID) to int
    int? id;
    if (json['id'] != null) {
      if (json['id'] is int) {
        id = json['id'] as int;
      } else if (json['id'] is String) {
        id = int.tryParse(json['id'] as String);
      }
    }

    return CartItemModel(
      id: id,
      userId: json['userId'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      selectedVariants: json['selectedVariants'] != null
          ? Map<String, dynamic>.from(json['selectedVariants'] as Map)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Converts this [CartItemModel] to a JSON map (for Firebase)
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'product': (product as ProductModel).toJson(),
      'quantity': quantity,
      if (selectedVariants != null) 'selectedVariants': selectedVariants,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Creates a [CartItemModel] from a [CartItem] entity
  factory CartItemModel.fromEntity(CartItem cartItem) {
    return CartItemModel(
      id: cartItem.id,
      userId: cartItem.userId,
      product: cartItem.product,
      quantity: cartItem.quantity,
      selectedVariants: cartItem.selectedVariants,
      createdAt: cartItem.createdAt,
      updatedAt: cartItem.updatedAt,
    );
  }

  /// Converts this [CartItemModel] to a [CartItem] entity
  CartItem toEntity() {
    return CartItem(
      id: id,
      userId: userId,
      product: product,
      quantity: quantity,
      selectedVariants: selectedVariants,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Creates a [CartItemModel] from Drift [CartTableData]
  factory CartItemModel.fromDrift(CartTableData data) {
    // Parse selected variants from JSON string
    Map<String, dynamic>? variants;
    if (data.selectedVariants != null && data.selectedVariants!.isNotEmpty) {
      try {
        variants = jsonDecode(data.selectedVariants!) as Map<String, dynamic>;
      } catch (e) {
        variants = null;
      }
    }

    // Create a Product entity from the cart data
    final product = Product(
      id: data.productId,
      title: data.productName,
      description: '', // Not stored in cart table
      brand: '', // Not stored in cart table
      price: data.productPrice,
      sku: data.productServerId ?? '',
      images: data.productThumbnail != null ? [data.productThumbnail!] : [],
      rating: 0.0, // Not stored in cart table
    );

    return CartItemModel(
      id: data.id,
      userId: data.userId.toString(),
      product: product,
      quantity: data.quantity,
      selectedVariants: variants,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
    );
  }

  /// Converts this [CartItemModel] to a Drift [CartTableCompanion]
  CartTableCompanion toDriftCompanion() {
    return CartTableCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      userId: Value(int.tryParse(userId) ?? 0),
      productId: Value(product.id),
      productServerId: Value(product.sku),
      productName: Value(product.title),
      productPrice: Value(product.price),
      productDiscountPrice: const Value.absent(), // Not implemented yet
      productThumbnail: Value(
        product.images.isNotEmpty ? product.images.first : null,
      ),
      quantity: Value(quantity),
      selectedVariants: Value(
        selectedVariants != null ? jsonEncode(selectedVariants) : null,
      ),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  /// Converts this [CartItemModel] to a Drift [CartTableCompanion] for inserts
  CartTableCompanion toDriftCompanionForInsert() {
    return CartTableCompanion.insert(
      userId: int.tryParse(userId) ?? 0,
      productId: product.id,
      productName: product.title,
      productPrice: product.price,
      quantity: Value(quantity),
      productServerId: Value(product.sku),
      productDiscountPrice: const Value.absent(),
      productThumbnail: Value(
        product.images.isNotEmpty ? product.images.first : null,
      ),
      selectedVariants: Value(
        selectedVariants != null ? jsonEncode(selectedVariants) : null,
      ),
    );
  }

  /// Converts this [CartItemModel] to a Drift [CartTableCompanion] for updates
  /// Excludes the id field to avoid unique constraint violations
  CartTableCompanion toDriftCompanionForUpdate() {
    return CartTableCompanion(
      // id is excluded for updates to avoid unique constraint violations
      userId: Value(int.tryParse(userId) ?? 0),
      productId: Value(product.id),
      productServerId: Value(product.sku),
      productName: Value(product.title),
      productPrice: Value(product.price),
      productDiscountPrice: const Value.absent(),
      productThumbnail: Value(
        product.images.isNotEmpty ? product.images.first : null,
      ),
      quantity: Value(quantity),
      selectedVariants: Value(
        selectedVariants != null ? jsonEncode(selectedVariants) : null,
      ),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  @override
  CartItemModel copyWith({
    int? id,
    String? userId,
    Product? product,
    int? quantity,
    Map<String, dynamic>? selectedVariants,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedVariants: selectedVariants ?? this.selectedVariants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
