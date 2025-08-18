import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/features/products/domain/usecases/get_product_details_usecase.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

export 'product_details_event.dart';
export 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  ProductDetailsBloc({required this.getProductDetailsUseCase})
    : super(const ProductDetailsState.initial()) {
    on<ProductDetailsEvent>((event, emit) async {
      await event.when(
        getProductDetails: (productId) => _onGetProductDetails(productId, emit),
      );
    });
  }

  Future<void> _onGetProductDetails(
    int productId,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(const ProductDetailsState.loading());

    final result = await getProductDetailsUseCase(
      GetProductParams(id: productId),
    );

    result.fold(
      (failure) => emit(ProductDetailsState.error(failure.message)),
      (product) => emit(ProductDetailsState.loaded(product)),
    );
  }
}
