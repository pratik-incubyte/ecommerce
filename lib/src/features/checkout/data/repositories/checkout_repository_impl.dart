import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/checkout/domain/repositories/checkout_repository.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/checkout/data/datasources/checkout_local_data_source.dart';
import 'package:ecommerce/src/features/checkout/data/datasources/checkout_remote_data_source.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';
import 'package:ecommerce/src/features/cart/domain/repositories/cart_repository.dart';

/// Implementation of checkout repository
class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutRemoteDataSource remoteDataSource;
  final CheckoutLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final CartRepository cartRepository;
  final OrdersRepository ordersRepository;

  CheckoutRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.cartRepository,
    required this.ordersRepository,
  });

  @override
  Future<Either<Failure, Checkout>> calculateCheckout({
    required String userId,
    required String shippingMethod,
    required Map<String, dynamic> shippingAddress,
    String? promoCode,
  }) async {
    try {
      // Get cart items
      final cartResult = await cartRepository.getCart(userId);
      final cartItems = cartResult.fold(
        (failure) =>
            throw Exception('Failed to get cart items: ${failure.message}'),
        (cart) => cart.items,
      );

      if (cartItems.isEmpty) {
        return const Left(ValidationFailure('Cart is empty'));
      }

      // Calculate subtotal
      final subtotal = cartItems.fold<double>(
        0.0,
        (sum, item) => sum + item.totalPrice,
      );

      // Calculate shipping and tax
      double shippingCost = 0.0;
      double taxAmount = 0.0;
      double discountAmount = 0.0;

      if (await networkInfo.isConnected) {
        try {
          // Calculate shipping
          final weight = cartItems.length * 1.0; // Dummy weight calculation
          shippingCost = await remoteDataSource.calculateShipping(
            address: shippingAddress,
            shippingMethod: shippingMethod,
            weight: weight,
          );

          // Calculate tax
          taxAmount = await remoteDataSource.calculateTax(
            subtotal: subtotal,
            address: shippingAddress,
          );

          // Apply promo code if provided
          if (promoCode != null && promoCode.isNotEmpty) {
            try {
              final promoResult = await remoteDataSource.applyPromoCode(
                promoCode: promoCode,
                subtotal: subtotal,
              );
              if (promoResult['isValid'] == true) {
                discountAmount =
                    promoResult['discountAmount']?.toDouble() ?? 0.0;
              }
            } catch (e) {
              // If promo code fails, continue without discount
              print('Promo code application failed: $e');
            }
          }
        } catch (e) {
          // Use default values if network calls fail
          shippingCost = _getDefaultShippingCost(shippingMethod);
          taxAmount = subtotal * 0.10; // Default 10% tax
        }
      } else {
        // Use default values when offline
        shippingCost = _getDefaultShippingCost(shippingMethod);
        taxAmount = subtotal * 0.10; // Default 10% tax
      }

      final totalAmount = subtotal + shippingCost + taxAmount - discountAmount;

      final checkout = Checkout(
        userId: userId,
        items: cartItems,
        shippingAddress: shippingAddress,
        billingAddress: shippingAddress, // Use same address by default
        paymentMethod: 'credit_card', // Default payment method
        shippingMethod: shippingMethod,
        subtotal: subtotal,
        shippingCost: shippingCost,
        taxAmount: taxAmount,
        discountAmount: discountAmount,
        totalAmount: totalAmount,
        promoCode: promoCode,
        createdAt: DateTime.now(),
      );

      // Cache the checkout calculation
      try {
        await localDataSource.cacheCheckout(userId, checkout);
      } catch (e) {
        // Log cache error but don't fail the operation
        print('Failed to cache checkout: $e');
      }

      return Right(checkout);
    } catch (e) {
      return Left(
        GeneralFailure('Failed to calculate checkout: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> processPayment({
    required String paymentMethod,
    required double amount,
    required Map<String, dynamic> paymentDetails,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final paymentResult = await remoteDataSource.processPayment(
            paymentMethod: paymentMethod,
            amount: amount,
            paymentDetails: paymentDetails,
          );
          return Right(paymentResult);
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        return const Left(NetworkFailure('Cannot process payment offline'));
      }
    } catch (e) {
      return Left(GeneralFailure('Payment failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> applyPromoCode({
    required String promoCode,
    required double subtotal,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final promoResult = await remoteDataSource.applyPromoCode(
            promoCode: promoCode,
            subtotal: subtotal,
          );
          return Right(promoResult);
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        return const Left(NetworkFailure('Cannot validate promo code offline'));
      }
    } catch (e) {
      return Left(
        GeneralFailure('Failed to apply promo code: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> validateAddress({
    required Map<String, dynamic> address,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final isValid = await remoteDataSource.validateAddress(
            address: address,
          );
          return Right(isValid);
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        // Basic offline validation
        final requiredFields = [
          'firstName',
          'lastName',
          'addressLine1',
          'city',
          'state',
          'postalCode',
          'country',
        ];
        for (final field in requiredFields) {
          if (address[field] == null ||
              address[field].toString().trim().isEmpty) {
            return const Right(false);
          }
        }
        return const Right(true);
      }
    } catch (e) {
      return Left(
        GeneralFailure('Failed to validate address: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getShippingMethods({
    required Map<String, dynamic> address,
    required double weight,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          final shippingMethods = await remoteDataSource.getShippingMethods(
            address: address,
            weight: weight,
          );
          return Right(shippingMethods);
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        // Return default shipping methods when offline
        return Right(_getDefaultShippingMethods());
      }
    } catch (e) {
      return Left(
        GeneralFailure('Failed to get shipping methods: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Order>> completeCheckout({
    required Checkout checkout,
    required Map<String, dynamic> paymentResult,
  }) async {
    try {
      // Convert cart items to order items format
      final orderItems = checkout.items
          .map(
            (cartItem) => {
              'product': cartItem.product,
              'quantity': cartItem.quantity,
              'productPrice': cartItem.product.price,
              'selectedVariants': cartItem.selectedVariants,
            },
          )
          .toList();

      // Create the order
      final orderResult = await ordersRepository.createOrder(
        userId: checkout.userId,
        items: orderItems,
        shippingAddress: checkout.shippingAddress,
        billingAddress: checkout.billingAddress,
        paymentMethod: checkout.paymentMethod,
        shippingMethod: checkout.shippingMethod,
        totalAmount: checkout.totalAmount,
        discountAmount: checkout.discountAmount,
        promoCode: checkout.promoCode,
        notes: checkout.notes,
      );

      final order = orderResult.fold(
        (failure) =>
            throw Exception('Failed to create order: ${failure.message}'),
        (order) => order,
      );

      // Clear the cart after successful checkout
      try {
        await cartRepository.clearCart(checkout.userId);
      } catch (e) {
        // Log error but don't fail the checkout
        print('Failed to clear cart after checkout: $e');
      }

      // Clear cached checkout
      try {
        await localDataSource.clearCachedCheckout(checkout.userId);
      } catch (e) {
        // Log error but don't fail the checkout
        print('Failed to clear cached checkout: $e');
      }

      return Right(order);
    } catch (e) {
      return Left(
        GeneralFailure('Failed to complete checkout: ${e.toString()}'),
      );
    }
  }

  /// Get default shipping cost for offline scenarios
  double _getDefaultShippingCost(String shippingMethod) {
    switch (shippingMethod.toLowerCase()) {
      case 'standard':
        return 5.99;
      case 'express':
        return 12.99;
      case 'overnight':
        return 24.99;
      case 'pickup':
        return 0.0;
      default:
        return 5.99;
    }
  }

  /// Get default shipping methods for offline scenarios
  List<Map<String, dynamic>> _getDefaultShippingMethods() {
    return [
      {
        'id': 'standard',
        'name': 'Standard Shipping',
        'description': '5-7 business days',
        'price': 5.99,
        'estimatedDays': '5-7',
      },
      {
        'id': 'express',
        'name': 'Express Shipping',
        'description': '2-3 business days',
        'price': 12.99,
        'estimatedDays': '2-3',
      },
      {
        'id': 'overnight',
        'name': 'Overnight Shipping',
        'description': 'Next business day',
        'price': 24.99,
        'estimatedDays': '1',
      },
      {
        'id': 'pickup',
        'name': 'Store Pickup',
        'description': 'Pick up at store',
        'price': 0.0,
        'estimatedDays': '0',
      },
    ];
  }
}
