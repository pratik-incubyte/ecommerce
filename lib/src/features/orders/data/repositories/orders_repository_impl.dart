import '../../domain/repositories/orders_repository.dart';
class OrdersRepositoryImpl implements OrdersRepository {
  final dynamic remoteDataSource;
  final dynamic localDataSource;
  final dynamic networkInfo;
  OrdersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
}
