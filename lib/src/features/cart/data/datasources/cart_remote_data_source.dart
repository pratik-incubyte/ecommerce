import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/cart/data/models/cart_item_model.dart';

abstract class CartRemoteDataSource {
  /// Add an item to the user's cart in Firebase
  Future<CartItemModel> addToCart(CartItemModel cartItem);

  /// Get all cart items for a specific user from Firebase
  Future<List<CartItemModel>> getCartItems(String userId);

  /// Update a cart item in Firebase
  Future<CartItemModel> updateCartItem(CartItemModel cartItem);

  /// Remove an item from the user's cart in Firebase
  Future<void> removeFromCart(String userId, int productId);

  /// Clear all items from the user's cart in Firebase
  Future<void> clearCart(String userId);

  /// Get a specific cart item by user and product ID
  Future<CartItemModel?> getCartItem(String userId, int productId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final FirebaseFirestore firestore;

  CartRemoteDataSourceImpl({required this.firestore});

  @override
  Future<CartItemModel> addToCart(CartItemModel cartItem) async {
    try {
      final cartItemData = cartItem.toJson();
      cartItemData['id'] = '${cartItem.userId}_${cartItem.product.id}';

      await firestore
          .collection('carts')
          .doc(cartItem.userId)
          .collection('items')
          .doc('${cartItem.product.id}')
          .set(cartItemData);

      return cartItem.copyWith(id: cartItem.product.id);
    } catch (e) {
      throw ServerException('Failed to add item to cart: ${e.toString()}');
    }
  }

  @override
  Future<List<CartItemModel>> getCartItems(String userId) async {
    try {
      final querySnapshot = await firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs
          .map(
            (doc) => CartItemModel.fromJson({
              ...doc.data(),
              'id': int.tryParse(doc.id), // Convert doc.id to int
            }),
          )
          .toList();
    } catch (e) {
      throw ServerException('Failed to get cart items: ${e.toString()}');
    }
  }

  @override
  Future<CartItemModel> updateCartItem(CartItemModel cartItem) async {
    try {
      final updatedCartItem = cartItem.copyWith(updatedAt: DateTime.now());

      await firestore
          .collection('carts')
          .doc(cartItem.userId)
          .collection('items')
          .doc('${cartItem.product.id}')
          .update(updatedCartItem.toJson());

      return updatedCartItem;
    } catch (e) {
      throw ServerException('Failed to update cart item: ${e.toString()}');
    }
  }

  @override
  Future<void> removeFromCart(String userId, int productId) async {
    try {
      await firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .doc('$productId')
          .delete();
    } catch (e) {
      throw ServerException('Failed to remove item from cart: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      final batch = firestore.batch();
      final querySnapshot = await firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .get();

      for (final doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      throw ServerException('Failed to clear cart: ${e.toString()}');
    }
  }

  @override
  Future<CartItemModel?> getCartItem(String userId, int productId) async {
    try {
      final doc = await firestore
          .collection('carts')
          .doc(userId)
          .collection('items')
          .doc('$productId')
          .get();

      if (!doc.exists) return null;

      return CartItemModel.fromJson({
        ...doc.data()!,
        'id': int.tryParse(doc.id), // Convert doc.id to int
      });
    } catch (e) {
      throw ServerException('Failed to get cart item: ${e.toString()}');
    }
  }
}
