# E-Commerce Flutter App - Clean Architecture

A comprehensive Flutter e-commerce application built with **Clean Architecture**, **Feature-first organization**, **flutter_bloc** for state management, **go_router** for navigation, and **drift** for local database management.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with a **Feature-first** organization approach:

```
lib/
├── core/                          # Shared/common code
│   ├── error/                     # Error handling, failures
│   ├── network/                   # Network utilities, interceptors
│   ├── database/                  # Drift database configuration
│   ├── utils/                     # Utility functions and extensions
│   ├── widgets/                   # Reusable widgets
│   ├── constants/                 # Application constants
│   ├── di/                        # Dependency injection setup
│   └── router/                    # Go router configuration
├── features/                      # All app features
│   ├── auth/                      # Authentication feature
│   ├── products/                  # Products feature
│   ├── cart/                      # Shopping cart feature
│   └── orders/                    # Orders feature
└── main.dart                      # Entry point
```

### Each Feature Structure
```
feature/
├── data/                          # Data layer
│   ├── datasources/               # Remote and local data sources
│   ├── models/                    # DTOs and data models
│   └── repositories/              # Repository implementations
├── domain/                        # Domain layer
│   ├── entities/                  # Business objects
│   ├── repositories/              # Repository interfaces
│   └── usecases/                  # Business logic use cases
└── presentation/                  # Presentation layer
    ├── bloc/                      # Bloc/Cubit state management
    ├── pages/                     # Screen widgets
    └── widgets/                   # Feature-specific widgets
```

## 🔧 Tech Stack

### Core Technologies
- **Flutter**: UI framework
- **Dart**: Programming language

### Architecture & Patterns
- **Clean Architecture**: Separation of concerns with dependency inversion
- **Feature-first**: Organized by features instead of technical layers
- **Repository Pattern**: Single source of truth for data
- **Use Cases**: Encapsulated business logic

### State Management
- **flutter_bloc**: Predictable state management
- **Freezed**: Immutable state classes and union types
- **Equatable**: Value equality for state comparison

### Navigation
- **go_router**: Declarative routing with deep linking support

### Networking & Data
- **dio**: HTTP client with interceptors
- **connectivity_plus**: Network connectivity detection
- **drift**: Type-safe SQL database with migrations
- **sqlite3_flutter_libs**: SQLite support

### Dependency Injection
- **get_it**: Service locator pattern

### Functional Programming
- **dartz**: Functional programming utilities (Either, Option)

### Utilities
- **logger**: Structured logging
- **intl**: Internationalization
- **path_provider**: File system paths

### Development Tools
- **build_runner**: Code generation
- **freezed**: Code generation for immutable classes
- **json_serializable**: JSON serialization
- **flutter_lints**: Lint rules

### Testing
- **mocktail**: Mocking for tests
- **bloc_test**: Testing utilities for blocs

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.8.1)
- Dart SDK
- Android Studio/VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ecommerce
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 🏛️ Clean Architecture Layers

### 1. Domain Layer (innermost)
- **Entities**: Business objects (e.g., User, Product, Order)
- **Repositories**: Abstract interfaces for data access
- **Use Cases**: Business logic and application rules
- **Failures**: Custom error types

### 2. Data Layer
- **Models**: DTOs for API/Database
- **Data Sources**: Remote (API) and Local (Database) implementations
- **Repositories**: Concrete implementations of domain interfaces

### 3. Presentation Layer (outermost)
- **Pages**: UI screens
- **Widgets**: UI components
- **Blocs**: State management with events and states

## 🔄 State Management with flutter_bloc

### Bloc Pattern Implementation
```dart
// Events
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({required String email, required String password}) = _Login;
  const factory AuthEvent.logout() = _Logout;
}

// States
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserEntity user) = _Authenticated;
  const factory AuthState.error(Failure failure) = _Error;
}

// Bloc
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  
  AuthBloc({required this.loginUseCase}) : super(const AuthState.initial());
}
```

## 🗄️ Database with Drift

### Table Definitions
```dart
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().unique()();
  TextColumn get firstName => text()();
  // ... more columns
}
```

### Database Class
```dart
@DriftDatabase(tables: [UserTable, ProductTable, CartTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
}
```

## 🔗 Navigation with go_router

### Route Configuration
```dart
GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductsPage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailsPage(id: state.params['id']!),
    ),
  ],
)
```

## 🧪 Error Handling with Dartz

### Either Pattern
```dart
// Use case returns Either<Failure, Success>
Future<Either<Failure, User>> getUser(String id) async {
  try {
    final user = await dataSource.getUser(id);
    return Right(user);
  } catch (e) {
    return Left(ServerFailure());
  }
}

// In bloc
result.fold(
  (failure) => emit(AuthState.error(failure)),
  (user) => emit(AuthState.authenticated(user)),
);
```

## 📱 Features

- **Authentication**: Login, Register, Logout
- **Products**: Browse, Search, View Details
- **Shopping Cart**: Add/Remove items, Update quantities
- **Orders**: Place orders, View order history
- **Offline Support**: Local database caching
- **Error Handling**: Comprehensive error management
- **Loading States**: Proper loading indicators
- **Navigation**: Deep linking support

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📝 Code Generation

This project uses code generation for:
- **Freezed**: Immutable classes and union types
- **JSON Serializable**: JSON serialization/deserialization
- **Drift**: Database code generation

Run code generation:
```bash
flutter packages pub run build_runner build
```

Watch for changes:
```bash
flutter packages pub run build_runner watch
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Clean Architecture by Robert C. Martin
- Flutter team for the amazing framework
- Community packages that make development easier
