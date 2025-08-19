import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/network/network_info.dart';
import 'package:ecommerce/src/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:ecommerce/src/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:ecommerce/src/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce/src/features/products/domain/entities/product.dart';
import '../../domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final CartLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CartItem>> addToCart({
    required String userId,
    required Product product,
    required int quantity,
    Map<String, dynamic>? selectedVariants,
  }) async {
    try {
      final now = DateTime.now();
      
      // Check if item already exists in cart
      CartItemModel? existingItem;
      
      if (await networkInfo.isConnected) {
        existingItem = await remoteDataSource.getCartItem(userId, product.id);
      } else {
        existingItem = await localDataSource.getCartItem(userId, product.id);
      }

      late CartItemModel cartItemToSave;

      if (existingItem != null) {
        // Update quantity if item already exists
        cartItemToSave = existingItem.copyWith(
          quantity: existingItem.quantity + quantity,
          updatedAt: now,
        );
      } else {
        // Create new cart item
        cartItemToSave = CartItemModel(
          userId: userId,
          product: product,
          quantity: quantity,
          selectedVariants: selectedVariants,
          createdAt: now,
          updatedAt: now,
        );
      }

      // Save to remote and local
      if (await networkInfo.isConnected) {
        final result = existingItem != null
            ? await remoteDataSource.updateCartItem(cartItemToSave)
            : await remoteDataSource.addToCart(cartItemToSave);
        
        // Cache locally
        await localDataSource.cacheCartItem(result);
        return Right(result);
      } else {
        // Save locally only
        if (existingItem != null) {
          await localDataSource.updateCartItem(cartItemToSave);
        } else {
          await localDataSource.cacheCartItem(cartItemToSave);
        }
        return Right(cartItemToSave);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to add item to cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Cart>> getCart(String userId) async {
    try {
      List<CartItemModel> cartItems;

      if (await networkInfo.isConnected) {
        try {
          cartItems = await remoteDataSource.getCartItems(userId);
          // Cache locally
          if (cartItems.isNotEmpty) {
            await localDataSource.cacheCartItems(cartItems);
          }
        } catch (e) {
          // Fallback to local if remote fails
          cartItems = await localDataSource.getCartItems(userId);
        }
      } else {
        cartItems = await localDataSource.getCartItems(userId);
      }

      final cart = Cart(
        userId: userId,
        items: cartItems,
        updatedAt: cartItems.isNotEmpty 
            ? cartItems.first.updatedAt 
            : DateTime.now(),
      );

      return Right(cart);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to get cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, CartItem>> updateCartItemQuantity({
    required String userId,
    required int productId,
    required int quantity,
  }) async {
    try {
      CartItemModel? existingItem;

      if (await networkInfo.isConnected) {
        existingItem = await remoteDataSource.getCartItem(userId, productId);
      } else {
        existingItem = await localDataSource.getCartItem(userId, productId);
      }

      if (existingItem == null) {
        return Left(GeneralFailure('Cart item not found'));
      }

      final updatedItem = existingItem.copyWith(
        quantity: quantity,
        updatedAt: DateTime.now(),
      );

      if (await networkInfo.isConnected) {
        final result = await remoteDataSource.updateCartItem(updatedItem);
        await localDataSource.updateCartItem(result);
        return Right(result);
      } else {
        await localDataSource.updateCartItem(updatedItem);
        return Right(updatedItem);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to update cart item: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart({
    required String userId,
    required int productId,
  }) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.removeFromCart(userId, productId);
      }
      await localDataSource.removeCartItem(userId, productId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to remove item from cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart(String userId) async {
    try {
      if (await networkInfo.isConnected) {
        await remoteDataSource.clearCart(userId);
      }
      await localDataSource.clearCart(userId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(GeneralFailure('Failed to clear cart: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> getCartItemCount(String userId) async {
    try {
      final cartResult = await getCart(userId);
      return cartResult.fold(
        (failure) => Left(failure),
        (cart) => Right(cart.totalItems),
      );
    } catch (e) {
      return Left(GeneralFailure('Failed to get cart item count: ${e.toString()}'));
    }
  }
}
