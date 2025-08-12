import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ecommerce/src/core/database/database.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.brand,
    required super.sku,
    required super.images,
    required super.rating,
  });

  /// Creates a [ProductModel] from a JSON map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      brand: json['brand'] as String,
      price: (json['price'] as num).toDouble(),
      sku: json['sku'] as String,
      images: List<String>.from(json['images'] as List),
      rating: (json['rating'] as num).toDouble(),
    );
  }

  /// Converts this [ProductModel] to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'brand': brand,
      'price': price,
      'sku': sku,
      'images': images,
      'rating': rating,
    };
  }

  /// Creates a [ProductModel] from a [Product] entity
  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      description: product.description,
      brand: product.brand,
      price: product.price,
      sku: product.sku,
      images: product.images,
      rating: product.rating,
    );
  }

  /// Converts this [ProductModel] to a [Product] entity
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      brand: brand,
      price: price,
      sku: sku,
      images: images,
      rating: rating,
    );
  }

  /// Creates a [ProductModel] from Drift [ProductTableData]
  factory ProductModel.fromDrift(ProductTableData data) {
    // Parse images from JSON string to List<String>
    List<String> imagesList = [];
    if (data.images != null && data.images!.isNotEmpty) {
      try {
        final dynamic decoded = jsonDecode(data.images!);
        if (decoded is List) {
          imagesList = decoded.cast<String>();
        }
      } catch (e) {
        // If JSON parsing fails, treat as empty list
        imagesList = [];
      }
    }

    return ProductModel(
      id: int.tryParse(data.id ?? '0') ?? 0, // Convert String id to int, default to 0
      title: data.name, // Map 'name' from database to 'title' in entity
      description: data.description ?? '',
      brand: data.brand ?? '',
      price: data.price,
      sku: data.sku ?? '',
      images: imagesList,
      rating: 0.0, // Default rating since it's not in the database table
    );
  }

  /// Converts this [ProductModel] to a Drift [ProductTableCompanion]
  ProductTableCompanion toDriftCompanion() {
    return ProductTableCompanion(
      id: Value(id.toString()), // Convert int id to String for database
      name: Value(title), // Map 'title' from entity to 'name' in database
      description: Value(description),
      price: Value(price),
      brand: Value(brand),
      sku: Value(sku),
      images: Value(jsonEncode(images)), // Convert List<String> to JSON string
    );
  }

  /// Converts this [ProductModel] to a Drift [ProductTableCompanion] for inserts
  /// (excludes id to let database generate it if needed)
  ProductTableCompanion toDriftCompanionForInsert() {
    return ProductTableCompanion.insert(
      name: title, // Map 'title' from entity to 'name' in database
      price: price,
      description: Value(description),
      brand: Value(brand),
      sku: Value(sku),
      images: Value(jsonEncode(images)), // Convert List<String> to JSON string
    );
  }
}
