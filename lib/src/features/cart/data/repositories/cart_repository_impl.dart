import '../../domain/repositories/cart_repository.dart';
class CartRepositoryImpl implements CartRepository {
  final dynamic localDataSource;
  CartRepositoryImpl({
    required this.localDataSource,
  });
}
