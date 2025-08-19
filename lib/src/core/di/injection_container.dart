import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Core
import '../network/network_info.dart';
import '../network/dio_client.dart';
import '../database/database.dart';

// Features
import 'auth_injection.dart';
import 'cart_injection.dart';
import 'checkout_injection.dart';
import 'notification_injection.dart';
import 'orders_injection.dart';
import 'products_injection.dart';
import 'profile_injection.dart';

/// Service locator instance
final getIt = GetIt.instance;

/// Initialize all dependencies
Future<void> initDependencies() async {
  // Core dependencies
  await _initCore();

  // Feature dependencies
  await initAuthDependencies();
  await initProductsDependencies();
  await initCartDependencies();
  await initOrdersDependencies();
  await initCheckoutDependencies();
  initNotificationDependencies(getIt);
  initProfileDependencies();
}

/// Initialize core dependencies
Future<void> _initCore() async {
  // External dependencies
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<Dio>(() => Dio());
  
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  

  // Network
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt<Connectivity>()),
  );

  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
}

/// Clean up resources
Future<void> disposeDependencies() async {
  await getIt<AppDatabase>().close();
  await getIt.reset();
}
