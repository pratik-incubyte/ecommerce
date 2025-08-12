import 'dart:convert';

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
}
