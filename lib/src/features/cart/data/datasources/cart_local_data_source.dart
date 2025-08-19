import 'package:drift/drift.dart';
import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';

abstract class CartLocalDataSource {
  /// Get all cart items for a specific user from local database
  Future<List<CartItemModel>> getCartItems(String userId);

  /// Get a specific cart item by user and product ID
  Future<CartItemModel?> getCartItem(String userId, int productId);

  /// Cache a cart item to local database
  Future<void> cacheCartItem(CartItem cartItem);

  /// Cache multiple cart items to local database
  Future<void> cacheCartItems(List<CartItem> cartItems);

  /// Update a cart item in local database
  Future<void> updateCartItem(CartItem cartItem);

  /// Remove a cart item from local database
  Future<void> removeCartItem(String userId, int productId);

  /// Clear all cart items for a user from local database
  Future<void> clearCart(String userId);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  final AppDatabase database;

  CartLocalDataSourceImpl({required this.database});

  @override
  Future<List<CartItemModel>> getCartItems(String userId) async {
    try {
      final query = database.select(database.cartTable)
        ..where((t) => t.userId.equals(int.tryParse(userId) ?? 0))
        ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

      final rows = await query.get();
      return rows.map(CartItemModel.fromDrift).toList();
    } catch (e) {
      throw CacheException(
        'Failed to get cart items from cache: ${e.toString()}',
      );
    }
  }

  @override
  Future<CartItemModel?> getCartItem(String userId, int productId) async {
    try {
      final query = database.select(database.cartTable)
        ..where(
          (t) =>
              t.userId.equals(int.tryParse(userId) ?? 0) &
              t.productId.equals(productId),
        );

      final row = await query.getSingleOrNull();
      if (row == null) return null;

      return CartItemModel.fromDrift(row);
    } catch (e) {
      throw CacheException(
        'Failed to get cart item from cache: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> cacheCartItem(CartItem cartItem) async {
    try {
      await database
          .into(database.cartTable)
          .insert(
            CartItemModel.fromEntity(cartItem).toDriftCompanionForInsert(),
            mode: InsertMode.insertOrReplace,
          );
    } catch (e) {
      throw CacheException('Failed to cache cart item: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheCartItems(List<CartItem> cartItems) async {
    try {
      await database.batch((batch) {
        for (final cartItem in cartItems) {
          batch.insert(
            database.cartTable,
            CartItemModel.fromEntity(cartItem).toDriftCompanionForInsert(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    } catch (e) {
      throw CacheException('Failed to cache cart items: ${e.toString()}');
    }
  }

  @override
  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      final updatedCartItem = cartItem.copyWith(updatedAt: DateTime.now());

      await (database.update(database.cartTable)..where(
            (t) =>
                t.userId.equals(int.tryParse(cartItem.userId) ?? 0) &
                t.productId.equals(cartItem.product.id),
          ))
          .write(
            CartItemModel.fromEntity(
              updatedCartItem,
            ).toDriftCompanionForUpdate(),
          );
    } catch (e) {
      throw CacheException('Failed to update cart item: ${e.toString()}');
    }
  }

  @override
  Future<void> removeCartItem(String userId, int productId) async {
    try {
      await (database.delete(database.cartTable)..where(
            (t) =>
                t.userId.equals(int.tryParse(userId) ?? 0) &
                t.productId.equals(productId),
          ))
          .go();
    } catch (e) {
      throw CacheException('Failed to remove cart item: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    try {
      await (database.delete(
        database.cartTable,
      )..where((t) => t.userId.equals(int.tryParse(userId) ?? 0))).go();
    } catch (e) {
      throw CacheException('Failed to clear cart: ${e.toString()}');
    }
  }
}
