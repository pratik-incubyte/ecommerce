import 'package:cloud_firestore/cloud_firestore.dart';
import '../../features/checkout/data/datasources/checkout_remote_data_source.dart';
import '../../features/checkout/data/datasources/checkout_local_data_source.dart';
import '../../features/checkout/data/repositories/checkout_repository_impl.dart';
import '../../features/checkout/domain/repositories/checkout_repository.dart';
import '../../features/checkout/domain/usecases/calculate_checkout_usecase.dart';
import '../../features/checkout/domain/usecases/process_payment_usecase.dart';
import '../../features/checkout/domain/usecases/complete_checkout_usecase.dart';
import '../../features/checkout/presentation/bloc/checkout_bloc.dart';
import 'injection_container.dart';

/// Initialize checkout feature dependencies
Future<void> initCheckoutDependencies() async {
  // External dependencies (Firebase)
  if (!getIt.isRegistered<FirebaseFirestore>()) {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }

  // Data sources
  getIt.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(),
  );

  getIt.registerLazySingleton<CheckoutLocalDataSource>(
    () => CheckoutLocalDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
      cartRepository: getIt(),
      ordersRepository: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton(() => CalculateCheckoutUseCase(getIt()));
  getIt.registerLazySingleton(() => ProcessPaymentUseCase(getIt()));
  getIt.registerLazySingleton(() => CompleteCheckoutUseCase(getIt()));

  // Bloc
  getIt.registerFactory(
    () => CheckoutBloc(
      calculateCheckoutUseCase: getIt(),
      processPaymentUseCase: getIt(),
      completeCheckoutUseCase: getIt(),
      checkoutRepository: getIt(),
      sendOrderNotification: getIt(),
      clearCartUseCase: getIt(),
    ),
  );
}
