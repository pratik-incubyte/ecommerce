abstract class CartLocalDataSource {}
class CartLocalDataSourceImpl implements CartLocalDataSource {
  final dynamic database;
  CartLocalDataSourceImpl({required this.database});
}
