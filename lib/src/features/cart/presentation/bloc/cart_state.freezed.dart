// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState()';
}


}

/// @nodoc
class $CartStateCopyWith<$Res>  {
$CartStateCopyWith(CartState _, $Res Function(CartState) __);
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _AddingToCart value)?  addingToCart,TResult Function( _AddedToCart value)?  addedToCart,TResult Function( _UpdatingCart value)?  updatingCart,TResult Function( _UpdatedCart value)?  updatedCart,TResult Function( _RemovingFromCart value)?  removingFromCart,TResult Function( _RemovedFromCart value)?  removedFromCart,TResult Function( _ClearingCart value)?  clearingCart,TResult Function( _ClearedCart value)?  clearedCart,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _AddingToCart() when addingToCart != null:
return addingToCart(_that);case _AddedToCart() when addedToCart != null:
return addedToCart(_that);case _UpdatingCart() when updatingCart != null:
return updatingCart(_that);case _UpdatedCart() when updatedCart != null:
return updatedCart(_that);case _RemovingFromCart() when removingFromCart != null:
return removingFromCart(_that);case _RemovedFromCart() when removedFromCart != null:
return removedFromCart(_that);case _ClearingCart() when clearingCart != null:
return clearingCart(_that);case _ClearedCart() when clearedCart != null:
return clearedCart(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _AddingToCart value)  addingToCart,required TResult Function( _AddedToCart value)  addedToCart,required TResult Function( _UpdatingCart value)  updatingCart,required TResult Function( _UpdatedCart value)  updatedCart,required TResult Function( _RemovingFromCart value)  removingFromCart,required TResult Function( _RemovedFromCart value)  removedFromCart,required TResult Function( _ClearingCart value)  clearingCart,required TResult Function( _ClearedCart value)  clearedCart,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _AddingToCart():
return addingToCart(_that);case _AddedToCart():
return addedToCart(_that);case _UpdatingCart():
return updatingCart(_that);case _UpdatedCart():
return updatedCart(_that);case _RemovingFromCart():
return removingFromCart(_that);case _RemovedFromCart():
return removedFromCart(_that);case _ClearingCart():
return clearingCart(_that);case _ClearedCart():
return clearedCart(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _AddingToCart value)?  addingToCart,TResult? Function( _AddedToCart value)?  addedToCart,TResult? Function( _UpdatingCart value)?  updatingCart,TResult? Function( _UpdatedCart value)?  updatedCart,TResult? Function( _RemovingFromCart value)?  removingFromCart,TResult? Function( _RemovedFromCart value)?  removedFromCart,TResult? Function( _ClearingCart value)?  clearingCart,TResult? Function( _ClearedCart value)?  clearedCart,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _AddingToCart() when addingToCart != null:
return addingToCart(_that);case _AddedToCart() when addedToCart != null:
return addedToCart(_that);case _UpdatingCart() when updatingCart != null:
return updatingCart(_that);case _UpdatedCart() when updatedCart != null:
return updatedCart(_that);case _RemovingFromCart() when removingFromCart != null:
return removingFromCart(_that);case _RemovedFromCart() when removedFromCart != null:
return removedFromCart(_that);case _ClearingCart() when clearingCart != null:
return clearingCart(_that);case _ClearedCart() when clearedCart != null:
return clearedCart(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Cart cart,  int itemCount)?  loaded,TResult Function()?  addingToCart,TResult Function( CartItem cartItem,  Cart updatedCart)?  addedToCart,TResult Function()?  updatingCart,TResult Function( Cart updatedCart)?  updatedCart,TResult Function()?  removingFromCart,TResult Function( Cart updatedCart)?  removedFromCart,TResult Function()?  clearingCart,TResult Function()?  clearedCart,TResult Function( String message,  Cart? cart)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.cart,_that.itemCount);case _AddingToCart() when addingToCart != null:
return addingToCart();case _AddedToCart() when addedToCart != null:
return addedToCart(_that.cartItem,_that.updatedCart);case _UpdatingCart() when updatingCart != null:
return updatingCart();case _UpdatedCart() when updatedCart != null:
return updatedCart(_that.updatedCart);case _RemovingFromCart() when removingFromCart != null:
return removingFromCart();case _RemovedFromCart() when removedFromCart != null:
return removedFromCart(_that.updatedCart);case _ClearingCart() when clearingCart != null:
return clearingCart();case _ClearedCart() when clearedCart != null:
return clearedCart();case _Error() when error != null:
return error(_that.message,_that.cart);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Cart cart,  int itemCount)  loaded,required TResult Function()  addingToCart,required TResult Function( CartItem cartItem,  Cart updatedCart)  addedToCart,required TResult Function()  updatingCart,required TResult Function( Cart updatedCart)  updatedCart,required TResult Function()  removingFromCart,required TResult Function( Cart updatedCart)  removedFromCart,required TResult Function()  clearingCart,required TResult Function()  clearedCart,required TResult Function( String message,  Cart? cart)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.cart,_that.itemCount);case _AddingToCart():
return addingToCart();case _AddedToCart():
return addedToCart(_that.cartItem,_that.updatedCart);case _UpdatingCart():
return updatingCart();case _UpdatedCart():
return updatedCart(_that.updatedCart);case _RemovingFromCart():
return removingFromCart();case _RemovedFromCart():
return removedFromCart(_that.updatedCart);case _ClearingCart():
return clearingCart();case _ClearedCart():
return clearedCart();case _Error():
return error(_that.message,_that.cart);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Cart cart,  int itemCount)?  loaded,TResult? Function()?  addingToCart,TResult? Function( CartItem cartItem,  Cart updatedCart)?  addedToCart,TResult? Function()?  updatingCart,TResult? Function( Cart updatedCart)?  updatedCart,TResult? Function()?  removingFromCart,TResult? Function( Cart updatedCart)?  removedFromCart,TResult? Function()?  clearingCart,TResult? Function()?  clearedCart,TResult? Function( String message,  Cart? cart)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.cart,_that.itemCount);case _AddingToCart() when addingToCart != null:
return addingToCart();case _AddedToCart() when addedToCart != null:
return addedToCart(_that.cartItem,_that.updatedCart);case _UpdatingCart() when updatingCart != null:
return updatingCart();case _UpdatedCart() when updatedCart != null:
return updatedCart(_that.updatedCart);case _RemovingFromCart() when removingFromCart != null:
return removingFromCart();case _RemovedFromCart() when removedFromCart != null:
return removedFromCart(_that.updatedCart);case _ClearingCart() when clearingCart != null:
return clearingCart();case _ClearedCart() when clearedCart != null:
return clearedCart();case _Error() when error != null:
return error(_that.message,_that.cart);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.initial()';
}


}




/// @nodoc


class _Loading implements CartState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.loading()';
}


}




/// @nodoc


class _Loaded implements CartState {
  const _Loaded({required this.cart, this.itemCount = 0});
  

 final  Cart cart;
@JsonKey() final  int itemCount;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.cart, cart) || other.cart == cart)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount));
}


@override
int get hashCode => Object.hash(runtimeType,cart,itemCount);

@override
String toString() {
  return 'CartState.loaded(cart: $cart, itemCount: $itemCount)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 Cart cart, int itemCount
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cart = null,Object? itemCount = null,}) {
  return _then(_Loaded(
cart: null == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as Cart,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _AddingToCart implements CartState {
  const _AddingToCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddingToCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.addingToCart()';
}


}




/// @nodoc


class _AddedToCart implements CartState {
  const _AddedToCart({required this.cartItem, required this.updatedCart});
  

 final  CartItem cartItem;
 final  Cart updatedCart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddedToCartCopyWith<_AddedToCart> get copyWith => __$AddedToCartCopyWithImpl<_AddedToCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddedToCart&&(identical(other.cartItem, cartItem) || other.cartItem == cartItem)&&(identical(other.updatedCart, updatedCart) || other.updatedCart == updatedCart));
}


@override
int get hashCode => Object.hash(runtimeType,cartItem,updatedCart);

@override
String toString() {
  return 'CartState.addedToCart(cartItem: $cartItem, updatedCart: $updatedCart)';
}


}

/// @nodoc
abstract mixin class _$AddedToCartCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$AddedToCartCopyWith(_AddedToCart value, $Res Function(_AddedToCart) _then) = __$AddedToCartCopyWithImpl;
@useResult
$Res call({
 CartItem cartItem, Cart updatedCart
});




}
/// @nodoc
class __$AddedToCartCopyWithImpl<$Res>
    implements _$AddedToCartCopyWith<$Res> {
  __$AddedToCartCopyWithImpl(this._self, this._then);

  final _AddedToCart _self;
  final $Res Function(_AddedToCart) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cartItem = null,Object? updatedCart = null,}) {
  return _then(_AddedToCart(
cartItem: null == cartItem ? _self.cartItem : cartItem // ignore: cast_nullable_to_non_nullable
as CartItem,updatedCart: null == updatedCart ? _self.updatedCart : updatedCart // ignore: cast_nullable_to_non_nullable
as Cart,
  ));
}


}

/// @nodoc


class _UpdatingCart implements CartState {
  const _UpdatingCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.updatingCart()';
}


}




/// @nodoc


class _UpdatedCart implements CartState {
  const _UpdatedCart({required this.updatedCart});
  

 final  Cart updatedCart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatedCartCopyWith<_UpdatedCart> get copyWith => __$UpdatedCartCopyWithImpl<_UpdatedCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatedCart&&(identical(other.updatedCart, updatedCart) || other.updatedCart == updatedCart));
}


@override
int get hashCode => Object.hash(runtimeType,updatedCart);

@override
String toString() {
  return 'CartState.updatedCart(updatedCart: $updatedCart)';
}


}

/// @nodoc
abstract mixin class _$UpdatedCartCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$UpdatedCartCopyWith(_UpdatedCart value, $Res Function(_UpdatedCart) _then) = __$UpdatedCartCopyWithImpl;
@useResult
$Res call({
 Cart updatedCart
});




}
/// @nodoc
class __$UpdatedCartCopyWithImpl<$Res>
    implements _$UpdatedCartCopyWith<$Res> {
  __$UpdatedCartCopyWithImpl(this._self, this._then);

  final _UpdatedCart _self;
  final $Res Function(_UpdatedCart) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedCart = null,}) {
  return _then(_UpdatedCart(
updatedCart: null == updatedCart ? _self.updatedCart : updatedCart // ignore: cast_nullable_to_non_nullable
as Cart,
  ));
}


}

/// @nodoc


class _RemovingFromCart implements CartState {
  const _RemovingFromCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovingFromCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.removingFromCart()';
}


}




/// @nodoc


class _RemovedFromCart implements CartState {
  const _RemovedFromCart({required this.updatedCart});
  

 final  Cart updatedCart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemovedFromCartCopyWith<_RemovedFromCart> get copyWith => __$RemovedFromCartCopyWithImpl<_RemovedFromCart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovedFromCart&&(identical(other.updatedCart, updatedCart) || other.updatedCart == updatedCart));
}


@override
int get hashCode => Object.hash(runtimeType,updatedCart);

@override
String toString() {
  return 'CartState.removedFromCart(updatedCart: $updatedCart)';
}


}

/// @nodoc
abstract mixin class _$RemovedFromCartCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$RemovedFromCartCopyWith(_RemovedFromCart value, $Res Function(_RemovedFromCart) _then) = __$RemovedFromCartCopyWithImpl;
@useResult
$Res call({
 Cart updatedCart
});




}
/// @nodoc
class __$RemovedFromCartCopyWithImpl<$Res>
    implements _$RemovedFromCartCopyWith<$Res> {
  __$RemovedFromCartCopyWithImpl(this._self, this._then);

  final _RemovedFromCart _self;
  final $Res Function(_RemovedFromCart) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedCart = null,}) {
  return _then(_RemovedFromCart(
updatedCart: null == updatedCart ? _self.updatedCart : updatedCart // ignore: cast_nullable_to_non_nullable
as Cart,
  ));
}


}

/// @nodoc


class _ClearingCart implements CartState {
  const _ClearingCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearingCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.clearingCart()';
}


}




/// @nodoc


class _ClearedCart implements CartState {
  const _ClearedCart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClearedCart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CartState.clearedCart()';
}


}




/// @nodoc


class _Error implements CartState {
  const _Error({required this.message, this.cart});
  

 final  String message;
 final  Cart? cart;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.cart, cart) || other.cart == cart));
}


@override
int get hashCode => Object.hash(runtimeType,message,cart);

@override
String toString() {
  return 'CartState.error(message: $message, cart: $cart)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, Cart? cart
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cart = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cart: freezed == cart ? _self.cart : cart // ignore: cast_nullable_to_non_nullable
as Cart?,
  ));
}


}

// dart format on
