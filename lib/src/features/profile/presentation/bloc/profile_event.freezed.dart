// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent()';
}


}

/// @nodoc
class $ProfileEventCopyWith<$Res>  {
$ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}


/// Adds pattern-matching-related methods to [ProfileEvent].
extension ProfileEventPatterns on ProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadProfile value)?  loadProfile,TResult Function( _UpdateProfile value)?  updateProfile,TResult Function( _UpdateProfilePicture value)?  updateProfilePicture,TResult Function( _ChangePassword value)?  changePassword,TResult Function( _DeleteProfile value)?  deleteProfile,TResult Function( _RefreshProfile value)?  refreshProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _UpdateProfilePicture() when updateProfilePicture != null:
return updateProfilePicture(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _DeleteProfile() when deleteProfile != null:
return deleteProfile(_that);case _RefreshProfile() when refreshProfile != null:
return refreshProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadProfile value)  loadProfile,required TResult Function( _UpdateProfile value)  updateProfile,required TResult Function( _UpdateProfilePicture value)  updateProfilePicture,required TResult Function( _ChangePassword value)  changePassword,required TResult Function( _DeleteProfile value)  deleteProfile,required TResult Function( _RefreshProfile value)  refreshProfile,}){
final _that = this;
switch (_that) {
case _LoadProfile():
return loadProfile(_that);case _UpdateProfile():
return updateProfile(_that);case _UpdateProfilePicture():
return updateProfilePicture(_that);case _ChangePassword():
return changePassword(_that);case _DeleteProfile():
return deleteProfile(_that);case _RefreshProfile():
return refreshProfile(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadProfile value)?  loadProfile,TResult? Function( _UpdateProfile value)?  updateProfile,TResult? Function( _UpdateProfilePicture value)?  updateProfilePicture,TResult? Function( _ChangePassword value)?  changePassword,TResult? Function( _DeleteProfile value)?  deleteProfile,TResult? Function( _RefreshProfile value)?  refreshProfile,}){
final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile(_that);case _UpdateProfile() when updateProfile != null:
return updateProfile(_that);case _UpdateProfilePicture() when updateProfilePicture != null:
return updateProfilePicture(_that);case _ChangePassword() when changePassword != null:
return changePassword(_that);case _DeleteProfile() when deleteProfile != null:
return deleteProfile(_that);case _RefreshProfile() when refreshProfile != null:
return refreshProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProfile,TResult Function( UserEntity user)?  updateProfile,TResult Function( String imagePath)?  updateProfilePicture,TResult Function( String currentPassword,  String newPassword)?  changePassword,TResult Function()?  deleteProfile,TResult Function()?  refreshProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.user);case _UpdateProfilePicture() when updateProfilePicture != null:
return updateProfilePicture(_that.imagePath);case _ChangePassword() when changePassword != null:
return changePassword(_that.currentPassword,_that.newPassword);case _DeleteProfile() when deleteProfile != null:
return deleteProfile();case _RefreshProfile() when refreshProfile != null:
return refreshProfile();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProfile,required TResult Function( UserEntity user)  updateProfile,required TResult Function( String imagePath)  updateProfilePicture,required TResult Function( String currentPassword,  String newPassword)  changePassword,required TResult Function()  deleteProfile,required TResult Function()  refreshProfile,}) {final _that = this;
switch (_that) {
case _LoadProfile():
return loadProfile();case _UpdateProfile():
return updateProfile(_that.user);case _UpdateProfilePicture():
return updateProfilePicture(_that.imagePath);case _ChangePassword():
return changePassword(_that.currentPassword,_that.newPassword);case _DeleteProfile():
return deleteProfile();case _RefreshProfile():
return refreshProfile();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProfile,TResult? Function( UserEntity user)?  updateProfile,TResult? Function( String imagePath)?  updateProfilePicture,TResult? Function( String currentPassword,  String newPassword)?  changePassword,TResult? Function()?  deleteProfile,TResult? Function()?  refreshProfile,}) {final _that = this;
switch (_that) {
case _LoadProfile() when loadProfile != null:
return loadProfile();case _UpdateProfile() when updateProfile != null:
return updateProfile(_that.user);case _UpdateProfilePicture() when updateProfilePicture != null:
return updateProfilePicture(_that.imagePath);case _ChangePassword() when changePassword != null:
return changePassword(_that.currentPassword,_that.newPassword);case _DeleteProfile() when deleteProfile != null:
return deleteProfile();case _RefreshProfile() when refreshProfile != null:
return refreshProfile();case _:
  return null;

}
}

}

/// @nodoc


class _LoadProfile implements ProfileEvent {
  const _LoadProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.loadProfile()';
}


}




/// @nodoc


class _UpdateProfile implements ProfileEvent {
  const _UpdateProfile(this.user);
  

 final  UserEntity user;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileCopyWith<_UpdateProfile> get copyWith => __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfile&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'ProfileEvent.updateProfile(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(_UpdateProfile value, $Res Function(_UpdateProfile) _then) = __$UpdateProfileCopyWithImpl;
@useResult
$Res call({
 UserEntity user
});




}
/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(this._self, this._then);

  final _UpdateProfile _self;
  final $Res Function(_UpdateProfile) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UpdateProfile(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity,
  ));
}


}

/// @nodoc


class _UpdateProfilePicture implements ProfileEvent {
  const _UpdateProfilePicture(this.imagePath);
  

 final  String imagePath;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfilePictureCopyWith<_UpdateProfilePicture> get copyWith => __$UpdateProfilePictureCopyWithImpl<_UpdateProfilePicture>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfilePicture&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode => Object.hash(runtimeType,imagePath);

@override
String toString() {
  return 'ProfileEvent.updateProfilePicture(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfilePictureCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$UpdateProfilePictureCopyWith(_UpdateProfilePicture value, $Res Function(_UpdateProfilePicture) _then) = __$UpdateProfilePictureCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class __$UpdateProfilePictureCopyWithImpl<$Res>
    implements _$UpdateProfilePictureCopyWith<$Res> {
  __$UpdateProfilePictureCopyWithImpl(this._self, this._then);

  final _UpdateProfilePicture _self;
  final $Res Function(_UpdateProfilePicture) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(_UpdateProfilePicture(
null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangePassword implements ProfileEvent {
  const _ChangePassword({required this.currentPassword, required this.newPassword});
  

 final  String currentPassword;
 final  String newPassword;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordCopyWith<_ChangePassword> get copyWith => __$ChangePasswordCopyWithImpl<_ChangePassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePassword&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,currentPassword,newPassword);

@override
String toString() {
  return 'ProfileEvent.changePassword(currentPassword: $currentPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordCopyWith<$Res> implements $ProfileEventCopyWith<$Res> {
  factory _$ChangePasswordCopyWith(_ChangePassword value, $Res Function(_ChangePassword) _then) = __$ChangePasswordCopyWithImpl;
@useResult
$Res call({
 String currentPassword, String newPassword
});




}
/// @nodoc
class __$ChangePasswordCopyWithImpl<$Res>
    implements _$ChangePasswordCopyWith<$Res> {
  __$ChangePasswordCopyWithImpl(this._self, this._then);

  final _ChangePassword _self;
  final $Res Function(_ChangePassword) _then;

/// Create a copy of ProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPassword = null,Object? newPassword = null,}) {
  return _then(_ChangePassword(
currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _DeleteProfile implements ProfileEvent {
  const _DeleteProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.deleteProfile()';
}


}




/// @nodoc


class _RefreshProfile implements ProfileEvent {
  const _RefreshProfile();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshProfile);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEvent.refreshProfile()';
}


}




// dart format on
