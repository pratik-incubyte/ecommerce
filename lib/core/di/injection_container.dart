import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/app_database.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../services/firebase_auth_service.dart';
import '../services/firestore_service.dart';
import '../services/firebase_storage_service.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initCore();
  await _initFeatures();
}

Future<void> _initCore() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(connectivity: getIt()),
  );

  getIt.registerLazySingleton<DioClient>(
    () => DioClient(prefs: getIt()),
  );

  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  getIt.registerLazySingleton<FirebaseAuthService>(
    () => FirebaseAuthService(firebaseAuth: getIt()),
  );

  getIt.registerLazySingleton<FirestoreService>(
    () => FirestoreService(firestore: getIt()),
  );

  getIt.registerLazySingleton<FirebaseStorageService>(
    () => FirebaseStorageService(storage: getIt()),
  );
}

Future<void> _initFeatures() async {
  // Auth feature dependencies will be registered here
  // Products feature dependencies will be registered here
  // Cart feature dependencies will be registered here
  // Checkout feature dependencies will be registered here
  // User profile feature dependencies will be registered here
}