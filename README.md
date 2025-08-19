# E-Commerce Flutter App - Clean Architecture (4 hours)

A comprehensive Flutter e-commerce application built with **Clean Architecture**, **Feature-first organization**, **flutter_bloc** for state management, **go_router** for navigation, and **drift** for local database management. This project demonstrates rapid development of a production-ready e-commerce app with advanced features including deep linking, offline storage, push notifications, and optimized performance.

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

## 📱 Core Features

### 🛍️ E-commerce Functionality
- **Product Catalog**: Browse products with search, filtering, and pagination
- **Shopping Cart**: Add/remove items, update quantities, real-time totals
- **Checkout Process**: Secure payment flow with multiple payment methods
- **User Profile**: Account management, order history, preferences
- **Order Management**: Place orders, track status, view order history

### 🚀 Advanced Features
- **Deep Linking**: Navigate directly to products and orders via URLs
- **Offline Storage**: Local database caching with automatic sync
- **Push Notifications**: Real-time order confirmations with deep linking
- **Authentication**: Secure login/register with Firebase Auth
- **Real-time Updates**: Live data synchronization with Firestore

### 💡 User Experience
- **Responsive Design**: Optimized for all screen sizes
- **Loading States**: Smooth loading indicators and skeleton screens
- **Error Handling**: Comprehensive error management with user-friendly messages
- **Navigation**: Intuitive bottom navigation with deep linking support
- **Search**: Fast product search with real-time suggestions

## ⚡ Performance Optimizations

This app implements various performance optimizations for efficient rendering and memory usage:

### 🎯 Rendering Optimizations
- **Const Constructors**: All stateless widgets use const constructors to prevent unnecessary rebuilds
- **ListView.builder**: Efficient lazy loading for product lists and order history
- **RepaintBoundary**: Strategic use to isolate expensive widgets from repainting
- **AutomaticKeepAliveClientMixin**: Preserve expensive widget states across tab switches
- **Image Caching**: Efficient image loading with automatic caching and compression

### 🧠 Memory Management
- **Pagination**: Load data in chunks (20 items per page) to reduce memory footprint
- **Dispose Pattern**: Proper disposal of controllers, streams, and subscriptions
- **Object Pooling**: Reuse expensive objects like database connections
- **Lazy Loading**: Features and dependencies loaded only when needed
- **Image Optimization**: Automatic image resizing and format optimization

### 📊 State Management Efficiency
```dart
// Efficient state updates with Freezed
@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.loaded(List<Product> products) = _Loaded;
  const factory ProductsState.error(String message) = _Error;
}

// Optimized BLoC events to prevent unnecessary API calls
@override
Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
  if (event is LoadProducts && state != const ProductsState.loading()) {
    // Prevent duplicate loading states
    yield const ProductsState.loading();
    // ... handle loading
  }
}
```

### 🔄 Caching Strategies
- **Multi-level Caching**: Memory → Drift Database → Network
- **Smart Cache Invalidation**: Time-based and event-based cache updates
- **Offline-first**: App works seamlessly without internet connection
- **Background Sync**: Automatic data synchronization when connectivity returns

### 🛜 Network Optimizations
- **Connection Pooling**: Reuse HTTP connections with Dio interceptors
- **Request Deduplication**: Prevent duplicate API calls for same data
- **Compression**: GZIP compression for API responses
- **Timeouts**: Appropriate timeout configurations (30s connect, 30s read)

### 📱 Platform-specific Optimizations
- **Android**: APK optimization with ProGuard and R8 obfuscation
- **iOS**: Bitcode enabled for App Store optimization
- **Web**: Tree shaking and code splitting for smaller bundle sizes

## 🔔 Push Notifications

The app includes a comprehensive push notification system with deep linking integration:

### 📬 Notification Features
- **Order Confirmations**: Automatic notifications when orders are placed
- **Deep Linking**: Tap notifications to open specific order details
- **Cross-platform**: Works on Android, iOS, and web
- **Local & Remote**: Combines Firebase Cloud Messaging with local notifications

### 🔗 Notification Deep Links
```bash
# Example notification payload structure
{
  "title": "Order Confirmed! 🎉",
  "body": "Your order #12345 for $99.99 has been placed successfully. Tap to view details.",
  "data": {
    "orderId": "12345",
    "userId": "user123",
    "type": "order_confirmation"
  }
}
```

### 📱 Testing Notifications
```bash
# Test order notification locally
flutter run
# Place an order through the app
# Notification will appear automatically

# Test deep linking from notification
# Tap the notification
# Verify it opens the correct order details page
```

## 🔗 Deep Linking Testing

This app supports deep linking for product details and order details pages. You can test deep links using ADB (Android Debug Bridge) or the iOS Simulator.

### 🤖 Android Testing with ADB

#### Prerequisites
- Enable USB debugging on your Android device
- Install ADB (comes with Android SDK)
- Connect your device or start an emulator

#### Product Details Deep Link Testing
```bash
# Test product details page with product ID
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://products/123" \
  com.example.ecommerce

# Test with HTTPS scheme (requires domain setup)
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "https://ecommerce.example.com/products/123" \
  com.example.ecommerce

# Test with different product IDs
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://products/456" \
  com.example.ecommerce

# Test product with query parameters
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://products/789?color=red&size=large" \
  com.example.ecommerce
```

#### Order Details Deep Link Testing
```bash
# Test order details page with order ID
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://orders/789" \
  com.example.ecommerce

# Test with user ID parameter
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://orders/789?userId=user123" \
  com.example.ecommerce

# Test with HTTPS scheme
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "https://ecommerce.example.com/orders/789" \
  com.example.ecommerce
```

#### Error Handling Testing
```bash
# Test with invalid product ID (should show error gracefully)
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://product/999999" \
  com.example.ecommerce

# Test with invalid order ID (should show error gracefully)
adb shell am start \
  -W -a android.intent.action.VIEW \
  -d "ecommerce://orders/999999" \
  com.example.ecommerce
```

### 🍎 iOS Testing with Simulator

```bash
# Test product details deep link
xcrun simctl openurl booted "ecommerce://products/123"

# Test order details deep link
xcrun simctl openurl booted "ecommerce://orders/789"

# Test with query parameters
xcrun simctl openurl booted "ecommerce://orders/789?userId=user123"

# Test different app states
xcrun simctl openurl booted "ecommerce://products/456"  # When app is closed
xcrun simctl openurl booted "ecommerce://orders/123"   # When app is in background
```

### 🌐 Web Testing

For web testing, simply navigate to these URLs in your browser:
```bash
# Start web server
flutter run -d chrome --web-port 3000

# Test URLs in browser
http://localhost:3000/products/123
http://localhost:3000/orders/789
http://localhost:3000/products/456?color=blue&size=medium
```

### 🚀 Quick Deep Link Testing Commands

```bash
# Android - Test multiple deep links quickly
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://products/1" com.example.ecommerce
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://products/2" com.example.ecommerce
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://orders/123" com.example.ecommerce

# iOS - Test multiple deep links quickly
xcrun simctl openurl booted "ecommerce://products/1"
xcrun simctl openurl booted "ecommerce://products/2" 
xcrun simctl openurl booted "ecommerce://orders/123"

# Test app state transitions
# 1. Open app normally
flutter run
# 2. Put app in background
# 3. Test deep link (should bring app to foreground)
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://products/123" com.example.ecommerce

# Test cold start with deep link
# 1. Kill app completely
adb shell am force-stop com.example.ecommerce
# 2. Open with deep link
adb shell am start -W -a android.intent.action.VIEW -d "ecommerce://products/123" com.example.ecommerce
```

### 📱 Manual Testing Methods

1. **Notes App**: Create a note with the deep link and tap it
2. **Messages**: Send yourself a message with the deep link
3. **Email**: Send yourself an email with the deep link
4. **QR Code**: Generate a QR code with the deep link and scan it
5. **Browser**: Type the deep link in any browser's address bar

### 🔍 What to Verify

When testing deep links, ensure:
- ✅ App opens to the correct page
- ✅ Correct product/order information loads
- ✅ Back navigation works properly
- ✅ App handles invalid IDs gracefully
- ✅ Authentication flow works correctly
- ✅ Bottom navigation shows correct selected tab
- ✅ Loading states are displayed properly
- ✅ Error states are handled gracefully

### 🛠️ Production Setup

For production apps, remember to:
1. Replace `ecommerce.example.com` with your actual domain
2. Set up domain verification for Android App Links
3. Configure Apple App Site Association file for iOS Universal Links
4. Test on physical devices with different scenarios

## 🧪 Comprehensive Testing

This project implements a robust testing strategy with unit, widget, and integration tests following TDD principles.

### 🔬 Testing Strategy

#### Unit Tests (Domain & Data Layers)
```bash
# Run all unit tests
flutter test test/src/features/*/domain/
flutter test test/src/features/*/data/

# Run specific feature tests
flutter test test/src/features/auth/domain/usecases/
flutter test test/src/features/products/data/repositories/
```

**Example Use Case Test:**
```dart
// test/src/features/auth/domain/usecases/login_usecase_test.dart
group('LoginUseCase', () {
  test('should return UserEntity when login is successful', () async {
    // Given
    when(mockRepository.login(any))
        .thenAnswer((_) async => Right(tUser));

    // When
    final result = await useCase(tLoginParams);

    // Then
    expect(result, Right(tUser));
    verify(mockRepository.login(tLoginParams));
    verifyNoMoreInteractions(mockRepository);
  });
});
```

#### Widget Tests (Presentation Layer)
```bash
# Run widget tests
flutter test test/src/features/*/presentation/

# Run specific widget tests
flutter test test/src/features/auth/presentation/pages/login_page_test.dart
```

**Example Widget Test:**
```dart
// test/src/features/auth/presentation/pages/login_page_test.dart
testWidgets('should display login form elements', (tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  expect(find.text('Welcome Back!'), findsOneWidget);
  expect(find.byType(TextFormField), findsNWidgets(2));
  expect(find.byType(ElevatedButton), findsOneWidget);
});
```

#### Bloc Tests (State Management)
```bash
# Run bloc tests
flutter test test/src/features/*/presentation/bloc/

# Test specific bloc
flutter test test/src/features/auth/presentation/bloc/auth_bloc_test.dart
```

**Example Bloc Test:**
```dart
// test/src/features/auth/presentation/bloc/auth_bloc_test.dart
blocTest<AuthBloc, AuthState>(
  'should emit [loading, authenticated] when login is successful',
  build: () {
    when(mockLoginUseCase(any))
        .thenAnswer((_) async => Right(tUser));
    return authBloc;
  },
  act: (bloc) => bloc.add(const AuthEvent.login(
    email: 'test@example.com',
    password: 'password123',
  )),
  expect: () => [
    const AuthState.loading(),
    AuthState.authenticated(tUser),
  ],
);
```

### 📊 Test Coverage

```bash
# Generate test coverage report
flutter test --coverage

# View coverage report in browser
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Coverage requirements
# - Domain layer: 95%+ coverage
# - Data layer: 90%+ coverage
# - Presentation layer: 85%+ coverage
```

### 🚀 Integration Tests

```bash
# Run integration tests
flutter drive --target=test_driver/app.dart

# Run specific integration test
flutter test integration_test/
```

**Example Integration Test:**
```dart
// integration_test/app_test.dart
testWidgets('complete purchase flow', (tester) async {
  // Launch app
  app.main();
  await tester.pumpAndSettle();

  // Navigate to product
  await tester.tap(find.text('Products'));
  await tester.pumpAndSettle();

  // Add to cart
  await tester.tap(find.byKey(const Key('add-to-cart-123')));
  await tester.pumpAndSettle();

  // Verify cart badge
  expect(find.text('1'), findsOneWidget);

  // Complete checkout
  await tester.tap(find.byKey(const Key('checkout-button')));
  await tester.pumpAndSettle();

  // Verify order confirmation
  expect(find.text('Order Confirmed'), findsOneWidget);
});
```

### 🛠️ Testing Commands

```bash
# Run all tests with coverage
flutter test --coverage

# Run tests for specific feature
flutter test test/src/features/auth/

# Run tests matching pattern
flutter test --name="login"

# Run tests with timeout
flutter test --timeout=60s

# Run tests in debug mode
flutter test --debug

# Run widget tests only
flutter test test/ --exclude-tags=unit

# Run unit tests only
flutter test test/ --tags=unit
```

### 📈 Continuous Integration

```yaml
# .github/workflows/test.yml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test --coverage
      - run: flutter drive --target=test_driver/app.dart
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
