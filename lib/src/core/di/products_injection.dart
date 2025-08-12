import '../../features/products/data/datasources/products_remote_data_source.dart';
import '../../features/products/data/datasources/products_local_data_source.dart';
import '../../features/products/data/repositories/products_repository_impl.dart';
import '../../features/products/domain/repositories/products_repository.dart';
import '../../features/products/domain/usecases/get_products_usecase.dart';
import '../../features/products/domain/usecases/get_product_details_usecase.dart';
import '../../features/products/presentation/bloc/products_bloc.dart';
import '../../features/products/presentation/bloc/product_details_bloc.dart';
import 'injection_container.dart';

/// Initialize products feature dependencies
Future<void> initProductsDependencies() async {
  // Data sources
  getIt.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(
      dioClient: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<ProductsLocalDataSource>(
    () => ProductsLocalDataSourceImpl(
      database: getIt(),
    ),
  );
  
  // Repository
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  
  // Use cases
  getIt.registerLazySingleton(() => GetProductsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProductDetailsUseCase(getIt()));
  
  // Blocs
  getIt.registerFactory(
    () => ProductsBloc(
      getProductsUseCase: getIt(),
      searchProductsUseCase: getIt(),
      getFeaturedProductsUseCase: getIt(),
    ),
  );
  
  getIt.registerFactory(
    () => ProductDetailsBloc(
      getProductDetailsUseCase: getIt(),
    ),
  );
}
