import 'package:dartz/dartz.dart';
import 'package:ecommerce/src/core/error/failures.dart';
import 'package:ecommerce/src/core/utils/usecase.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce/src/features/auth/domain/usecases/auth_params.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await repository.register(params);
  }
}
