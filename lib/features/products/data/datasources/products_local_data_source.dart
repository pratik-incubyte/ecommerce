abstract class ProductsLocalDataSource {}
class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final dynamic database;
  ProductsLocalDataSourceImpl({required this.database});
}
