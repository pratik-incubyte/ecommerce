abstract class AuthRemoteDataSource {}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final dynamic dioClient;
  AuthRemoteDataSourceImpl({required this.dioClient});
}
