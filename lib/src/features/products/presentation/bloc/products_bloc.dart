import 'package:flutter_bloc/flutter_bloc.dart';
class ProductsBloc extends Bloc {
  final dynamic getProductsUseCase;
  final dynamic searchProductsUseCase;
  final dynamic getFeaturedProductsUseCase;
  ProductsBloc({
    required this.getProductsUseCase,
    required this.searchProductsUseCase,
    required this.getFeaturedProductsUseCase,
  }) : super(null);
}
