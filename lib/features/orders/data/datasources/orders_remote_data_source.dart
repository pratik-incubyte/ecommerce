abstract class OrdersRemoteDataSource {}
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final dynamic dioClient;
  OrdersRemoteDataSourceImpl({required this.dioClient});
}
