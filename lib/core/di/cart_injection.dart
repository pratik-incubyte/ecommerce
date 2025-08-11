import '../../features/cart/data/datasources/cart_local_data_source.dart';
import '../../features/cart/data/repositories/cart_repository_impl.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/domain/usecases/get_cart_items_usecase.dart';
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart';
import '../../features/cart/domain/usecases/update_cart_item_usecase.dart';
import '../../features/cart/domain/usecases/remove_from_cart_usecase.dart';
import '../../features/cart/domain/usecases/clear_cart_usecase.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import 'injection_container.dart';

/// Initialize cart feature dependencies
Future<void> initCartDependencies() async {
  // Data sources
  getIt.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(
      database: getIt(),
    ),
  );
  
  // Repository
  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      localDataSource: getIt(),
    ),
  );
  
  // Use cases
  getIt.registerLazySingleton(() => GetCartItemsUseCase(getIt()));
  getIt.registerLazySingleton(() => AddToCartUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateCartItemUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveFromCartUseCase(getIt()));
  getIt.registerLazySingleton(() => ClearCartUseCase(getIt()));
  
  // Bloc
  getIt.registerFactory(
    () => CartBloc(
      getCartItemsUseCase: getIt(),
      addToCartUseCase: getIt(),
      updateCartItemUseCase: getIt(),
      removeFromCartUseCase: getIt(),
      clearCartUseCase: getIt(),
    ),
  );
}
