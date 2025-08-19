import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Data Sources
import 'package:ecommerce/src/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:ecommerce/src/features/profile/data/datasources/profile_local_data_source.dart';

// Repositories
import 'package:ecommerce/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:ecommerce/src/features/profile/data/repositories/profile_repository_impl.dart';

// Use Cases
import 'package:ecommerce/src/features/profile/domain/usecases/get_current_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/update_profile_picture_usecase.dart';
import 'package:ecommerce/src/features/profile/domain/usecases/change_password_usecase.dart';

// Bloc
import 'package:ecommerce/src/features/profile/presentation/bloc/profile_bloc.dart';

final getIt = GetIt.instance;

/// Initialize profile feature dependencies
void initProfileDependencies() {
  // External dependencies (Firebase) - register if not already registered
  if (!getIt.isRegistered<FirebaseFirestore>()) {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }
  
  if (!getIt.isRegistered<FirebaseStorage>()) {
    getIt.registerLazySingleton<FirebaseStorage>(
      () => FirebaseStorage.instance,
    );
  }

  // Data sources
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
      firebaseStorage: getIt<FirebaseStorage>(),
    ),
  );

  getIt.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );

  // Repository
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: getIt<ProfileRemoteDataSource>(),
      localDataSource: getIt<ProfileLocalDataSource>(),
      networkInfo: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<GetCurrentProfileUseCase>(
    () => GetCurrentProfileUseCase(getIt<ProfileRepository>()),
  );

  getIt.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(getIt<ProfileRepository>()),
  );

  getIt.registerLazySingleton<UpdateProfilePictureUseCase>(
    () => UpdateProfilePictureUseCase(getIt<ProfileRepository>()),
  );

  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(getIt<ProfileRepository>()),
  );

  // Bloc
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(
      getCurrentProfile: getIt<GetCurrentProfileUseCase>(),
      updateProfile: getIt<UpdateProfileUseCase>(),
      updateProfilePicture: getIt<UpdateProfilePictureUseCase>(),
      changePassword: getIt<ChangePasswordUseCase>(),
    ),
  );
}
