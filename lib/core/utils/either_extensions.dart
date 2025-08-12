import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R getRight() => (this as Right<L, R>).value;
  L getLeft() => (this as Left<L, R>).value;

  R? getOrNull() => fold((_) => null, (r) => r);

  Widget when({
    required Widget Function(L failure) failure,
    required Widget Function(R data) success,
  }) {
    return fold(
      (l) => failure(l),
      (r) => success(r),
    );
  }

  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }

  Future<Either<L, T>> flatMapAsync<T>(
    Future<Either<L, T>> Function(R r) f,
  ) async {
    return fold(
      (l) => Left(l),
      (r) async => await f(r),
    );
  }

  bool get isLeft => fold((_) => true, (_) => false);
  bool get isRight => fold((_) => false, (_) => true);
}