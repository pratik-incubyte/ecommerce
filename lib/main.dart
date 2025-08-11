import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';
import 'core/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies
  await initDependencies();
  // Set up global bloc observer for debugging
  Bloc.observer = AppBlocObserver();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}

/// Global BlocObserver for debugging and logging
class AppBlocObserver extends BlocObserver {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: true,
      printEmojis: true,
    ),
  );
  
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _logger.d('onCreate: ${bloc.runtimeType}');
  }
  
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _logger.d('onEvent: ${bloc.runtimeType}, Event: $event');
  }
  
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.d('onChange: ${bloc.runtimeType}, Change: $change');
  }
  
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.d('onTransition: ${bloc.runtimeType}, Transition: $transition');
  }
  
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _logger.e('onError: ${bloc.runtimeType}, Error: $error', error: error, stackTrace: stackTrace);
  }
  
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    _logger.d('onClose: ${bloc.runtimeType}');
  }
}
