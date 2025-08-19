// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState()';
}


}

/// @nodoc
class $OrdersStateCopyWith<$Res>  {
$OrdersStateCopyWith(OrdersState _, $Res Function(OrdersState) __);
}


/// Adds pattern-matching-related methods to [OrdersState].
extension OrdersStatePatterns on OrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _LoadingMore value)?  loadingMore,TResult Function( _OrderDetailsLoaded value)?  orderDetailsLoaded,TResult Function( _OrderCancelled value)?  orderCancelled,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadingMore() when loadingMore != null:
return loadingMore(_that);case _OrderDetailsLoaded() when orderDetailsLoaded != null:
return orderDetailsLoaded(_that);case _OrderCancelled() when orderCancelled != null:
return orderCancelled(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _LoadingMore value)  loadingMore,required TResult Function( _OrderDetailsLoaded value)  orderDetailsLoaded,required TResult Function( _OrderCancelled value)  orderCancelled,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _LoadingMore():
return loadingMore(_that);case _OrderDetailsLoaded():
return orderDetailsLoaded(_that);case _OrderCancelled():
return orderCancelled(_that);case _Error():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _LoadingMore value)?  loadingMore,TResult? Function( _OrderDetailsLoaded value)?  orderDetailsLoaded,TResult? Function( _OrderCancelled value)?  orderCancelled,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadingMore() when loadingMore != null:
return loadingMore(_that);case _OrderDetailsLoaded() when orderDetailsLoaded != null:
return orderDetailsLoaded(_that);case _OrderCancelled() when orderCancelled != null:
return orderCancelled(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<order_entity.Order> orders,  bool hasReachedMax,  int currentPage)?  loaded,TResult Function( List<order_entity.Order> orders,  int currentPage)?  loadingMore,TResult Function( order_entity.Order order,  List<order_entity.Order>? orders)?  orderDetailsLoaded,TResult Function( int orderId,  List<order_entity.Order> orders)?  orderCancelled,TResult Function( String message,  List<order_entity.Order>? orders)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.orders,_that.hasReachedMax,_that.currentPage);case _LoadingMore() when loadingMore != null:
return loadingMore(_that.orders,_that.currentPage);case _OrderDetailsLoaded() when orderDetailsLoaded != null:
return orderDetailsLoaded(_that.order,_that.orders);case _OrderCancelled() when orderCancelled != null:
return orderCancelled(_that.orderId,_that.orders);case _Error() when error != null:
return error(_that.message,_that.orders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<order_entity.Order> orders,  bool hasReachedMax,  int currentPage)  loaded,required TResult Function( List<order_entity.Order> orders,  int currentPage)  loadingMore,required TResult Function( order_entity.Order order,  List<order_entity.Order>? orders)  orderDetailsLoaded,required TResult Function( int orderId,  List<order_entity.Order> orders)  orderCancelled,required TResult Function( String message,  List<order_entity.Order>? orders)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.orders,_that.hasReachedMax,_that.currentPage);case _LoadingMore():
return loadingMore(_that.orders,_that.currentPage);case _OrderDetailsLoaded():
return orderDetailsLoaded(_that.order,_that.orders);case _OrderCancelled():
return orderCancelled(_that.orderId,_that.orders);case _Error():
return error(_that.message,_that.orders);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<order_entity.Order> orders,  bool hasReachedMax,  int currentPage)?  loaded,TResult? Function( List<order_entity.Order> orders,  int currentPage)?  loadingMore,TResult? Function( order_entity.Order order,  List<order_entity.Order>? orders)?  orderDetailsLoaded,TResult? Function( int orderId,  List<order_entity.Order> orders)?  orderCancelled,TResult? Function( String message,  List<order_entity.Order>? orders)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.orders,_that.hasReachedMax,_that.currentPage);case _LoadingMore() when loadingMore != null:
return loadingMore(_that.orders,_that.currentPage);case _OrderDetailsLoaded() when orderDetailsLoaded != null:
return orderDetailsLoaded(_that.order,_that.orders);case _OrderCancelled() when orderCancelled != null:
return orderCancelled(_that.orderId,_that.orders);case _Error() when error != null:
return error(_that.message,_that.orders);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements OrdersState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.initial()';
}


}




/// @nodoc


class _Loading implements OrdersState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OrdersState.loading()';
}


}




/// @nodoc


class _Loaded implements OrdersState {
  const _Loaded({required final  List<order_entity.Order> orders, this.hasReachedMax = false, this.currentPage = 1}): _orders = orders;
  

 final  List<order_entity.Order> _orders;
 List<order_entity.Order> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@JsonKey() final  bool hasReachedMax;
@JsonKey() final  int currentPage;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),hasReachedMax,currentPage);

@override
String toString() {
  return 'OrdersState.loaded(orders: $orders, hasReachedMax: $hasReachedMax, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<order_entity.Order> orders, bool hasReachedMax, int currentPage
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? hasReachedMax = null,Object? currentPage = null,}) {
  return _then(_Loaded(
orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<order_entity.Order>,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LoadingMore implements OrdersState {
  const _LoadingMore({required final  List<order_entity.Order> orders, this.currentPage = 1}): _orders = orders;
  

 final  List<order_entity.Order> _orders;
 List<order_entity.Order> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

@JsonKey() final  int currentPage;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingMoreCopyWith<_LoadingMore> get copyWith => __$LoadingMoreCopyWithImpl<_LoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingMore&&const DeepCollectionEquality().equals(other._orders, _orders)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_orders),currentPage);

@override
String toString() {
  return 'OrdersState.loadingMore(orders: $orders, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$LoadingMoreCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$LoadingMoreCopyWith(_LoadingMore value, $Res Function(_LoadingMore) _then) = __$LoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<order_entity.Order> orders, int currentPage
});




}
/// @nodoc
class __$LoadingMoreCopyWithImpl<$Res>
    implements _$LoadingMoreCopyWith<$Res> {
  __$LoadingMoreCopyWithImpl(this._self, this._then);

  final _LoadingMore _self;
  final $Res Function(_LoadingMore) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orders = null,Object? currentPage = null,}) {
  return _then(_LoadingMore(
orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<order_entity.Order>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _OrderDetailsLoaded implements OrdersState {
  const _OrderDetailsLoaded({required this.order, final  List<order_entity.Order>? orders}): _orders = orders;
  

 final  order_entity.Order order;
 final  List<order_entity.Order>? _orders;
 List<order_entity.Order>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailsLoadedCopyWith<_OrderDetailsLoaded> get copyWith => __$OrderDetailsLoadedCopyWithImpl<_OrderDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailsLoaded&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrdersState.orderDetailsLoaded(order: $order, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailsLoadedCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$OrderDetailsLoadedCopyWith(_OrderDetailsLoaded value, $Res Function(_OrderDetailsLoaded) _then) = __$OrderDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 order_entity.Order order, List<order_entity.Order>? orders
});




}
/// @nodoc
class __$OrderDetailsLoadedCopyWithImpl<$Res>
    implements _$OrderDetailsLoadedCopyWith<$Res> {
  __$OrderDetailsLoadedCopyWithImpl(this._self, this._then);

  final _OrderDetailsLoaded _self;
  final $Res Function(_OrderDetailsLoaded) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,Object? orders = freezed,}) {
  return _then(_OrderDetailsLoaded(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as order_entity.Order,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<order_entity.Order>?,
  ));
}


}

/// @nodoc


class _OrderCancelled implements OrdersState {
  const _OrderCancelled({required this.orderId, required final  List<order_entity.Order> orders}): _orders = orders;
  

 final  int orderId;
 final  List<order_entity.Order> _orders;
 List<order_entity.Order> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}


/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCancelledCopyWith<_OrderCancelled> get copyWith => __$OrderCancelledCopyWithImpl<_OrderCancelled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCancelled&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrdersState.orderCancelled(orderId: $orderId, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$OrderCancelledCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$OrderCancelledCopyWith(_OrderCancelled value, $Res Function(_OrderCancelled) _then) = __$OrderCancelledCopyWithImpl;
@useResult
$Res call({
 int orderId, List<order_entity.Order> orders
});




}
/// @nodoc
class __$OrderCancelledCopyWithImpl<$Res>
    implements _$OrderCancelledCopyWith<$Res> {
  __$OrderCancelledCopyWithImpl(this._self, this._then);

  final _OrderCancelled _self;
  final $Res Function(_OrderCancelled) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? orders = null,}) {
  return _then(_OrderCancelled(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<order_entity.Order>,
  ));
}


}

/// @nodoc


class _Error implements OrdersState {
  const _Error({required this.message, final  List<order_entity.Order>? orders}): _orders = orders;
  

 final  String message;
 final  List<order_entity.Order>? _orders;
 List<order_entity.Order>? get orders {
  final value = _orders;
  if (value == null) return null;
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._orders, _orders));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_orders));

@override
String toString() {
  return 'OrdersState.error(message: $message, orders: $orders)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $OrdersStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, List<order_entity.Order>? orders
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of OrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? orders = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,orders: freezed == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<order_entity.Order>?,
  ));
}


}

// dart format on
