abstract class OrdersLocalDataSource {}
class OrdersLocalDataSourceImpl implements OrdersLocalDataSource {
  final dynamic database;
  OrdersLocalDataSourceImpl({required this.database});
}
