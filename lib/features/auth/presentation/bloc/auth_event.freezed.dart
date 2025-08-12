// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInRequestedImplCopyWith<$Res> {
  factory _$$SignInRequestedImplCopyWith(
    _$SignInRequestedImpl value,
    $Res Function(_$SignInRequestedImpl) then,
  ) = __$$SignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInRequestedImpl>
    implements _$$SignInRequestedImplCopyWith<$Res> {
  __$$SignInRequestedImplCopyWithImpl(
    _$SignInRequestedImpl _value,
    $Res Function(_$SignInRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignInRequestedImpl implements SignInRequested {
  const _$SignInRequestedImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      __$$SignInRequestedImplCopyWithImpl<_$SignInRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class SignInRequested implements AuthEvent {
  const factory SignInRequested({
    required final String email,
    required final String password,
  }) = _$SignInRequestedImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInRequestedImplCopyWith<_$SignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpRequestedImplCopyWith<$Res> {
  factory _$$SignUpRequestedImplCopyWith(
    _$SignUpRequestedImpl value,
    $Res Function(_$SignUpRequestedImpl) then,
  ) = __$$SignUpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password, String? displayName});
}

/// @nodoc
class __$$SignUpRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpRequestedImpl>
    implements _$$SignUpRequestedImplCopyWith<$Res> {
  __$$SignUpRequestedImplCopyWithImpl(
    _$SignUpRequestedImpl _value,
    $Res Function(_$SignUpRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? displayName = freezed,
  }) {
    return _then(
      _$SignUpRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SignUpRequestedImpl implements SignUpRequested {
  const _$SignUpRequestedImpl({
    required this.email,
    required this.password,
    this.displayName,
  });

  @override
  final String email;
  @override
  final String password;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'AuthEvent.signUpRequested(email: $email, password: $password, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, displayName);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      __$$SignUpRequestedImplCopyWithImpl<_$SignUpRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return signUpRequested(email, password, displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return signUpRequested?.call(email, password, displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(email, password, displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return signUpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return signUpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(this);
    }
    return orElse();
  }
}

abstract class SignUpRequested implements AuthEvent {
  const factory SignUpRequested({
    required final String email,
    required final String password,
    final String? displayName,
  }) = _$SignUpRequestedImpl;

  String get email;
  String get password;
  String? get displayName;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpRequestedImplCopyWith<_$SignUpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutRequestedImplCopyWith<$Res> {
  factory _$$SignOutRequestedImplCopyWith(
    _$SignOutRequestedImpl value,
    $Res Function(_$SignOutRequestedImpl) then,
  ) = __$$SignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutRequestedImpl>
    implements _$$SignOutRequestedImplCopyWith<$Res> {
  __$$SignOutRequestedImplCopyWithImpl(
    _$SignOutRequestedImpl _value,
    $Res Function(_$SignOutRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutRequestedImpl implements SignOutRequested {
  const _$SignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class SignOutRequested implements AuthEvent {
  const factory SignOutRequested() = _$SignOutRequestedImpl;
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(
    _$CheckAuthStatusImpl value,
    $Res Function(_$CheckAuthStatusImpl) then,
  ) = __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
    _$CheckAuthStatusImpl _value,
    $Res Function(_$CheckAuthStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthStatus implements AuthEvent {
  const factory CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$ResetPasswordRequestedImplCopyWith<$Res> {
  factory _$$ResetPasswordRequestedImplCopyWith(
    _$ResetPasswordRequestedImpl value,
    $Res Function(_$ResetPasswordRequestedImpl) then,
  ) = __$$ResetPasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResetPasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordRequestedImpl>
    implements _$$ResetPasswordRequestedImplCopyWith<$Res> {
  __$$ResetPasswordRequestedImplCopyWithImpl(
    _$ResetPasswordRequestedImpl _value,
    $Res Function(_$ResetPasswordRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ResetPasswordRequestedImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordRequestedImpl implements ResetPasswordRequested {
  const _$ResetPasswordRequestedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.resetPasswordRequested(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordRequestedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
  get copyWith =>
      __$$ResetPasswordRequestedImplCopyWithImpl<_$ResetPasswordRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return resetPasswordRequested(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return resetPasswordRequested?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return resetPasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return resetPasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (resetPasswordRequested != null) {
      return resetPasswordRequested(this);
    }
    return orElse();
  }
}

abstract class ResetPasswordRequested implements AuthEvent {
  const factory ResetPasswordRequested({required final String email}) =
      _$ResetPasswordRequestedImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordRequestedImplCopyWith<_$ResetPasswordRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordRequestedImplCopyWith<$Res> {
  factory _$$UpdatePasswordRequestedImplCopyWith(
    _$UpdatePasswordRequestedImpl value,
    $Res Function(_$UpdatePasswordRequestedImpl) then,
  ) = __$$UpdatePasswordRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPassword});
}

/// @nodoc
class __$$UpdatePasswordRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdatePasswordRequestedImpl>
    implements _$$UpdatePasswordRequestedImplCopyWith<$Res> {
  __$$UpdatePasswordRequestedImplCopyWithImpl(
    _$UpdatePasswordRequestedImpl _value,
    $Res Function(_$UpdatePasswordRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newPassword = null}) {
    return _then(
      _$UpdatePasswordRequestedImpl(
        newPassword: null == newPassword
            ? _value.newPassword
            : newPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdatePasswordRequestedImpl implements UpdatePasswordRequested {
  const _$UpdatePasswordRequestedImpl({required this.newPassword});

  @override
  final String newPassword;

  @override
  String toString() {
    return 'AuthEvent.updatePasswordRequested(newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestedImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPassword);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestedImplCopyWith<_$UpdatePasswordRequestedImpl>
  get copyWith =>
      __$$UpdatePasswordRequestedImplCopyWithImpl<
        _$UpdatePasswordRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return updatePasswordRequested(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return updatePasswordRequested?.call(newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (updatePasswordRequested != null) {
      return updatePasswordRequested(newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return updatePasswordRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return updatePasswordRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (updatePasswordRequested != null) {
      return updatePasswordRequested(this);
    }
    return orElse();
  }
}

abstract class UpdatePasswordRequested implements AuthEvent {
  const factory UpdatePasswordRequested({required final String newPassword}) =
      _$UpdatePasswordRequestedImpl;

  String get newPassword;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordRequestedImplCopyWith<_$UpdatePasswordRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileRequestedImplCopyWith<$Res> {
  factory _$$UpdateProfileRequestedImplCopyWith(
    _$UpdateProfileRequestedImpl value,
    $Res Function(_$UpdateProfileRequestedImpl) then,
  ) = __$$UpdateProfileRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? displayName, String? photoUrl});
}

/// @nodoc
class __$$UpdateProfileRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateProfileRequestedImpl>
    implements _$$UpdateProfileRequestedImplCopyWith<$Res> {
  __$$UpdateProfileRequestedImplCopyWithImpl(
    _$UpdateProfileRequestedImpl _value,
    $Res Function(_$UpdateProfileRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? displayName = freezed, Object? photoUrl = freezed}) {
    return _then(
      _$UpdateProfileRequestedImpl(
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$UpdateProfileRequestedImpl implements UpdateProfileRequested {
  const _$UpdateProfileRequestedImpl({this.displayName, this.photoUrl});

  @override
  final String? displayName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'AuthEvent.updateProfileRequested(displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileRequestedImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, photoUrl);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileRequestedImplCopyWith<_$UpdateProfileRequestedImpl>
  get copyWith =>
      __$$UpdateProfileRequestedImplCopyWithImpl<_$UpdateProfileRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return updateProfileRequested(displayName, photoUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return updateProfileRequested?.call(displayName, photoUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (updateProfileRequested != null) {
      return updateProfileRequested(displayName, photoUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return updateProfileRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return updateProfileRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (updateProfileRequested != null) {
      return updateProfileRequested(this);
    }
    return orElse();
  }
}

abstract class UpdateProfileRequested implements AuthEvent {
  const factory UpdateProfileRequested({
    final String? displayName,
    final String? photoUrl,
  }) = _$UpdateProfileRequestedImpl;

  String? get displayName;
  String? get photoUrl;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileRequestedImplCopyWith<_$UpdateProfileRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendEmailVerificationRequestedImplCopyWith<$Res> {
  factory _$$SendEmailVerificationRequestedImplCopyWith(
    _$SendEmailVerificationRequestedImpl value,
    $Res Function(_$SendEmailVerificationRequestedImpl) then,
  ) = __$$SendEmailVerificationRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendEmailVerificationRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendEmailVerificationRequestedImpl>
    implements _$$SendEmailVerificationRequestedImplCopyWith<$Res> {
  __$$SendEmailVerificationRequestedImplCopyWithImpl(
    _$SendEmailVerificationRequestedImpl _value,
    $Res Function(_$SendEmailVerificationRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendEmailVerificationRequestedImpl
    implements SendEmailVerificationRequested {
  const _$SendEmailVerificationRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.sendEmailVerificationRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailVerificationRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return sendEmailVerificationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return sendEmailVerificationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (sendEmailVerificationRequested != null) {
      return sendEmailVerificationRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return sendEmailVerificationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return sendEmailVerificationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (sendEmailVerificationRequested != null) {
      return sendEmailVerificationRequested(this);
    }
    return orElse();
  }
}

abstract class SendEmailVerificationRequested implements AuthEvent {
  const factory SendEmailVerificationRequested() =
      _$SendEmailVerificationRequestedImpl;
}

/// @nodoc
abstract class _$$DeleteAccountRequestedImplCopyWith<$Res> {
  factory _$$DeleteAccountRequestedImplCopyWith(
    _$DeleteAccountRequestedImpl value,
    $Res Function(_$DeleteAccountRequestedImpl) then,
  ) = __$$DeleteAccountRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAccountRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DeleteAccountRequestedImpl>
    implements _$$DeleteAccountRequestedImplCopyWith<$Res> {
  __$$DeleteAccountRequestedImplCopyWithImpl(
    _$DeleteAccountRequestedImpl _value,
    $Res Function(_$DeleteAccountRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteAccountRequestedImpl implements DeleteAccountRequested {
  const _$DeleteAccountRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.deleteAccountRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAccountRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(
      String email,
      String password,
      String? displayName,
    )
    signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() checkAuthStatus,
    required TResult Function(String email) resetPasswordRequested,
    required TResult Function(String newPassword) updatePasswordRequested,
    required TResult Function(String? displayName, String? photoUrl)
    updateProfileRequested,
    required TResult Function() sendEmailVerificationRequested,
    required TResult Function() deleteAccountRequested,
  }) {
    return deleteAccountRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? checkAuthStatus,
    TResult? Function(String email)? resetPasswordRequested,
    TResult? Function(String newPassword)? updatePasswordRequested,
    TResult? Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult? Function()? sendEmailVerificationRequested,
    TResult? Function()? deleteAccountRequested,
  }) {
    return deleteAccountRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password, String? displayName)?
    signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? checkAuthStatus,
    TResult Function(String email)? resetPasswordRequested,
    TResult Function(String newPassword)? updatePasswordRequested,
    TResult Function(String? displayName, String? photoUrl)?
    updateProfileRequested,
    TResult Function()? sendEmailVerificationRequested,
    TResult Function()? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (deleteAccountRequested != null) {
      return deleteAccountRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInRequested value) signInRequested,
    required TResult Function(SignUpRequested value) signUpRequested,
    required TResult Function(SignOutRequested value) signOutRequested,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
    required TResult Function(ResetPasswordRequested value)
    resetPasswordRequested,
    required TResult Function(UpdatePasswordRequested value)
    updatePasswordRequested,
    required TResult Function(UpdateProfileRequested value)
    updateProfileRequested,
    required TResult Function(SendEmailVerificationRequested value)
    sendEmailVerificationRequested,
    required TResult Function(DeleteAccountRequested value)
    deleteAccountRequested,
  }) {
    return deleteAccountRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SignInRequested value)? signInRequested,
    TResult? Function(SignUpRequested value)? signUpRequested,
    TResult? Function(SignOutRequested value)? signOutRequested,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult? Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult? Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult? Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult? Function(DeleteAccountRequested value)? deleteAccountRequested,
  }) {
    return deleteAccountRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInRequested value)? signInRequested,
    TResult Function(SignUpRequested value)? signUpRequested,
    TResult Function(SignOutRequested value)? signOutRequested,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    TResult Function(ResetPasswordRequested value)? resetPasswordRequested,
    TResult Function(UpdatePasswordRequested value)? updatePasswordRequested,
    TResult Function(UpdateProfileRequested value)? updateProfileRequested,
    TResult Function(SendEmailVerificationRequested value)?
    sendEmailVerificationRequested,
    TResult Function(DeleteAccountRequested value)? deleteAccountRequested,
    required TResult orElse(),
  }) {
    if (deleteAccountRequested != null) {
      return deleteAccountRequested(this);
    }
    return orElse();
  }
}

abstract class DeleteAccountRequested implements AuthEvent {
  const factory DeleteAccountRequested() = _$DeleteAccountRequestedImpl;
}
