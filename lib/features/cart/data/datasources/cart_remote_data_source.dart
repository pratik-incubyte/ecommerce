abstract class CartRemoteDataSource {}
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final dynamic dioClient;
  CartRemoteDataSourceImpl({required this.dioClient});
}
