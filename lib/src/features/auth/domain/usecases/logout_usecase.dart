import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.logout();
  }
}
