import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final String brand;
  final double price;
  final String sku;
  final List<String> images;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.sku,
    required this.images,
    required this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    brand,
    sku,
    images,
    rating,
  ];
}
