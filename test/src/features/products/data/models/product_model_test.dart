import 'dart:convert';

import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/features/products/data/models/product_model.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../../../../fixtures/fixture_reader.dart';

@GenerateMocks([])
void main() {
  final productModel = ProductModel(
    id: 1,
    title: "iPhone 15 Pro Max",
    description:
        "The most advanced iPhone ever with titanium design, A17 Pro chip, and professional camera system. Features a 6.7-inch Super Retina XDR display with ProMotion technology.",
    price: 1199.99,
    brand: "Apple",
    sku: "IPHONE15-PM-256GB-TITAN",
    images: [
      "https://example.com/images/iphone15-pro-max-front.jpg",
      "https://example.com/images/iphone15-pro-max-back.jpg",
      "https://example.com/images/iphone15-pro-max-side.jpg",
    ],
    rating: 4.8,
  );

  final Map<String, dynamic> jsonMap = json.decode(fixture('product.json'));

  test('should be a subclass of NumberTrivia entity', () async {
    expect(productModel, isA<Product>());
  });
  test(
    "should return ProductModel when a json data passed to fromJson method",
    () {
      final result = ProductModel.fromJson(jsonMap);
      expect(result, productModel);
    },
  );
  test("should return json data when toJson is called on ProductModel", () {
    final result = productModel.toJson();
    expect(result, jsonMap);
  });

  group('entity conversions', () {
    test('fromEntity should create a ProductModel identical to input entity', () {
      final entity = Product(
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

      final result = ProductModel.fromEntity(entity);

      expect(result, productModel);
    });

    test('toEntity should create a Product equal to expected entity', () {
      final expected = Product(
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

      final result = productModel.toEntity();

      expect(result, expected);
    });
  });

  group('Drift mapping', () {
    test('fromDrift should map database data to ProductModel with defaults', () {
      final data = ProductTableData(
        id: '1',
        name: "iPhone 15 Pro Max",
        description:
            "The most advanced iPhone ever with titanium design, A17 Pro chip, and professional camera system. Features a 6.7-inch Super Retina XDR display with ProMotion technology.",
        price: 1199.99,
        brand: "Apple",
        sku: "IPHONE15-PM-256GB-TITAN",
        images: jsonEncode([
          "https://example.com/images/iphone15-pro-max-front.jpg",
          "https://example.com/images/iphone15-pro-max-back.jpg",
          "https://example.com/images/iphone15-pro-max-side.jpg",
        ]),
      );

      final result = ProductModel.fromDrift(data);

      expect(result.id, 1);
      expect(result.title, 'iPhone 15 Pro Max');
      expect(result.description, isNotEmpty);
      expect(result.brand, 'Apple');
      expect(result.price, 1199.99);
      expect(result.sku, 'IPHONE15-PM-256GB-TITAN');
      expect(result.images.length, 3);
      expect(result.rating, 0.0); // default rating from DB
    });

    test(
      'fromDrift should handle null/empty fields and invalid images json',
      () {
        final withNulls = ProductTableData(
          id: null,
          name: 'Sample',
          description: null,
          price: 10.0,
          brand: null,
          sku: null,
          images: null,
        );
        final resultNulls = ProductModel.fromDrift(withNulls);
        expect(resultNulls.id, 0);
        expect(resultNulls.description, '');
        expect(resultNulls.brand, '');
        expect(resultNulls.sku, '');
        expect(resultNulls.images, isEmpty);

        final withEmptyImages = ProductTableData(
          id: '2',
          name: 'Sample',
          description: '',
          price: 10.0,
          brand: '',
          sku: '',
          images: '',
        );
        final resultEmptyImages = ProductModel.fromDrift(withEmptyImages);
        expect(resultEmptyImages.images, isEmpty);

        final withInvalidImages = ProductTableData(
          id: '3',
          name: 'Sample',
          description: '',
          price: 10.0,
          brand: '',
          sku: '',
          images: 'not-a-json',
        );
        final resultInvalidImages = ProductModel.fromDrift(withInvalidImages);
        expect(resultInvalidImages.images, isEmpty);
      },
    );

    test(
      'toDriftCompanion should map model to companion with all values present',
      () {
        final companion = productModel.toDriftCompanion();

        expect(companion.id.present, isTrue);
        expect(companion.id.value, '1');
        expect(companion.name.present, isTrue);
        expect(companion.name.value, productModel.title);
        expect(companion.description.present, isTrue);
        expect(companion.description.value, productModel.description);
        expect(companion.price.present, isTrue);
        expect(companion.price.value, productModel.price);
        expect(companion.brand.present, isTrue);
        expect(companion.brand.value, productModel.brand);
        expect(companion.sku.present, isTrue);
        expect(companion.sku.value, productModel.sku);
        expect(companion.images.present, isTrue);
        expect(companion.images.value, jsonEncode(productModel.images));
      },
    );

    test('toDriftCompanionForInsert should exclude id and include others', () {
      final companion = productModel.toDriftCompanionForInsert();

      expect(companion.id.present, isFalse);
      expect(companion.name.present, isTrue);
      expect(companion.name.value, productModel.title);
      expect(companion.price.present, isTrue);
      expect(companion.price.value, productModel.price);
      expect(companion.description.present, isTrue);
      expect(companion.description.value, productModel.description);
      expect(companion.brand.present, isTrue);
      expect(companion.brand.value, productModel.brand);
      expect(companion.sku.present, isTrue);
      expect(companion.sku.value, productModel.sku);
      expect(companion.images.present, isTrue);
      expect(companion.images.value, jsonEncode(productModel.images));
    });
  });
}
