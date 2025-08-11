abstract class AuthLocalDataSource {}
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final dynamic database;
  AuthLocalDataSourceImpl({required this.database});
}
