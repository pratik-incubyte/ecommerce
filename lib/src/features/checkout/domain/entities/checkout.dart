import 'package:equatable/equatable.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';

/// Checkout entity representing a checkout session
class Checkout extends Equatable {
  final String userId;
  final List<CartItem> items;
  final Map<String, dynamic> shippingAddress;
  final Map<String, dynamic> billingAddress;
  final String paymentMethod;
  final String shippingMethod;
  final double subtotal;
  final double shippingCost;
  final double taxAmount;
  final double discountAmount;
  final double totalAmount;
  final String? promoCode;
  final String? notes;
  final DateTime createdAt;

  const Checkout({
    required this.userId,
    required this.items,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.shippingMethod,
    required this.subtotal,
    required this.shippingCost,
    required this.taxAmount,
    required this.discountAmount,
    required this.totalAmount,
    this.promoCode,
    this.notes,
    required this.createdAt,
  });

  /// Get total number of items
  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  /// Check if checkout has items
  bool get hasItems => items.isNotEmpty;

  /// Check if shipping address is the same as billing address
  bool get isSameAddress =>
      shippingAddress.toString() == billingAddress.toString();

  /// Calculate total without shipping
  double get totalWithoutShipping => subtotal + taxAmount - discountAmount;

  /// Copy with method for creating modified instances
  Checkout copyWith({
    String? userId,
    List<CartItem>? items,
    Map<String, dynamic>? shippingAddress,
    Map<String, dynamic>? billingAddress,
    String? paymentMethod,
    String? shippingMethod,
    double? subtotal,
    double? shippingCost,
    double? taxAmount,
    double? discountAmount,
    double? totalAmount,
    String? promoCode,
    String? notes,
    DateTime? createdAt,
  }) {
    return Checkout(
      userId: userId ?? this.userId,
      items: items ?? this.items,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      subtotal: subtotal ?? this.subtotal,
      shippingCost: shippingCost ?? this.shippingCost,
      taxAmount: taxAmount ?? this.taxAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      promoCode: promoCode ?? this.promoCode,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    items,
    shippingAddress,
    billingAddress,
    paymentMethod,
    shippingMethod,
    subtotal,
    shippingCost,
    taxAmount,
    discountAmount,
    totalAmount,
    promoCode,
    notes,
    createdAt,
  ];
}

/// Payment method constants
class PaymentMethod {
  static const String creditCard = 'credit_card';
  static const String debitCard = 'debit_card';
  static const String paypal = 'paypal';
  static const String applePay = 'apple_pay';
  static const String googlePay = 'google_pay';
  static const String cashOnDelivery = 'cash_on_delivery';
}

/// Shipping method constants
class ShippingMethod {
  static const String standard = 'standard';
  static const String express = 'express';
  static const String overnight = 'overnight';
  static const String pickup = 'pickup';
}
