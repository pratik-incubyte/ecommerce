// ignore_for_file: avoid_redundant_argument_values
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart' as sqlite3;

import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

void main() {
  final bool hasSqlite = (() {
    try {
      sqlite3.sqlite3.openInMemory().dispose();
      return true;
    } catch (_) {
      return false;
    }
  })();
  
  late AppDatabase db;
  late CartLocalDataSource dataSource;

  final testProduct = Product(
    id: 1,
    title: "iPhone 15 Pro Max",
    description: "The most advanced iPhone ever with titanium design, A17 Pro chip, and professional camera system. Features a 6.7-inch Super Retina XDR display with ProMotion technology.",
    price: 1199.99,
    brand: "Apple",
    sku: "IPHONE15-PM-256GB-TITAN",
    images: const [
      "https://example.com/images/iphone15-pro-max-front.jpg",
      "https://example.com/images/iphone15-pro-max-back.jpg",
      "https://example.com/images/iphone15-pro-max-side.jpg",
    ],
    rating: 4.8,
  );

  final testDateTime = DateTime.parse("2024-01-15T10:30:00.000Z");
  
  final testCartItem = CartItem(
    id: 1,
    userId: "123",
    product: testProduct,
    quantity: 2,
    selectedVariants: const {
      "color": "Natural Titanium",
      "storage": "256GB"
    },
    createdAt: testDateTime,
    updatedAt: testDateTime,
  );

  final testProduct2 = Product(
    id: 2,
    title: "iPhone 14 Pro",
    description: "Previous generation iPhone with A16 Bionic chip and professional camera system.",
    price: 999.99,
    brand: "Apple",
    sku: "IPHONE14-PRO-128GB",
    images: const [
      "https://example.com/images/iphone14-pro-front.jpg",
    ],
    rating: 4.6,
  );

  final testCartItem2 = CartItem(
    id: 2,
    userId: "123", 
    product: testProduct2,
    quantity: 1,
    selectedVariants: const {
      "color": "Deep Purple",
      "storage": "128GB"
    },
    createdAt: testDateTime,
    updatedAt: testDateTime,
  );

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dataSource = CartLocalDataSourceImpl(database: db);
  });

  tearDown(() async {
    await db.close();
  });

  group('cacheCartItem', () {
    test('should cache cart item successfully', () async {
      await dataSource.cacheCartItem(testCartItem);
      
      final cachedItems = await dataSource.getCartItems("123");
      expect(cachedItems.length, 1);
      expect(cachedItems.first.userId, testCartItem.userId);
      expect(cachedItems.first.product.id, testCartItem.product.id);
      expect(cachedItems.first.quantity, testCartItem.quantity);
    }, skip: !hasSqlite);

    test('should throw CacheException when caching fails', () async {
      await db.close(); // Close database to simulate error
      
      expect(
        () => dataSource.cacheCartItem(testCartItem),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('cacheCartItems', () {
    test('should cache multiple cart items successfully', () async {
      final cartItems = [testCartItem, testCartItem2];
      
      await dataSource.cacheCartItems(cartItems);
      
      final cachedItems = await dataSource.getCartItems("123");
      expect(cachedItems.length, 2);
    }, skip: !hasSqlite);

    test('should throw CacheException when caching multiple items fails', () async {
      await db.close();
      
      expect(
        () => dataSource.cacheCartItems([testCartItem, testCartItem2]),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('getCartItems', () {
    test('should return empty list when no cart items exist', () async {
      final result = await dataSource.getCartItems("123");
      expect(result, isEmpty);
    }, skip: !hasSqlite);

    test('should return cart items ordered by creation date descending', () async {
      final item1 = testCartItem.copyWith(createdAt: DateTime.now());
      final item2 = testCartItem2.copyWith(
        createdAt: DateTime.now().add(const Duration(minutes: 1)),
      );
      
      await dataSource.cacheCartItem(item1);
      await dataSource.cacheCartItem(item2);
      
      final result = await dataSource.getCartItems("123");
      
      expect(result.length, 2);
      // Should be ordered by createdAt descending (newest first)
      expect(result.first.product.id, item2.product.id);
    }, skip: !hasSqlite);

    test('should only return cart items for specified user', () async {
      await dataSource.cacheCartItem(testCartItem); // user 123
      await dataSource.cacheCartItem(testCartItem2.copyWith(userId: "456")); // user 456
      
      final result = await dataSource.getCartItems("123");
      
      expect(result.length, 1);
      expect(result.first.userId, "123");
    }, skip: !hasSqlite);

    test('should throw CacheException when retrieval fails', () async {
      await db.close();
      
      expect(
        () => dataSource.getCartItems("123"),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('getCartItem', () {
    test('should return cart item when it exists', () async {
      await dataSource.cacheCartItem(testCartItem);
      
      final result = await dataSource.getCartItem("123", 1);
      
      expect(result, isNotNull);
      expect(result!.userId, testCartItem.userId);
      expect(result.product.id, testCartItem.product.id);
    }, skip: !hasSqlite);

    test('should return null when cart item does not exist', () async {
      final result = await dataSource.getCartItem("123", 999);
      expect(result, isNull);
    }, skip: !hasSqlite);

    test('should throw CacheException when retrieval fails', () async {
      await db.close();
      
      expect(
        () => dataSource.getCartItem("123", 1),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('updateCartItem', () {
    test('should update cart item successfully', () async {
      await dataSource.cacheCartItem(testCartItem);
      
      final updatedItem = testCartItem.copyWith(quantity: 5);
      await dataSource.updateCartItem(updatedItem);
      
      final result = await dataSource.getCartItem("123", 1);
      expect(result!.quantity, 5);
      expect(result.updatedAt.isAfter(testCartItem.updatedAt), true);
    }, skip: !hasSqlite);

    test('should throw CacheException when update fails', () async {
      await db.close();
      
      expect(
        () => dataSource.updateCartItem(testCartItem),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('removeCartItem', () {
    test('should remove cart item successfully', () async {
      await dataSource.cacheCartItem(testCartItem);
      await dataSource.cacheCartItem(testCartItem2);
      
      await dataSource.removeCartItem("123", 1);
      
      final remainingItems = await dataSource.getCartItems("123");
      expect(remainingItems.length, 1);
      expect(remainingItems.first.product.id, 2);
    }, skip: !hasSqlite);

    test('should not affect other users cart items', () async {
      await dataSource.cacheCartItem(testCartItem); // user 123
      await dataSource.cacheCartItem(testCartItem2.copyWith(userId: "456")); // user 456
      
      await dataSource.removeCartItem("123", 1);
      
      final user123Items = await dataSource.getCartItems("123");
      final user456Items = await dataSource.getCartItems("456");
      
      expect(user123Items, isEmpty);
      expect(user456Items.length, 1);
    }, skip: !hasSqlite);

    test('should throw CacheException when removal fails', () async {
      await db.close();
      
      expect(
        () => dataSource.removeCartItem("123", 1),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });

  group('clearCart', () {
    test('should clear all cart items for specified user', () async {
      await dataSource.cacheCartItem(testCartItem);
      await dataSource.cacheCartItem(testCartItem2);
      
      await dataSource.clearCart("123");
      
      final result = await dataSource.getCartItems("123");
      expect(result, isEmpty);
    }, skip: !hasSqlite);

    test('should not affect other users cart items when clearing', () async {
      await dataSource.cacheCartItem(testCartItem); // user 123
      await dataSource.cacheCartItem(testCartItem2.copyWith(userId: "456")); // user 456
      
      await dataSource.clearCart("123");
      
      final user123Items = await dataSource.getCartItems("123");
      final user456Items = await dataSource.getCartItems("456");
      
      expect(user123Items, isEmpty);
      expect(user456Items.length, 1);
    }, skip: !hasSqlite);

    test('should throw CacheException when clearing fails', () async {
      await db.close();
      
      expect(
        () => dataSource.clearCart("123"),
        throwsA(isA<CacheException>()),
      );
    }, skip: !hasSqlite);
  });
}
