// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
    _$AuthInitialImpl value,
    $Res Function(_$AuthInitialImpl) then,
  ) = __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
    _$AuthInitialImpl _value,
    $Res Function(_$AuthInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
    _$AuthLoadingImpl value,
    $Res Function(_$AuthLoadingImpl) then,
  ) = __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
    _$AuthLoadingImpl _value,
    $Res Function(_$AuthLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthLoadingImpl implements AuthLoading {
  const _$AuthLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoadingImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
    _$AuthenticatedImpl value,
    $Res Function(_$AuthenticatedImpl) then,
  ) = __$$AuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
    _$AuthenticatedImpl _value,
    $Res Function(_$AuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AuthenticatedImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserEntity,
      ),
    );
  }
}

/// @nodoc

class _$AuthenticatedImpl implements Authenticated {
  const _$AuthenticatedImpl({required this.user});

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      __$$AuthenticatedImplCopyWithImpl<_$AuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated({required final UserEntity user}) =
      _$AuthenticatedImpl;

  UserEntity get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticatedImplCopyWith<_$AuthenticatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(
    _$UnauthenticatedImpl value,
    $Res Function(_$UnauthenticatedImpl) then,
  ) = __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
    _$UnauthenticatedImpl _value,
    $Res Function(_$UnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthenticatedImpl implements Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
    _$AuthErrorImpl value,
    $Res Function(_$AuthErrorImpl) then,
  ) = __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
    _$AuthErrorImpl _value,
    $Res Function(_$AuthErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? failure = null}) {
    return _then(
      _$AuthErrorImpl(
        failure: null == failure
            ? _value.failure
            : failure // ignore: cast_nullable_to_non_nullable
                  as Failure,
      ),
    );
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AuthState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError({required final Failure failure}) = _$AuthErrorImpl;

  Failure get failure;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordResetSentImplCopyWith<$Res> {
  factory _$$PasswordResetSentImplCopyWith(
    _$PasswordResetSentImpl value,
    $Res Function(_$PasswordResetSentImpl) then,
  ) = __$$PasswordResetSentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordResetSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$PasswordResetSentImpl>
    implements _$$PasswordResetSentImplCopyWith<$Res> {
  __$$PasswordResetSentImplCopyWithImpl(
    _$PasswordResetSentImpl _value,
    $Res Function(_$PasswordResetSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordResetSentImpl implements PasswordResetSent {
  const _$PasswordResetSentImpl();

  @override
  String toString() {
    return 'AuthState.passwordResetSent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PasswordResetSentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return passwordResetSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return passwordResetSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (passwordResetSent != null) {
      return passwordResetSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return passwordResetSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return passwordResetSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (passwordResetSent != null) {
      return passwordResetSent(this);
    }
    return orElse();
  }
}

abstract class PasswordResetSent implements AuthState {
  const factory PasswordResetSent() = _$PasswordResetSentImpl;
}

/// @nodoc
abstract class _$$ProfileUpdatedImplCopyWith<$Res> {
  factory _$$ProfileUpdatedImplCopyWith(
    _$ProfileUpdatedImpl value,
    $Res Function(_$ProfileUpdatedImpl) then,
  ) = __$$ProfileUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileUpdatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ProfileUpdatedImpl>
    implements _$$ProfileUpdatedImplCopyWith<$Res> {
  __$$ProfileUpdatedImplCopyWithImpl(
    _$ProfileUpdatedImpl _value,
    $Res Function(_$ProfileUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileUpdatedImpl implements ProfileUpdated {
  const _$ProfileUpdatedImpl();

  @override
  String toString() {
    return 'AuthState.profileUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return profileUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return profileUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return profileUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdated implements AuthState {
  const factory ProfileUpdated() = _$ProfileUpdatedImpl;
}

/// @nodoc
abstract class _$$EmailVerificationSentImplCopyWith<$Res> {
  factory _$$EmailVerificationSentImplCopyWith(
    _$EmailVerificationSentImpl value,
    $Res Function(_$EmailVerificationSentImpl) then,
  ) = __$$EmailVerificationSentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailVerificationSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$EmailVerificationSentImpl>
    implements _$$EmailVerificationSentImplCopyWith<$Res> {
  __$$EmailVerificationSentImplCopyWithImpl(
    _$EmailVerificationSentImpl _value,
    $Res Function(_$EmailVerificationSentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailVerificationSentImpl implements EmailVerificationSent {
  const _$EmailVerificationSentImpl();

  @override
  String toString() {
    return 'AuthState.emailVerificationSent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailVerificationSentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserEntity user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(Failure failure) error,
    required TResult Function() passwordResetSent,
    required TResult Function() profileUpdated,
    required TResult Function() emailVerificationSent,
  }) {
    return emailVerificationSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserEntity user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(Failure failure)? error,
    TResult? Function()? passwordResetSent,
    TResult? Function()? profileUpdated,
    TResult? Function()? emailVerificationSent,
  }) {
    return emailVerificationSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserEntity user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(Failure failure)? error,
    TResult Function()? passwordResetSent,
    TResult Function()? profileUpdated,
    TResult Function()? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (emailVerificationSent != null) {
      return emailVerificationSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(AuthLoading value) loading,
    required TResult Function(Authenticated value) authenticated,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(AuthError value) error,
    required TResult Function(PasswordResetSent value) passwordResetSent,
    required TResult Function(ProfileUpdated value) profileUpdated,
    required TResult Function(EmailVerificationSent value)
    emailVerificationSent,
  }) {
    return emailVerificationSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(AuthLoading value)? loading,
    TResult? Function(Authenticated value)? authenticated,
    TResult? Function(Unauthenticated value)? unauthenticated,
    TResult? Function(AuthError value)? error,
    TResult? Function(PasswordResetSent value)? passwordResetSent,
    TResult? Function(ProfileUpdated value)? profileUpdated,
    TResult? Function(EmailVerificationSent value)? emailVerificationSent,
  }) {
    return emailVerificationSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(AuthLoading value)? loading,
    TResult Function(Authenticated value)? authenticated,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(AuthError value)? error,
    TResult Function(PasswordResetSent value)? passwordResetSent,
    TResult Function(ProfileUpdated value)? profileUpdated,
    TResult Function(EmailVerificationSent value)? emailVerificationSent,
    required TResult orElse(),
  }) {
    if (emailVerificationSent != null) {
      return emailVerificationSent(this);
    }
    return orElse();
  }
}

abstract class EmailVerificationSent implements AuthState {
  const factory EmailVerificationSent() = _$EmailVerificationSentImpl;
}
