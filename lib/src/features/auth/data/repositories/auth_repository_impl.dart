import '../../domain/repositories/auth_repository.dart';
class AuthRepositoryImpl implements AuthRepository {
  final dynamic remoteDataSource;
  final dynamic localDataSource;
  final dynamic networkInfo;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
}
