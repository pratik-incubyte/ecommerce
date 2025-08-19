import 'package:dartz/dartz.dart' hide Order;
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/orders/domain/repositories/orders_repository.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order.dart';
import 'package:ecommerce/src/features/orders/data/models/order_model.dart';
import 'package:ecommerce/src/features/orders/data/models/order_item_model.dart';
import 'package:ecommerce/src/features/orders/data/datasources/orders_remote_data_source.dart';
import 'package:ecommerce/src/features/orders/data/datasources/orders_local_data_source.dart';
import 'package:ecommerce/src/features/orders/domain/entities/order_item.dart';

/// Implementation of orders repository
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;
  final OrdersLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  OrdersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Order>> createOrder({
    required String userId,
    required List<Map<String, dynamic>> items,
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> billingAddress,
    required String paymentMethod,
    required String shippingMethod,
    required double totalAmount,
    double? discountAmount,
    String? promoCode,
    String? notes,
  }) async {
    try {
      // Convert cart items to order items
      final orderItems = items.map((itemData) {
        return OrderItemModel(
          orderId: 0, // Will be set after order creation
          product: itemData['product'],
          quantity: itemData['quantity'] is int
              ? itemData['quantity']
              : int.tryParse(itemData['quantity']?.toString() ?? '1') ?? 1,
          productPrice: itemData['productPrice'] ?? itemData['product'].price,
          selectedVariants: itemData['selectedVariants'],
        );
      }).toList();

      final orderModel = OrderModel(
        userId: userId,
        items: orderItems.cast<OrderItem>(),
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        discountAmount: discountAmount,
        shippingAddress: shippingAddress,
        billingAddress: billingAddress,
        paymentMethod: paymentMethod,
        paymentStatus: PaymentStatus.pending,
        shippingMethod: shippingMethod,
        notes: notes,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (await networkInfo.isConnected) {
        try {
          // Create order on server
          final remoteOrder = await remoteDataSource.createOrder(orderModel);

          // Cache the order locally
          try {
            await localDataSource.cacheOrder(remoteOrder);
          } catch (e) {
            // Log cache error but don't fail the operation
            print('Failed to cache order locally: $e');
          }

          return Right(remoteOrder.toEntity());
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        try {
          // Save locally only when offline
          final localOrder = await localDataSource.cacheOrder(orderModel);
          return Right(localOrder.toEntity());
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(GeneralFailure('Failed to create order: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrders({
    required String userId,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          // Get orders from server
          final remoteOrders = await remoteDataSource.getOrders(
            userId,
            page: page,
            limit: limit,
          );

          // Cache orders locally
          try {
            for (final order in remoteOrders) {
              await localDataSource.cacheOrder(order);
            }
          } catch (e) {
            // Log cache error but don't fail the operation
            print('Failed to cache orders locally: $e');
          }

          return Right(remoteOrders.map((order) => order.toEntity()).toList());
        } on ServerException catch (e) {
          // Fallback to local data if server fails
          try {
            final localOrders = await localDataSource.getOrders(
              userId,
              page: page,
              limit: limit,
            );
            return Right(localOrders.map((order) => order.toEntity()).toList());
          } on CacheException catch (localE) {
            return Left(
              ServerFailure(
                '${e.message}. Local fallback failed: ${localE.message}',
              ),
            );
          }
        }
      } else {
        try {
          // Get orders from local storage when offline
          final localOrders = await localDataSource.getOrders(
            userId,
            page: page,
            limit: limit,
          );
          return Right(localOrders.map((order) => order.toEntity()).toList());
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(GeneralFailure('Failed to get orders: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Order>> getOrderById({
    required String userId,
    required int orderId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          // Get order from server
          final remoteOrder = await remoteDataSource.getOrderById(
            userId,
            orderId,
          );

          // Cache order locally
          try {
            await localDataSource.cacheOrder(remoteOrder);
          } catch (e) {
            // Log cache error but don't fail the operation
            print('Failed to cache order locally: $e');
          }

          return Right(remoteOrder.toEntity());
        } on ServerException catch (e) {
          // Fallback to local data if server fails
          try {
            final localOrder = await localDataSource.getOrderById(
              userId,
              orderId,
            );
            return Right(localOrder.toEntity());
          } on CacheException catch (localE) {
            return Left(
              ServerFailure(
                '${e.message}. Local fallback failed: ${localE.message}',
              ),
            );
          }
        }
      } else {
        try {
          // Get order from local storage when offline
          final localOrder = await localDataSource.getOrderById(
            userId,
            orderId,
          );
          return Right(localOrder.toEntity());
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(GeneralFailure('Failed to get order: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Order>> updateOrderStatus({
    required int orderId,
    required String status,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          // Update order status on server
          final updatedOrder = await remoteDataSource.updateOrderStatus(
            orderId,
            status,
          );

          // Update local cache
          try {
            await localDataSource.updateOrderStatus(orderId, status);
          } catch (e) {
            // Log cache error but don't fail the operation
            print('Failed to update order status locally: $e');
          }

          return Right(updatedOrder.toEntity());
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        try {
          // Update locally only when offline
          final updatedOrder = await localDataSource.updateOrderStatus(
            orderId,
            status,
          );
          return Right(updatedOrder.toEntity());
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(
        GeneralFailure('Failed to update order status: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelOrder({
    required String userId,
    required int orderId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        try {
          // Cancel order on server
          await remoteDataSource.cancelOrder(userId, orderId);

          // Update local cache
          try {
            await localDataSource.updateOrderStatus(
              orderId,
              OrderStatus.cancelled,
            );
          } catch (e) {
            // Log cache error but don't fail the operation
            print('Failed to update order status locally: $e');
          }

          return const Right(unit);
        } on ServerException catch (e) {
          return Left(ServerFailure(e.message));
        }
      } else {
        try {
          // Cancel locally only when offline
          await localDataSource.updateOrderStatus(
            orderId,
            OrderStatus.cancelled,
          );
          return const Right(unit);
        } on CacheException catch (e) {
          return Left(CacheFailure(e.message));
        }
      }
    } catch (e) {
      return Left(GeneralFailure('Failed to cancel order: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Order>>> getOrderHistory({
    required String userId,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // For now, use the same implementation as getOrders
    // In a more complex implementation, we could add filtering capabilities
    return getOrders(userId: userId, page: 1, limit: 100);
  }
}
