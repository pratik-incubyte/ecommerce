import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/orders/data/datasources/orders_remote_data_source.dart';
import '../../features/orders/data/datasources/orders_local_data_source.dart';
import '../../features/orders/data/repositories/orders_repository_impl.dart';
import '../../features/orders/domain/repositories/orders_repository.dart';
import '../../features/orders/domain/usecases/create_order_usecase.dart';
import '../../features/orders/domain/usecases/get_orders_usecase.dart';
import '../../features/orders/domain/usecases/get_order_details_usecase.dart';
import '../../features/orders/domain/usecases/cancel_order_usecase.dart';
import '../../features/orders/presentation/bloc/orders_bloc.dart';
import 'injection_container.dart';

/// Initialize orders feature dependencies
Future<void> initOrdersDependencies() async {
  // External dependencies (Firebase)
  if (!getIt.isRegistered<FirebaseFirestore>()) {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }

  // Data sources
  getIt.registerLazySingleton<OrdersRemoteDataSource>(
    () => OrdersRemoteDataSourceImpl(firestore: getIt()),
  );

  getIt.registerLazySingleton<OrdersLocalDataSource>(
    () => OrdersLocalDataSourceImpl(database: getIt()),
  );

  // Repository
  getIt.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => CreateOrderUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrdersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrderDetailsUseCase(getIt()));
  getIt.registerLazySingleton(() => CancelOrderUseCase(getIt()));

  // Bloc
  getIt.registerFactory(
    () => OrdersBloc(
      getOrdersUseCase: getIt(),
      getOrderDetailsUseCase: getIt(),
      cancelOrderUseCase: getIt(),
    ),
  );
}
