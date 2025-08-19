// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartEvent {

 String get userId;
/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartEventCopyWith<CartEvent> get copyWith => _$CartEventCopyWithImpl<CartEvent>(this as CartEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CartEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CartEventCopyWith<$Res>  {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) _then) = _$CartEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$CartEventCopyWithImpl<$Res>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._self, this._then);

  final CartEvent _self;
  final $Res Function(CartEvent) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CartEvent].
extension CartEventPatterns on CartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadCart value)?  loadCart,TResult Function( _AddToCart value)?  addToCart,TResult Function( _UpdateQuantity value)?  updateQuantity,TResult Function( _RemoveFromCart value)?  removeFromCart,TResult Function( _ClearCart value)?  clearCart,TResult Function( _GetCartItemCount value)?  getCartItemCount,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadCart() when loadCart != null:
return loadCart(_that);case _AddToCart() when addToCart != null:
return addToCart(_that);case _UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case _RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case _ClearCart() when clearCart != null:
return clearCart(_that);case _GetCartItemCount() when getCartItemCount != null:
return getCartItemCount(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadCart value)  loadCart,required TResult Function( _AddToCart value)  addToCart,required TResult Function( _UpdateQuantity value)  updateQuantity,required TResult Function( _RemoveFromCart value)  removeFromCart,required TResult Function( _ClearCart value)  clearCart,required TResult Function( _GetCartItemCount value)  getCartItemCount,}){
final _that = this;
switch (_that) {
case _LoadCart():
return loadCart(_that);case _AddToCart():
return addToCart(_that);case _UpdateQuantity():
return updateQuantity(_that);case _RemoveFromCart():
return removeFromCart(_that);case _ClearCart():
return clearCart(_that);case _GetCartItemCount():
return getCartItemCount(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadCart value)?  loadCart,TResult? Function( _AddToCart value)?  addToCart,TResult? Function( _UpdateQuantity value)?  updateQuantity,TResult? Function( _RemoveFromCart value)?  removeFromCart,TResult? Function( _ClearCart value)?  clearCart,TResult? Function( _GetCartItemCount value)?  getCartItemCount,}){
final _that = this;
switch (_that) {
case _LoadCart() when loadCart != null:
return loadCart(_that);case _AddToCart() when addToCart != null:
return addToCart(_that);case _UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that);case _RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that);case _ClearCart() when clearCart != null:
return clearCart(_that);case _GetCartItemCount() when getCartItemCount != null:
return getCartItemCount(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  loadCart,TResult Function( String userId,  Product product,  int quantity,  Map<String, dynamic>? selectedVariants)?  addToCart,TResult Function( String userId,  int productId,  int quantity)?  updateQuantity,TResult Function( String userId,  int productId)?  removeFromCart,TResult Function( String userId)?  clearCart,TResult Function( String userId)?  getCartItemCount,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadCart() when loadCart != null:
return loadCart(_that.userId);case _AddToCart() when addToCart != null:
return addToCart(_that.userId,_that.product,_that.quantity,_that.selectedVariants);case _UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.userId,_that.productId,_that.quantity);case _RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.userId,_that.productId);case _ClearCart() when clearCart != null:
return clearCart(_that.userId);case _GetCartItemCount() when getCartItemCount != null:
return getCartItemCount(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  loadCart,required TResult Function( String userId,  Product product,  int quantity,  Map<String, dynamic>? selectedVariants)  addToCart,required TResult Function( String userId,  int productId,  int quantity)  updateQuantity,required TResult Function( String userId,  int productId)  removeFromCart,required TResult Function( String userId)  clearCart,required TResult Function( String userId)  getCartItemCount,}) {final _that = this;
switch (_that) {
case _LoadCart():
return loadCart(_that.userId);case _AddToCart():
return addToCart(_that.userId,_that.product,_that.quantity,_that.selectedVariants);case _UpdateQuantity():
return updateQuantity(_that.userId,_that.productId,_that.quantity);case _RemoveFromCart():
return removeFromCart(_that.userId,_that.productId);case _ClearCart():
return clearCart(_that.userId);case _GetCartItemCount():
return getCartItemCount(_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  loadCart,TResult? Function( String userId,  Product product,  int quantity,  Map<String, dynamic>? selectedVariants)?  addToCart,TResult? Function( String userId,  int productId,  int quantity)?  updateQuantity,TResult? Function( String userId,  int productId)?  removeFromCart,TResult? Function( String userId)?  clearCart,TResult? Function( String userId)?  getCartItemCount,}) {final _that = this;
switch (_that) {
case _LoadCart() when loadCart != null:
return loadCart(_that.userId);case _AddToCart() when addToCart != null:
return addToCart(_that.userId,_that.product,_that.quantity,_that.selectedVariants);case _UpdateQuantity() when updateQuantity != null:
return updateQuantity(_that.userId,_that.productId,_that.quantity);case _RemoveFromCart() when removeFromCart != null:
return removeFromCart(_that.userId,_that.productId);case _ClearCart() when clearCart != null:
return clearCart(_that.userId);case _GetCartItemCount() when getCartItemCount != null:
return getCartItemCount(_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _LoadCart implements CartEvent {
  const _LoadCart({required this.userId});
  

@override final  String userId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadCartCopyWith<_LoadCart> get copyWith => __$LoadCartCopyWithImpl<_LoadCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadCart&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CartEvent.loadCart(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$LoadCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$LoadCartCopyWith(_LoadCart value, $Res Function(_LoadCart) _then) = __$LoadCartCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$LoadCartCopyWithImpl<$Res>
    implements _$LoadCartCopyWith<$Res> {
  __$LoadCartCopyWithImpl(this._self, this._then);

  final _LoadCart _self;
  final $Res Function(_LoadCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_LoadCart(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddToCart implements CartEvent {
  const _AddToCart({required this.userId, required this.product, this.quantity = 1, final  Map<String, dynamic>? selectedVariants}): _selectedVariants = selectedVariants;
  

@override final  String userId;
 final  Product product;
@JsonKey() final  int quantity;
 final  Map<String, dynamic>? _selectedVariants;
 Map<String, dynamic>? get selectedVariants {
  final value = _selectedVariants;
  if (value == null) return null;
  if (_selectedVariants is EqualUnmodifiableMapView) return _selectedVariants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddToCartCopyWith<_AddToCart> get copyWith => __$AddToCartCopyWithImpl<_AddToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddToCart&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._selectedVariants, _selectedVariants));
}


@override
int get hashCode => Object.hash(runtimeType,userId,product,quantity,const DeepCollectionEquality().hash(_selectedVariants));

@override
String toString() {
  return 'CartEvent.addToCart(userId: $userId, product: $product, quantity: $quantity, selectedVariants: $selectedVariants)';
}


}

/// @nodoc
abstract mixin class _$AddToCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$AddToCartCopyWith(_AddToCart value, $Res Function(_AddToCart) _then) = __$AddToCartCopyWithImpl;
@override @useResult
$Res call({
 String userId, Product product, int quantity, Map<String, dynamic>? selectedVariants
});




}
/// @nodoc
class __$AddToCartCopyWithImpl<$Res>
    implements _$AddToCartCopyWith<$Res> {
  __$AddToCartCopyWithImpl(this._self, this._then);

  final _AddToCart _self;
  final $Res Function(_AddToCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? product = null,Object? quantity = null,Object? selectedVariants = freezed,}) {
  return _then(_AddToCart(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedVariants: freezed == selectedVariants ? _self._selectedVariants : selectedVariants // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc


class _UpdateQuantity implements CartEvent {
  const _UpdateQuantity({required this.userId, required this.productId, required this.quantity});
  

@override final  String userId;
 final  int productId;
 final  int quantity;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateQuantityCopyWith<_UpdateQuantity> get copyWith => __$UpdateQuantityCopyWithImpl<_UpdateQuantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateQuantity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,userId,productId,quantity);

@override
String toString() {
  return 'CartEvent.updateQuantity(userId: $userId, productId: $productId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$UpdateQuantityCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$UpdateQuantityCopyWith(_UpdateQuantity value, $Res Function(_UpdateQuantity) _then) = __$UpdateQuantityCopyWithImpl;
@override @useResult
$Res call({
 String userId, int productId, int quantity
});




}
/// @nodoc
class __$UpdateQuantityCopyWithImpl<$Res>
    implements _$UpdateQuantityCopyWith<$Res> {
  __$UpdateQuantityCopyWithImpl(this._self, this._then);

  final _UpdateQuantity _self;
  final $Res Function(_UpdateQuantity) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? productId = null,Object? quantity = null,}) {
  return _then(_UpdateQuantity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RemoveFromCart implements CartEvent {
  const _RemoveFromCart({required this.userId, required this.productId});
  

@override final  String userId;
 final  int productId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveFromCartCopyWith<_RemoveFromCart> get copyWith => __$RemoveFromCartCopyWithImpl<_RemoveFromCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveFromCart&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,productId);

@override
String toString() {
  return 'CartEvent.removeFromCart(userId: $userId, productId: $productId)';
}


}

/// @nodoc
abstract mixin class _$RemoveFromCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$RemoveFromCartCopyWith(_RemoveFromCart value, $Res Function(_RemoveFromCart) _then) = __$RemoveFromCartCopyWithImpl;
@override @useResult
$Res call({
 String userId, int productId
});




}
/// @nodoc
class __$RemoveFromCartCopyWithImpl<$Res>
    implements _$RemoveFromCartCopyWith<$Res> {
  __$RemoveFromCartCopyWithImpl(this._self, this._then);

  final _RemoveFromCart _self;
  final $Res Function(_RemoveFromCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? productId = null,}) {
  return _then(_RemoveFromCart(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ClearCart implements CartEvent {
  const _ClearCart({required this.userId});
  

@override final  String userId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClearCartCopyWith<_ClearCart> get copyWith => __$ClearCartCopyWithImpl<_ClearCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearCart&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CartEvent.clearCart(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ClearCartCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$ClearCartCopyWith(_ClearCart value, $Res Function(_ClearCart) _then) = __$ClearCartCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$ClearCartCopyWithImpl<$Res>
    implements _$ClearCartCopyWith<$Res> {
  __$ClearCartCopyWithImpl(this._self, this._then);

  final _ClearCart _self;
  final $Res Function(_ClearCart) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_ClearCart(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetCartItemCount implements CartEvent {
  const _GetCartItemCount({required this.userId});
  

@override final  String userId;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCartItemCountCopyWith<_GetCartItemCount> get copyWith => __$GetCartItemCountCopyWithImpl<_GetCartItemCount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCartItemCount&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'CartEvent.getCartItemCount(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$GetCartItemCountCopyWith<$Res> implements $CartEventCopyWith<$Res> {
  factory _$GetCartItemCountCopyWith(_GetCartItemCount value, $Res Function(_GetCartItemCount) _then) = __$GetCartItemCountCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$GetCartItemCountCopyWithImpl<$Res>
    implements _$GetCartItemCountCopyWith<$Res> {
  __$GetCartItemCountCopyWithImpl(this._self, this._then);

  final _GetCartItemCount _self;
  final $Res Function(_GetCartItemCount) _then;

/// Create a copy of CartEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_GetCartItemCount(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
