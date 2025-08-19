import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/orders/data/models/order_model.dart';

/// Remote data source for orders
abstract class OrdersRemoteDataSource {
  /// Create a new order on the server
  Future<OrderModel> createOrder(OrderModel order);

  /// Get orders from the server
  Future<List<OrderModel>> getOrders(
    String userId, {
    int page = 1,
    int limit = 20,
  });

  /// Get a specific order by ID
  Future<OrderModel> getOrderById(String userId, String orderId);

  /// Update order status on the server
  Future<OrderModel> updateOrderStatus(String orderId, String status);

  /// Cancel order on the server
  Future<void> cancelOrder(String userId, String orderId);
}

/// Implementation of remote data source for orders using Firebase Firestore
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final FirebaseFirestore firestore;

  OrdersRemoteDataSourceImpl({required this.firestore});

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    try {
      final orderData = order.toJson();
      orderData.remove('id'); // Remove local ID
      orderData.remove('serverId'); // Remove serverId

      // Add server timestamp
      orderData['createdAt'] = FieldValue.serverTimestamp();
      orderData['updatedAt'] = FieldValue.serverTimestamp();

      final docRef = await firestore.collection('orders').add(orderData);

      // Get the created order with server ID
      final createdDoc = await docRef.get();
      final createdData = createdDoc.data()!;

      // Convert Firestore timestamps to DateTime
      if (createdData['createdAt'] is Timestamp) {
        createdData['createdAt'] = (createdData['createdAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      if (createdData['updatedAt'] is Timestamp) {
        createdData['updatedAt'] = (createdData['updatedAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }

      // Use Firebase document ID as the order ID
      return OrderModel.fromJson(
        createdData,
      ).copyWith(id: createdDoc.id, serverId: createdDoc.id);
    } catch (e) {
      throw ServerException('Failed to create order: ${e.toString()}');
    }
  }

  @override
  Future<List<OrderModel>> getOrders(
    String userId, {
    int page = 1,
    int limit = 20,
  }) async {
    try {
      Query query = firestore
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .limit(limit);
          // TODO: Add .orderBy('createdAt', descending: true) after creating Firebase index

      // Note: Firestore doesn't have offset, so for now we just use limit
      // For proper pagination, we'd need to implement cursor-based pagination

      final querySnapshot = await query.get();

      final orders = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        
        // Convert createdAt timestamp
        if (data['createdAt'] is Timestamp) {
          data['createdAt'] = (data['createdAt'] as Timestamp).toDate().toIso8601String();
        }

        // Convert updatedAt timestamp
        if (data['updatedAt'] is Timestamp) {
          data['updatedAt'] = (data['updatedAt'] as Timestamp)
              .toDate()
              .toIso8601String();
        }

        // Use Firebase document ID directly as the order ID
        return OrderModel.fromJson(
          data,
        ).copyWith(id: doc.id, serverId: doc.id);
      }).toList();

      return orders;
    } catch (e) {
      throw ServerException('Failed to get orders: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> getOrderById(String userId, String orderId) async {
    try {
      // Get order by document ID directly
      final doc = await firestore
          .collection('orders')
          .doc(orderId)
          .get();

      if (!doc.exists) {
        throw ServerException('Order not found');
      }

      final data = doc.data() as Map<String, dynamic>;

      // Convert timestamps
      if (data['createdAt'] is Timestamp) {
        data['createdAt'] = (data['createdAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      if (data['updatedAt'] is Timestamp) {
        data['updatedAt'] = (data['updatedAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }

      // Verify the order belongs to the user
      if (data['userId'] != userId) {
        throw ServerException('Unauthorized access to order');
      }

      // Use Firebase document ID directly as the order ID
      return OrderModel.fromJson(
        data,
      ).copyWith(id: doc.id, serverId: doc.id);
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to get order: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> updateOrderStatus(String orderId, String status) async {
    try {
      // Get the order document directly
      final doc = await firestore
          .collection('orders')
          .doc(orderId)
          .get();

      if (!doc.exists) {
        throw ServerException('Order not found');
      }

      // Update the order status
      await doc.reference.update({
        'status': status,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Get the updated order
      final updatedDoc = await doc.reference.get();
      final data = updatedDoc.data() as Map<String, dynamic>;

      // Convert timestamps
      if (data['createdAt'] is Timestamp) {
        data['createdAt'] = (data['createdAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }
      if (data['updatedAt'] is Timestamp) {
        data['updatedAt'] = (data['updatedAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }

      // Use Firebase document ID directly as the order ID
      return OrderModel.fromJson(
        data,
      ).copyWith(id: updatedDoc.id, serverId: updatedDoc.id);
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to update order status: ${e.toString()}');
    }
  }

  @override
  Future<void> cancelOrder(String userId, String orderId) async {
    try {
      await updateOrderStatus(orderId, 'cancelled');
    } catch (e) {
      throw ServerException('Failed to cancel order: ${e.toString()}');
    }
  }
}
