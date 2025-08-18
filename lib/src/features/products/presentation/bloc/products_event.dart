import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_event.freezed.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.getProducts() = _GetProducts;
  const factory ProductsEvent.refreshProducts() = _RefreshProducts;
  const factory ProductsEvent.searchProducts(String query) = _SearchProducts;
}
