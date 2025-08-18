import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/products/domain/usecases/get_products_usecase.dart';
import 'products_event.dart';
import 'products_state.dart';

export 'products_event.dart';
export 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUseCase getProductsUseCase;

  ProductsBloc({required this.getProductsUseCase})
    : super(const ProductsState.initial()) {
    on<ProductsEvent>((event, emit) async {
      await event.when(
        getProducts: () => _onGetProducts(emit),
        refreshProducts: () => _onRefreshProducts(emit),
        searchProducts: (query) => _onSearchProducts(query, emit),
      );
    });
  }

  Future<void> _onGetProducts(Emitter<ProductsState> emit) async {
    emit(const ProductsState.loading());

    final result = await getProductsUseCase(const NoParams());

    result.fold(
      (failure) => emit(ProductsState.error(failure.message)),
      (products) => emit(ProductsState.loaded(products)),
    );
  }

  Future<void> _onRefreshProducts(Emitter<ProductsState> emit) async {
    emit(const ProductsState.loading());

    final result = await getProductsUseCase(const NoParams());

    result.fold(
      (failure) => emit(ProductsState.error(failure.message)),
      (products) => emit(ProductsState.loaded(products)),
    );
  }

  Future<void> _onSearchProducts(
    String query,
    Emitter<ProductsState> emit,
  ) async {
    emit(const ProductsState.loading());

    // For now, just get all products and filter by title
    // In a real app, you'd implement search in the repository
    final result = await getProductsUseCase(const NoParams());

    result.fold((failure) => emit(ProductsState.error(failure.message)), (
      products,
    ) {
      final filteredProducts = products
          .where(
            (product) =>
                product.title.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
      emit(ProductsState.loaded(filteredProducts));
    });
  }
}
