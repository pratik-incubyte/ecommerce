import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// Base class for all use cases in the application
/// [Type] is the return type
/// [Params] is the parameter type
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Use case for operations that don't require parameters
abstract class NoParamsUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

/// Base class for parameters that can be passed to use cases
abstract class Params extends Equatable {
  const Params();
}

/// Empty parameters for use cases that don't need any parameters
class NoParams extends Params {
  const NoParams();
  
  @override
  List<Object> get props => [];
}

/// Base class for paginated parameters
abstract class PaginatedParams extends Params {
  final int page;
  final int limit;
  
  const PaginatedParams({
    this.page = 1,
    this.limit = 20,
  });
  
  @override
  List<Object> get props => [page, limit];
}
