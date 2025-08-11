abstract class ProductsRemoteDataSource {}
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final dynamic dioClient;
  ProductsRemoteDataSourceImpl({required this.dioClient});
}
