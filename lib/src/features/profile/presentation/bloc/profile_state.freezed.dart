// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState()';
}


}

/// @nodoc
class $ProfileStateCopyWith<$Res>  {
$ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}


/// Adds pattern-matching-related methods to [ProfileState].
extension ProfileStatePatterns on ProfileState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Updating value)?  updating,TResult Function( _Updated value)?  updated,TResult Function( _UploadingImage value)?  uploadingImage,TResult Function( _ImageUploaded value)?  imageUploaded,TResult Function( _ChangingPassword value)?  changingPassword,TResult Function( _PasswordChanged value)?  passwordChanged,TResult Function( _Deleting value)?  deleting,TResult Function( _Deleted value)?  deleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _Updated() when updated != null:
return updated(_that);case _UploadingImage() when uploadingImage != null:
return uploadingImage(_that);case _ImageUploaded() when imageUploaded != null:
return imageUploaded(_that);case _ChangingPassword() when changingPassword != null:
return changingPassword(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Updating value)  updating,required TResult Function( _Updated value)  updated,required TResult Function( _UploadingImage value)  uploadingImage,required TResult Function( _ImageUploaded value)  imageUploaded,required TResult Function( _ChangingPassword value)  changingPassword,required TResult Function( _PasswordChanged value)  passwordChanged,required TResult Function( _Deleting value)  deleting,required TResult Function( _Deleted value)  deleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Updating():
return updating(_that);case _Updated():
return updated(_that);case _UploadingImage():
return uploadingImage(_that);case _ImageUploaded():
return imageUploaded(_that);case _ChangingPassword():
return changingPassword(_that);case _PasswordChanged():
return passwordChanged(_that);case _Deleting():
return deleting(_that);case _Deleted():
return deleted(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Updating value)?  updating,TResult? Function( _Updated value)?  updated,TResult? Function( _UploadingImage value)?  uploadingImage,TResult? Function( _ImageUploaded value)?  imageUploaded,TResult? Function( _ChangingPassword value)?  changingPassword,TResult? Function( _PasswordChanged value)?  passwordChanged,TResult? Function( _Deleting value)?  deleting,TResult? Function( _Deleted value)?  deleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Updating() when updating != null:
return updating(_that);case _Updated() when updated != null:
return updated(_that);case _UploadingImage() when uploadingImage != null:
return uploadingImage(_that);case _ImageUploaded() when imageUploaded != null:
return imageUploaded(_that);case _ChangingPassword() when changingPassword != null:
return changingPassword(_that);case _PasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case _Deleting() when deleting != null:
return deleting(_that);case _Deleted() when deleted != null:
return deleted(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserEntity user)?  loaded,TResult Function()?  updating,TResult Function( UserEntity user)?  updated,TResult Function()?  uploadingImage,TResult Function( String imageUrl)?  imageUploaded,TResult Function()?  changingPassword,TResult Function()?  passwordChanged,TResult Function()?  deleting,TResult Function()?  deleted,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.user);case _Updating() when updating != null:
return updating();case _Updated() when updated != null:
return updated(_that.user);case _UploadingImage() when uploadingImage != null:
return uploadingImage();case _ImageUploaded() when imageUploaded != null:
return imageUploaded(_that.imageUrl);case _ChangingPassword() when changingPassword != null:
return changingPassword();case _PasswordChanged() when passwordChanged != null:
return passwordChanged();case _Deleting() when deleting != null:
return deleting();case _Deleted() when deleted != null:
return deleted();case _Error() when error != null:
return error(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserEntity user)  loaded,required TResult Function()  updating,required TResult Function( UserEntity user)  updated,required TResult Function()  uploadingImage,required TResult Function( String imageUrl)  imageUploaded,required TResult Function()  changingPassword,required TResult Function()  passwordChanged,required TResult Function()  deleting,required TResult Function()  deleted,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.user);case _Updating():
return updating();case _Updated():
return updated(_that.user);case _UploadingImage():
return uploadingImage();case _ImageUploaded():
return imageUploaded(_that.imageUrl);case _ChangingPassword():
return changingPassword();case _PasswordChanged():
return passwordChanged();case _Deleting():
return deleting();case _Deleted():
return deleted();case _Error():
return error(_that.failure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserEntity user)?  loaded,TResult? Function()?  updating,TResult? Function( UserEntity user)?  updated,TResult? Function()?  uploadingImage,TResult? Function( String imageUrl)?  imageUploaded,TResult? Function()?  changingPassword,TResult? Function()?  passwordChanged,TResult? Function()?  deleting,TResult? Function()?  deleted,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.user);case _Updating() when updating != null:
return updating();case _Updated() when updated != null:
return updated(_that.user);case _UploadingImage() when uploadingImage != null:
return uploadingImage();case _ImageUploaded() when imageUploaded != null:
return imageUploaded(_that.imageUrl);case _ChangingPassword() when changingPassword != null:
return changingPassword();case _PasswordChanged() when passwordChanged != null:
return passwordChanged();case _Deleting() when deleting != null:
return deleting();case _Deleted() when deleted != null:
return deleted();case _Error() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.initial()';
}


}




/// @nodoc


class _Loading implements ProfileState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.loading()';
}


}




/// @nodoc


class _Loaded implements ProfileState {
  const _Loaded(this.user);
  

 final  UserEntity user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileState.loaded(user: $user)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Loaded(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class _Updating implements ProfileState {
  const _Updating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.updating()';
}


}




/// @nodoc


class _Updated implements ProfileState {
  const _Updated(this.user);
  

 final  UserEntity user;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCopyWith<_Updated> get copyWith => __$UpdatedCopyWithImpl<_Updated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Updated&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileState.updated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$UpdatedCopyWith(_Updated value, $Res Function(_Updated) _then) = __$UpdatedCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$UpdatedCopyWithImpl<$Res>
    implements _$UpdatedCopyWith<$Res> {
  __$UpdatedCopyWithImpl(this._self, this._then);

  final _Updated _self;
  final $Res Function(_Updated) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_Updated(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class _UploadingImage implements ProfileState {
  const _UploadingImage();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadingImage);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.uploadingImage()';
}


}




/// @nodoc


class _ImageUploaded implements ProfileState {
  const _ImageUploaded(this.imageUrl);
  

 final  String imageUrl;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUploadedCopyWith<_ImageUploaded> get copyWith => __$ImageUploadedCopyWithImpl<_ImageUploaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUploaded&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}


@override
int get hashCode => Object.hash(runtimeType,imageUrl);

@override
String toString() {
  return 'ProfileState.imageUploaded(imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ImageUploadedCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ImageUploadedCopyWith(_ImageUploaded value, $Res Function(_ImageUploaded) _then) = __$ImageUploadedCopyWithImpl;
@useResult
$Res call({
 String imageUrl
});




}
/// @nodoc
class __$ImageUploadedCopyWithImpl<$Res>
    implements _$ImageUploadedCopyWith<$Res> {
  __$ImageUploadedCopyWithImpl(this._self, this._then);

  final _ImageUploaded _self;
  final $Res Function(_ImageUploaded) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,}) {
  return _then(_ImageUploaded(
null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangingPassword implements ProfileState {
  const _ChangingPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangingPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.changingPassword()';
}


}




/// @nodoc


class _PasswordChanged implements ProfileState {
  const _PasswordChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.passwordChanged()';
}


}




/// @nodoc


class _Deleting implements ProfileState {
  const _Deleting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.deleting()';
}


}




/// @nodoc


class _Deleted implements ProfileState {
  const _Deleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Deleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileState.deleted()';
}


}




/// @nodoc


class _Error implements ProfileState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProfileState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
