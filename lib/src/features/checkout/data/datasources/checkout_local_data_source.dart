import 'package:ecommerce/src/core/error/exceptions.dart';
import 'package:ecommerce/src/features/checkout/domain/entities/checkout.dart';
import 'package:ecommerce/src/features/cart/domain/entities/cart.dart';

/// Local data source for checkout calculations and caching
abstract class CheckoutLocalDataSource {
  /// Cache checkout calculations
  Future<void> cacheCheckout(String userId, Checkout checkout);

  /// Get cached checkout calculations
  Future<Checkout?> getCachedCheckout(String userId);

  /// Clear cached checkout
  Future<void> clearCachedCheckout(String userId);

  /// Get cart for checkout calculations
  Future<Cart> getCartForCheckout(String userId);
}

/// Implementation of local data source for checkout
class CheckoutLocalDataSourceImpl implements CheckoutLocalDataSource {
  final Map<String, Checkout> _checkoutCache = {};

  CheckoutLocalDataSourceImpl();

  @override
  Future<void> cacheCheckout(String userId, Checkout checkout) async {
    try {
      _checkoutCache[userId] = checkout;
    } catch (e) {
      throw CacheException('Failed to cache checkout: ${e.toString()}');
    }
  }

  @override
  Future<Checkout?> getCachedCheckout(String userId) async {
    try {
      return _checkoutCache[userId];
    } catch (e) {
      throw CacheException('Failed to get cached checkout: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCachedCheckout(String userId) async {
    try {
      _checkoutCache.remove(userId);
    } catch (e) {
      throw CacheException('Failed to clear cached checkout: ${e.toString()}');
    }
  }

  @override
  Future<Cart> getCartForCheckout(String userId) async {
    // This would normally fetch from the cart local data source
    // For now, return an empty cart (this should be properly injected)
    throw CacheException('Cart data source not implemented for checkout');
  }
}
