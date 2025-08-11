import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../error/failures.dart';

/// Extension to handle Either<Failure, T> consistently
extension EitherExtensions<L, R> on Either<L, R> {
  /// Get the right value (success case)
  R getRight() => (this as Right<L, R>).value;
  
  /// Get the left value (failure case)
  L getLeft() => (this as Left<L, R>).value;
  
  /// For use in UI to map to different widgets based on success/failure
  Widget when({
    required Widget Function(L failure) failure,
    required Widget Function(R data) success,
  }) {
    return fold(
      (l) => failure(l),
      (r) => success(r),
    );
  }
  
  /// Simplify chaining operations that can fail
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }
  
  /// Map the right value
  Either<L, T> mapRight<T>(T Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => Right(f(r)),
    );
  }
  
  /// Map the left value
  Either<T, R> mapLeft<T>(T Function(L l) f) {
    return fold(
      (l) => Left(f(l)),
      (r) => Right(r),
    );
  }
}

/// Extension specifically for Either<Failure, T>
extension FailureEitherExtensions<T> on Either<Failure, T> {
  /// Convert to a user-friendly error message
  String get errorMessage {
    return fold(
      (failure) => failure.message,
      (success) => '',
    );
  }
  
  /// Check if the result is a success
  bool get isSuccess => isRight();
  
  /// Check if the result is a failure
  bool get isFailure => isLeft();
  
  /// Get the success value or null
  T? get valueOrNull => fold(
    (failure) => null,
    (success) => success,
  );
  
  /// Get the failure or null
  Failure? get failureOrNull => fold(
    (failure) => failure,
    (success) => null,
  );
}
