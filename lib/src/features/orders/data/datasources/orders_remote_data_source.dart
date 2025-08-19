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
  Future<OrderModel> getOrderById(String userId, int orderId);

  /// Update order status on the server
  Future<OrderModel> updateOrderStatus(int orderId, String status);

  /// Cancel order on the server
  Future<void> cancelOrder(String userId, int orderId);
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

      // Add server timestamp
      orderData['createdAt'] = FieldValue.serverTimestamp();
      orderData['updatedAt'] = FieldValue.serverTimestamp();

      final docRef = await firestore.collection('orders').add(orderData);

      // Get the created order with server ID
      final createdDoc = await docRef.get();
      final createdData = createdDoc.data()!;

      // Generate a proper integer ID from the timestamp for local use
      final now = DateTime.now();
      final generatedId =
          now.millisecondsSinceEpoch % 2147483647; // Keep within int range

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

      // Set both integer ID and serverId
      return OrderModel.fromJson(
        createdData,
      ).copyWith(id: generatedId, serverId: createdDoc.id);
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
          .orderBy('createdAt', descending: true)
          .limit(limit);

      // Note: Firestore doesn't have offset, so for now we just use limit
      // For proper pagination, we'd need to implement cursor-based pagination

      final querySnapshot = await query.get();

      final orders = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;

        // Generate integer ID from the document timestamp or use existing ID
        int? orderId;
        if (data['createdAt'] is Timestamp) {
          final timestamp = data['createdAt'] as Timestamp;
          orderId = timestamp.millisecondsSinceEpoch % 2147483647;
          data['createdAt'] = timestamp.toDate().toIso8601String();
        } else if (data['createdAt'] is String) {
          try {
            final dateTime = DateTime.parse(data['createdAt']);
            orderId = dateTime.millisecondsSinceEpoch % 2147483647;
          } catch (_) {
            orderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
          }
        } else {
          orderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
        }

        // Convert updatedAt timestamp
        if (data['updatedAt'] is Timestamp) {
          data['updatedAt'] = (data['updatedAt'] as Timestamp)
              .toDate()
              .toIso8601String();
        }

        return OrderModel.fromJson(
          data,
        ).copyWith(id: orderId, serverId: doc.id);
      }).toList();

      return orders;
    } catch (e) {
      throw ServerException('Failed to get orders: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> getOrderById(String userId, int orderId) async {
    try {
      // First try to find by document ID (serverId)
      DocumentSnapshot? doc;

      try {
        doc = await firestore
            .collection('orders')
            .doc(orderId.toString())
            .get();
        if (!doc.exists) {
          doc = null;
        }
      } catch (_) {
        doc = null;
      }

      // If not found by document ID, search by order data
      if (doc == null) {
        final querySnapshot = await firestore
            .collection('orders')
            .where('userId', isEqualTo: userId)
            .where('id', isEqualTo: orderId)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          doc = querySnapshot.docs.first;
        }
      }

      if (doc == null || !doc.exists) {
        throw ServerException('Order not found');
      }

      final data = doc.data() as Map<String, dynamic>;

      // Generate integer ID from the document timestamp
      int? generatedOrderId;
      if (data['createdAt'] is Timestamp) {
        final timestamp = data['createdAt'] as Timestamp;
        generatedOrderId = timestamp.millisecondsSinceEpoch % 2147483647;
        data['createdAt'] = timestamp.toDate().toIso8601String();
      } else if (data['createdAt'] is String) {
        try {
          final dateTime = DateTime.parse(data['createdAt']);
          generatedOrderId = dateTime.millisecondsSinceEpoch % 2147483647;
        } catch (_) {
          generatedOrderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
        }
      } else {
        generatedOrderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
      }

      // Convert updatedAt timestamp
      if (data['updatedAt'] is Timestamp) {
        data['updatedAt'] = (data['updatedAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }

      // Verify the order belongs to the user
      if (data['userId'] != userId) {
        throw ServerException('Unauthorized access to order');
      }

      return OrderModel.fromJson(
        data,
      ).copyWith(id: generatedOrderId, serverId: doc.id);
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to get order: ${e.toString()}');
    }
  }

  @override
  Future<OrderModel> updateOrderStatus(int orderId, String status) async {
    try {
      // Try to find the order document
      DocumentSnapshot? doc;

      try {
        doc = await firestore
            .collection('orders')
            .doc(orderId.toString())
            .get();
        if (!doc.exists) {
          doc = null;
        }
      } catch (_) {
        doc = null;
      }

      if (doc == null) {
        // Search by order ID in the data
        final querySnapshot = await firestore
            .collection('orders')
            .where('id', isEqualTo: orderId)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          doc = querySnapshot.docs.first;
        }
      }

      if (doc == null || !doc.exists) {
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

      // Generate integer ID from the document timestamp
      int? generatedOrderId;
      if (data['createdAt'] is Timestamp) {
        final timestamp = data['createdAt'] as Timestamp;
        generatedOrderId = timestamp.millisecondsSinceEpoch % 2147483647;
        data['createdAt'] = timestamp.toDate().toIso8601String();
      } else if (data['createdAt'] is String) {
        try {
          final dateTime = DateTime.parse(data['createdAt']);
          generatedOrderId = dateTime.millisecondsSinceEpoch % 2147483647;
        } catch (_) {
          generatedOrderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
        }
      } else {
        generatedOrderId = DateTime.now().millisecondsSinceEpoch % 2147483647;
      }

      // Convert updatedAt timestamp
      if (data['updatedAt'] is Timestamp) {
        data['updatedAt'] = (data['updatedAt'] as Timestamp)
            .toDate()
            .toIso8601String();
      }

      return OrderModel.fromJson(
        data,
      ).copyWith(id: generatedOrderId, serverId: updatedDoc.id);
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException('Failed to update order status: ${e.toString()}');
    }
  }

  @override
  Future<void> cancelOrder(String userId, int orderId) async {
    try {
      await updateOrderStatus(orderId, 'cancelled');
    } catch (e) {
      throw ServerException('Failed to cancel order: ${e.toString()}');
    }
  }
}
