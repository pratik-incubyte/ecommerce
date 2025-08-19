import 'dart:convert';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order_item.dart';
import 'order_item_model.dart';

/// Order model for data layer
class OrderModel extends Order {
  const OrderModel({
    super.id,
    super.serverId,
    required super.userId,
    required super.items,
    required super.status,
    required super.totalAmount,
    super.discountAmount,
    required super.shippingAddress,
    required super.billingAddress,
    required super.paymentMethod,
    required super.paymentStatus,
    required super.shippingMethod,
    super.trackingNumber,
    super.notes,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Convert from JSON map
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id']?.toString(),
      serverId: json['serverId']?.toString(),
      userId: json['userId']?.toString() ?? '',
      items:
          (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItemModel.fromJson(item))
              .cast<OrderItem>()
              .toList() ??
          [],
      status: json['status'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0.0).toDouble(),
      discountAmount: (json['discountAmount'])?.toDouble(),
      shippingAddress: json['shippingAddress'] is String
          ? jsonDecode(json['shippingAddress'])
          : json['shippingAddress'] ?? {},
      billingAddress: json['billingAddress'] is String
          ? jsonDecode(json['billingAddress'])
          : json['billingAddress'] ?? {},
      paymentMethod: json['paymentMethod'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
      shippingMethod: json['shippingMethod'] ?? '',
      trackingNumber: json['trackingNumber'],
      notes: json['notes'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
    );
  }

  /// Convert from database row
  factory OrderModel.fromDatabaseRow(Map<String, dynamic> row) {
    return OrderModel(
      id: row['id'],
      serverId: row['serverId'],
      userId: row['userId']?.toString() ?? '',
      items: [], // Items will be loaded separately
      status: row['status'] ?? '',
      totalAmount: (row['totalAmount'] ?? 0.0).toDouble(),
      discountAmount: (row['discountAmount'])?.toDouble(),
      shippingAddress: row['shippingAddress'] is String
          ? jsonDecode(row['shippingAddress'])
          : {},
      billingAddress: row['billingAddress'] is String
          ? jsonDecode(row['billingAddress'])
          : {},
      paymentMethod: row['paymentMethod'] ?? '',
      paymentStatus: row['paymentStatus'] ?? '',
      shippingMethod: row['shippingMethod'] ?? '',
      trackingNumber: row['trackingNumber'],
      notes: row['notes'],
      createdAt: row['createdAt'] != null
          ? DateTime.parse(row['createdAt'])
          : DateTime.now(),
      updatedAt: row['updatedAt'] != null
          ? DateTime.parse(row['updatedAt'])
          : DateTime.now(),
    );
  }

  /// Convert to JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serverId': serverId,
      'userId': userId,
      'items': items.map((item) => (item as OrderItemModel).toJson()).toList(),
      'status': status,
      'totalAmount': totalAmount,
      'discountAmount': discountAmount,
      'shippingAddress': shippingAddress,
      'billingAddress': billingAddress,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'shippingMethod': shippingMethod,
      'trackingNumber': trackingNumber,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Convert to database row
  Map<String, dynamic> toDatabaseRow() {
    return {
      'id': id,
      'serverId': serverId,
      'userId': userId,
      'status': status,
      'totalAmount': totalAmount,
      'discountAmount': discountAmount,
      'shippingAddress': jsonEncode(shippingAddress),
      'billingAddress': jsonEncode(billingAddress),
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'shippingMethod': shippingMethod,
      'trackingNumber': trackingNumber,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Create from entity
  factory OrderModel.fromEntity(Order order) {
    return OrderModel(
      id: order.id,
      serverId: order.serverId,
      userId: order.userId,
      items: order.items,
      status: order.status,
      totalAmount: order.totalAmount,
      discountAmount: order.discountAmount,
      shippingAddress: order.shippingAddress,
      billingAddress: order.billingAddress,
      paymentMethod: order.paymentMethod,
      paymentStatus: order.paymentStatus,
      shippingMethod: order.shippingMethod,
      trackingNumber: order.trackingNumber,
      notes: order.notes,
      createdAt: order.createdAt,
      updatedAt: order.updatedAt,
    );
  }

  /// Convert to entity
  Order toEntity() {
    return Order(
      id: id,
      serverId: serverId,
      userId: userId,
      items: items,
      status: status,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      shippingAddress: shippingAddress,
      billingAddress: billingAddress,
      paymentMethod: paymentMethod,
      paymentStatus: paymentStatus,
      shippingMethod: shippingMethod,
      trackingNumber: trackingNumber,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Copy with method for creating modified instances
  @override
  OrderModel copyWith({
    String? id,
    String? serverId,
    String? userId,
    List<OrderItem>? items,
    String? status,
    double? totalAmount,
    double? discountAmount,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    String? paymentMethod,
    String? paymentStatus,
    String? shippingMethod,
    String? trackingNumber,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderModel(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      userId: userId ?? this.userId,
      items: items ?? this.items,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
