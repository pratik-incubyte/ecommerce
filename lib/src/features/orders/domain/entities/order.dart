import 'package:equatable/equatable.dart';
import 'order_item.dart';

/// Order entity representing a customer's order
class Order extends Equatable {
  final int? id;
  final String? serverId;
  final String userId;
  final List<OrderItem> items;
  final String status;
  final double totalAmount;
  final double? discountAmount;
  final Map<String, dynamic> shippingAddress;
  final Map<String, dynamic> billingAddress;
  final String paymentMethod;
  final String paymentStatus;
  final String shippingMethod;
  final String? trackingNumber;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Order({
    this.id,
    this.serverId,
    required this.userId,
    required this.items,
    required this.status,
    required this.totalAmount,
    this.discountAmount,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.shippingMethod,
    this.trackingNumber,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Get the subtotal (total before discount)
  double get subtotal => items.fold(0.0, (sum, item) => sum + item.totalPrice);

  /// Get the final amount after discount
  double get finalAmount => totalAmount - (discountAmount ?? 0.0);

  /// Get total number of items
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  /// Check if order is completed
  bool get isCompleted => status.toLowerCase() == 'completed';

  /// Check if order is pending
  bool get isPending => status.toLowerCase() == 'pending';

  /// Check if order is cancelled
  bool get isCancelled => status.toLowerCase() == 'cancelled';

  /// Check if payment is completed
  bool get isPaymentCompleted => paymentStatus.toLowerCase() == 'paid';

  /// Copy with method for creating modified instances
  Order copyWith({
    int? id,
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
    return Order(
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

  @override
  List<Object?> get props => [
    id,
    serverId,
    userId,
    items,
    status,
    totalAmount,
    discountAmount,
    shippingAddress,
    billingAddress,
    paymentMethod,
    paymentStatus,
    shippingMethod,
    trackingNumber,
    notes,
    createdAt,
    updatedAt,
  ];
}

/// Order status constants
class OrderStatus {
  static const String pending = 'pending';
  static const String processing = 'processing';
  static const String shipped = 'shipped';
  static const String delivered = 'delivered';
  static const String completed = 'completed';
  static const String cancelled = 'cancelled';
  static const String refunded = 'refunded';
}

/// Payment status constants
class PaymentStatus {
  static const String pending = 'pending';
  static const String paid = 'paid';
  static const String failed = 'failed';
  static const String refunded = 'refunded';
}
