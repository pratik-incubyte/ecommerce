import 'dart:convert';

import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../../../fixtures/fixture_reader.dart';

@GenerateMocks([])
void main() {
  final testProduct = ProductModel(
    id: 1,
    title: "iPhone 15 Pro Max",
    description:
        "The most advanced iPhone ever with titanium design, A17 Pro chip, and professional camera system. Features a 6.7-inch Super Retina XDR display with ProMotion technology.",
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

  final cartItemModel = CartItemModel(
    id: 1,
    userId: "user123",
    product: testProduct,
    quantity: 2,
    selectedVariants: const {"color": "Natural Titanium", "storage": "256GB"},
    createdAt: testDateTime,
    updatedAt: testDateTime,
  );

  final Map<String, dynamic> jsonMap = json.decode(fixture('cart_item.json'));

  test('should be a subclass of CartItem entity', () async {
    expect(cartItemModel, isA<CartItem>());
  });

  test(
    "should return CartItemModel when a json data passed to fromJson method",
    () {
      final result = CartItemModel.fromJson(jsonMap);
      expect(result, cartItemModel);
    },
  );

  test("should return json data when toJson is called on CartItemModel", () {
    final result = cartItemModel.toJson();
    expect(result, jsonMap);
  });

  group('entity conversions', () {
    test(
      'fromEntity should create a CartItemModel identical to input entity',
      () {
        final entity = CartItem(
          id: 1,
          userId: "user123",
          product: testProduct,
          quantity: 2,
          selectedVariants: const {
            "color": "Natural Titanium",
            "storage": "256GB",
          },
          createdAt: testDateTime,
          updatedAt: testDateTime,
        );

        final result = CartItemModel.fromEntity(entity);

        expect(result, cartItemModel);
      },
    );

    test('toEntity should create a CartItem equal to expected entity', () {
      final expected = CartItem(
        id: 1,
        userId: "user123",
        product: testProduct,
        quantity: 2,
        selectedVariants: const {
          "color": "Natural Titanium",
          "storage": "256GB",
        },
        createdAt: testDateTime,
        updatedAt: testDateTime,
      );

      final result = cartItemModel.toEntity();

      expect(result, expected);
    });
  });

  group('Drift mapping', () {
    test('fromDrift should map database data to CartItemModel', () {
      final data = CartTableData(
        id: 1,
        userId: 123,
        productId: 1,
        productServerId: "IPHONE15-PM-256GB-TITAN",
        productName: "iPhone 15 Pro Max",
        productPrice: 1199.99,
        productDiscountPrice: null,
        productThumbnail:
            "https://example.com/images/iphone15-pro-max-front.jpg",
        quantity: 2,
        selectedVariants: jsonEncode({
          "color": "Natural Titanium",
          "storage": "256GB",
        }),
        createdAt: testDateTime,
        updatedAt: testDateTime,
      );

      final result = CartItemModel.fromDrift(data);

      expect(result.id, 1);
      expect(result.userId, '123');
      expect(result.product.id, 1);
      expect(result.product.title, 'iPhone 15 Pro Max');
      expect(result.product.price, 1199.99);
      expect(result.product.sku, 'IPHONE15-PM-256GB-TITAN');
      expect(result.quantity, 2);
      expect(result.selectedVariants?['color'], 'Natural Titanium');
      expect(result.selectedVariants?['storage'], '256GB');
      expect(result.createdAt, testDateTime);
      expect(result.updatedAt, testDateTime);
    });

    test(
      'fromDrift should handle null/empty fields and invalid variants json',
      () {
        final withNulls = CartTableData(
          id: 1,
          userId: 123,
          productId: 1,
          productServerId: null,
          productName: 'Sample Product',
          productPrice: 10.0,
          productDiscountPrice: null,
          productThumbnail: null,
          quantity: 1,
          selectedVariants: null,
          createdAt: testDateTime,
          updatedAt: testDateTime,
        );
        final resultNulls = CartItemModel.fromDrift(withNulls);
        expect(resultNulls.product.sku, '');
        expect(resultNulls.product.images, isEmpty);
        expect(resultNulls.selectedVariants, null);

        final withInvalidVariants = CartTableData(
          id: 1,
          userId: 123,
          productId: 1,
          productServerId: 'SKU123',
          productName: 'Sample Product',
          productPrice: 10.0,
          productDiscountPrice: null,
          productThumbnail: null,
          quantity: 1,
          selectedVariants: 'not-a-json',
          createdAt: testDateTime,
          updatedAt: testDateTime,
        );
        final resultInvalidVariants = CartItemModel.fromDrift(
          withInvalidVariants,
        );
        expect(resultInvalidVariants.selectedVariants, null);
      },
    );

    test(
      'toDriftCompanion should map model to companion with all values present',
      () {
        final companion = cartItemModel.toDriftCompanion();

        expect(companion.id.present, isTrue);
        expect(companion.id.value, 1);
        expect(companion.userId.present, isTrue);
        expect(
          companion.userId.value,
          0,
        ); // int.tryParse("user123") returns null, defaults to 0
        expect(companion.productId.present, isTrue);
        expect(companion.productId.value, cartItemModel.product.id);
        expect(companion.productName.present, isTrue);
        expect(companion.productName.value, cartItemModel.product.title);
        expect(companion.productPrice.present, isTrue);
        expect(companion.productPrice.value, cartItemModel.product.price);
        expect(companion.quantity.present, isTrue);
        expect(companion.quantity.value, cartItemModel.quantity);
        expect(companion.selectedVariants.present, isTrue);
        expect(
          companion.selectedVariants.value,
          jsonEncode(cartItemModel.selectedVariants),
        );
        expect(companion.createdAt.present, isTrue);
        expect(companion.createdAt.value, cartItemModel.createdAt);
        expect(companion.updatedAt.present, isTrue);
        expect(companion.updatedAt.value, cartItemModel.updatedAt);
      },
    );

    test('toDriftCompanionForInsert should exclude id and include others', () {
      final companion = cartItemModel.toDriftCompanionForInsert();

      expect(companion.id.present, isFalse);
      expect(companion.userId.present, isTrue);
      expect(companion.userId.value, 0);
      expect(companion.productId.present, isTrue);
      expect(companion.productId.value, cartItemModel.product.id);
      expect(companion.productName.present, isTrue);
      expect(companion.productName.value, cartItemModel.product.title);
      expect(companion.productPrice.present, isTrue);
      expect(companion.productPrice.value, cartItemModel.product.price);
      expect(companion.quantity.present, isTrue);
      expect(companion.quantity.value, cartItemModel.quantity);
    });

    test('toDriftCompanionForUpdate should exclude id and include others', () {
      final companion = cartItemModel.toDriftCompanionForUpdate();

      expect(companion.id.present, isFalse);
      expect(companion.userId.present, isTrue);
      expect(companion.userId.value, 0);
      expect(companion.productId.present, isTrue);
      expect(companion.productId.value, cartItemModel.product.id);
      expect(companion.quantity.present, isTrue);
      expect(companion.quantity.value, cartItemModel.quantity);
      expect(companion.selectedVariants.present, isTrue);
      expect(
        companion.selectedVariants.value,
        jsonEncode(cartItemModel.selectedVariants),
      );
    });
  });

  group('totalPrice calculation', () {
    test('should correctly calculate total price', () {
      expect(cartItemModel.totalPrice, 2399.98);
    });
  });

  group('copyWith method', () {
    test('should create a new instance with updated values', () {
      final updated = cartItemModel.copyWith(quantity: 3, userId: "user456");

      expect(updated.quantity, 3);
      expect(updated.userId, "user456");
      expect(updated.id, cartItemModel.id); // unchanged
      expect(updated.product, cartItemModel.product); // unchanged
      expect(
        updated.totalPrice,
        closeTo(3599.97, 0.01),
      ); // recalculated (with floating point tolerance)
    });
  });
}
