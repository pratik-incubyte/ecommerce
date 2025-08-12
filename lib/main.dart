import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart' as di;
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/domain/usecases/sign_in_usecase.dart';
import 'features/auth/domain/usecases/sign_up_usecase.dart';
import 'features/auth/domain/usecases/sign_out_usecase.dart';
import 'features/auth/domain/usecases/get_current_user_usecase.dart';
import 'features/auth/domain/usecases/watch_auth_state_usecase.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Initialize dependencies
  await di.initDependencies();
  
  // Register auth dependencies
  _registerAuthDependencies();
  
  runApp(const MyApp());
}

void _registerAuthDependencies() {
  // Data sources
  di.getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      authService: di.getIt(),
      firestoreService: di.getIt(),
    ),
  );
  
  di.getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: di.getIt(),
      database: di.getIt(),
    ),
  );
  
  // Repository
  di.getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: di.getIt(),
      localDataSource: di.getIt(),
      networkInfo: di.getIt(),
    ),
  );
  
  // Use cases
  di.getIt.registerLazySingleton(() => SignInUseCase(di.getIt()));
  di.getIt.registerLazySingleton(() => SignUpUseCase(di.getIt()));
  di.getIt.registerLazySingleton(() => SignOutUseCase(di.getIt()));
  di.getIt.registerLazySingleton(() => GetCurrentUserUseCase(di.getIt()));
  di.getIt.registerLazySingleton(() => WatchAuthStateUseCase(di.getIt()));
  
  // Bloc
  di.getIt.registerFactory(
    () => AuthBloc(
      signInUseCase: di.getIt(),
      signUpUseCase: di.getIt(),
      signOutUseCase: di.getIt(),
      getCurrentUserUseCase: di.getIt(),
      watchAuthStateUseCase: di.getIt(),
      authRepository: di.getIt(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = di.getIt<AuthBloc>();
    final appRouter = AppRouter(authBloc: authBloc);
    
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => authBloc..add(const CheckAuthStatus()),
        ),
      ],
      child: MaterialApp.router(
        title: 'E-Commerce App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: appRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
