import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/cart_table.dart';
import '../tables/product_table.dart';

part 'cart_dao.g.dart';

class CartItemWithProduct {
  final CartItem cartItem;
  final Product product;

  CartItemWithProduct({
    required this.cartItem,
    required this.product,
  });
}

@DriftAccessor(tables: [CartItems, Products])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  CartDao(AppDatabase db) : super(db);

  Future<List<CartItemWithProduct>> getCartItems(String userId) async {
    final query = select(cartItems).join([
      innerJoin(
        products,
        products.productId.equalsExp(cartItems.productId),
      ),
    ])
      ..where(cartItems.userId.equals(userId))
      ..orderBy([OrderingTerm.desc(cartItems.addedAt)]);

    final result = await query.get();
    return result.map((row) {
      return CartItemWithProduct(
        cartItem: row.readTable(cartItems),
        product: row.readTable(products),
      );
    }).toList();
  }

  Stream<List<CartItemWithProduct>> watchCartItems(String userId) {
    final query = select(cartItems).join([
      innerJoin(
        products,
        products.productId.equalsExp(cartItems.productId),
      ),
    ])
      ..where(cartItems.userId.equals(userId))
      ..orderBy([OrderingTerm.desc(cartItems.addedAt)]);

    return query.watch().map((rows) {
      return rows.map((row) {
        return CartItemWithProduct(
          cartItem: row.readTable(cartItems),
          product: row.readTable(products),
        );
      }).toList();
    });
  }

  Future<CartItem?> getCartItem(String userId, String productId) {
    return (select(cartItems)
          ..where((tbl) =>
              tbl.userId.equals(userId) & tbl.productId.equals(productId)))
        .getSingleOrNull();
  }

  Future<int> addToCart(String userId, String productId, int quantity) async {
    final existingItem = await getCartItem(userId, productId);
    
    if (existingItem != null) {
      return await updateQuantity(
        existingItem.id,
        existingItem.quantity + quantity,
      );
    } else {
      return await into(cartItems).insert(
        CartItemsCompanion(
          userId: Value(userId),
          productId: Value(productId),
          quantity: Value(quantity),
        ),
      );
    }
  }

  Future<int> updateQuantity(int cartItemId, int quantity) {
    return (update(cartItems)..where((tbl) => tbl.id.equals(cartItemId)))
        .write(CartItemsCompanion(quantity: Value(quantity)));
  }

  Future<int> removeFromCart(int cartItemId) {
    return (delete(cartItems)..where((tbl) => tbl.id.equals(cartItemId))).go();
  }

  Future<int> clearCart(String userId) {
    return (delete(cartItems)..where((tbl) => tbl.userId.equals(userId))).go();
  }

  Future<int> getCartItemCount(String userId) async {
    final countExp = cartItems.id.count();
    final query = selectOnly(cartItems)
      ..addColumns([countExp])
      ..where(cartItems.userId.equals(userId));
    
    final result = await query.getSingle();
    return result.read(countExp) ?? 0;
  }

  Future<double> getCartTotal(String userId) async {
    final query = select(cartItems).join([
      innerJoin(
        products,
        products.productId.equalsExp(cartItems.productId),
      ),
    ])
      ..where(cartItems.userId.equals(userId));

    final result = await query.get();
    double total = 0;
    for (final row in result) {
      final cartItem = row.readTable(cartItems);
      final product = row.readTable(products);
      final price = product.discountPrice ?? product.price;
      total += price * cartItem.quantity;
    }
    return total;
  }

  Stream<double> watchCartTotal(String userId) {
    return watchCartItems(userId).map((items) {
      double total = 0;
      for (final item in items) {
        final price = item.product.discountPrice ?? item.product.price;
        total += price * item.cartItem.quantity;
      }
      return total;
    });
  }

  Stream<int> watchCartItemCount(String userId) {
    return watchCartItems(userId).map((items) {
      int count = 0;
      for (final item in items) {
        count += item.cartItem.quantity;
      }
      return count;
    });
  }
}