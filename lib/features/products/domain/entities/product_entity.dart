import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? discountPrice;
  final String category;
  final String? brand;
  final String imageUrl;
  final List<String> additionalImages;
  final int stockQuantity;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.category,
    this.brand,
    required this.imageUrl,
    this.additionalImages = const [],
    required this.stockQuantity,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFeatured = false,
    required this.createdAt,
    required this.updatedAt,
  });

  double get effectivePrice => discountPrice ?? price;
  
  double get discountPercentage {
    if (discountPrice == null) return 0;
    return ((price - discountPrice!) / price * 100);
  }

  bool get isInStock => stockQuantity > 0;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discountPrice,
        category,
        brand,
        imageUrl,
        additionalImages,
        stockQuantity,
        rating,
        reviewCount,
        isFeatured,
        createdAt,
        updatedAt,
      ];
}