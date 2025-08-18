import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_event.freezed.dart';

@freezed
sealed class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.getProductDetails({
    required int productId,
  }) = _GetProductDetails;
}
