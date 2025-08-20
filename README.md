# E-Commerce Flutter App - Clean Architecture

A comprehensive Flutter e-commerce application built with **Clean Architecture**, **Feature-first organization**, **flutter_bloc** for state management, **go_router** for navigation, and **drift** for local database management. This project demonstrates rapid development of a production-ready e-commerce app with advanced features including deep linking, offline storage, push notifications, and optimized performance.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with a **Feature-first** organization approach:

**Project Structure:**
- `lib/core/` - Shared/common code (error handling, network, database, utils, widgets, constants, DI, router)
- `lib/features/` - All app features (auth, products, cart, orders)
- `main.dart` - Entry point

**Each Feature Structure:**
- `data/` - Data layer (datasources, models, repository implementations)
- `domain/` - Domain layer (entities, repository interfaces, use cases)
- `presentation/` - Presentation layer (bloc state management, pages, widgets)

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
2. **Install dependencies**: `flutter pub get`
3. **Generate code**: `flutter packages pub run build_runner build --delete-conflicting-outputs`
4. **Run the app**: `flutter run`

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

Uses **flutter_bloc** for predictable state management with events and states, implementing the BLoC pattern with Freezed for immutable classes.

## 🗄️ Database with Drift

Uses **drift** for type-safe SQL database operations with automatic code generation for tables and queries.

## 🔗 Navigation with go_router

Implements declarative routing with **go_router** for navigation and deep linking support.

## 🧪 Error Handling with Dartz

Uses **dartz** Either pattern for functional error handling, returning either failures or success values.

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
- **Efficient State Updates**: Uses Freezed for optimized state management
- **Smart Event Handling**: Prevents unnecessary API calls and duplicate loading states

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
Notifications include deep link data to open specific order details when tapped.

### 📱 Testing Notifications
Place an order through the app to automatically trigger notifications with deep linking functionality.

## 🔗 Deep Linking Testing

This app supports deep linking for product details and order details pages.

### Testing Methods
- **Android**: Use ADB commands with `ecommerce://products/{id}` or `ecommerce://orders/{id}` schemes
- **iOS**: Use iOS Simulator with `xcrun simctl openurl` commands
- **Web**: Navigate directly to URLs like `localhost:3000/products/123`
- **Manual**: Test with notes app, messages, email, or QR codes

### Key Verification Points
- App opens to correct page
- Proper product/order information loads
- Graceful error handling for invalid IDs
- Authentication flow works correctly
- Navigation and loading states function properly

## 🧪 Comprehensive Testing

This project implements a robust testing strategy with unit, widget, and integration tests following TDD principles.

### 🔬 Testing Strategy
- **Unit Tests**: Domain and data layer testing with high coverage requirements
- **Widget Tests**: Presentation layer UI component testing  
- **Bloc Tests**: State management testing with bloc_test package
- **Integration Tests**: End-to-end user flow testing

### 📊 Test Coverage
- Domain layer: 95%+ coverage target
- Data layer: 90%+ coverage target  
- Presentation layer: 85%+ coverage target

### 🛠️ Key Testing Commands
- `flutter test --coverage` - Run all tests with coverage
- `flutter test test/src/features/auth/` - Run specific feature tests
- `flutter drive --target=test_driver/app.dart` - Run integration tests

## 📝 Code Generation

This project uses code generation for:
- **Freezed**: Immutable classes and union types
- **JSON Serializable**: JSON serialization/deserialization
- **Drift**: Database code generation

**Commands:**
- Generate code: `flutter packages pub run build_runner build`
- Watch for changes: `flutter packages pub run build_runner watch`

