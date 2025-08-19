// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrdersEvent {

 String get userId;
/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersEventCopyWith<OrdersEvent> get copyWith => _$OrdersEventCopyWithImpl<OrdersEvent>(this as OrdersEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'OrdersEvent(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $OrdersEventCopyWith<$Res>  {
  factory $OrdersEventCopyWith(OrdersEvent value, $Res Function(OrdersEvent) _then) = _$OrdersEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$OrdersEventCopyWithImpl<$Res>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._self, this._then);

  final OrdersEvent _self;
  final $Res Function(OrdersEvent) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersEvent].
extension OrdersEventPatterns on OrdersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetOrders value)?  getOrders,TResult Function( _GetOrderDetails value)?  getOrderDetails,TResult Function( _CancelOrder value)?  cancelOrder,TResult Function( _RefreshOrders value)?  refreshOrders,TResult Function( _LoadMoreOrders value)?  loadMoreOrders,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetOrders() when getOrders != null:
return getOrders(_that);case _GetOrderDetails() when getOrderDetails != null:
return getOrderDetails(_that);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that);case _RefreshOrders() when refreshOrders != null:
return refreshOrders(_that);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetOrders value)  getOrders,required TResult Function( _GetOrderDetails value)  getOrderDetails,required TResult Function( _CancelOrder value)  cancelOrder,required TResult Function( _RefreshOrders value)  refreshOrders,required TResult Function( _LoadMoreOrders value)  loadMoreOrders,}){
final _that = this;
switch (_that) {
case _GetOrders():
return getOrders(_that);case _GetOrderDetails():
return getOrderDetails(_that);case _CancelOrder():
return cancelOrder(_that);case _RefreshOrders():
return refreshOrders(_that);case _LoadMoreOrders():
return loadMoreOrders(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetOrders value)?  getOrders,TResult? Function( _GetOrderDetails value)?  getOrderDetails,TResult? Function( _CancelOrder value)?  cancelOrder,TResult? Function( _RefreshOrders value)?  refreshOrders,TResult? Function( _LoadMoreOrders value)?  loadMoreOrders,}){
final _that = this;
switch (_that) {
case _GetOrders() when getOrders != null:
return getOrders(_that);case _GetOrderDetails() when getOrderDetails != null:
return getOrderDetails(_that);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that);case _RefreshOrders() when refreshOrders != null:
return refreshOrders(_that);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  int page,  int limit)?  getOrders,TResult Function( String userId,  int orderId)?  getOrderDetails,TResult Function( String userId,  int orderId)?  cancelOrder,TResult Function( String userId)?  refreshOrders,TResult Function( String userId,  int page)?  loadMoreOrders,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetOrders() when getOrders != null:
return getOrders(_that.userId,_that.page,_that.limit);case _GetOrderDetails() when getOrderDetails != null:
return getOrderDetails(_that.userId,_that.orderId);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that.userId,_that.orderId);case _RefreshOrders() when refreshOrders != null:
return refreshOrders(_that.userId);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that.userId,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  int page,  int limit)  getOrders,required TResult Function( String userId,  int orderId)  getOrderDetails,required TResult Function( String userId,  int orderId)  cancelOrder,required TResult Function( String userId)  refreshOrders,required TResult Function( String userId,  int page)  loadMoreOrders,}) {final _that = this;
switch (_that) {
case _GetOrders():
return getOrders(_that.userId,_that.page,_that.limit);case _GetOrderDetails():
return getOrderDetails(_that.userId,_that.orderId);case _CancelOrder():
return cancelOrder(_that.userId,_that.orderId);case _RefreshOrders():
return refreshOrders(_that.userId);case _LoadMoreOrders():
return loadMoreOrders(_that.userId,_that.page);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  int page,  int limit)?  getOrders,TResult? Function( String userId,  int orderId)?  getOrderDetails,TResult? Function( String userId,  int orderId)?  cancelOrder,TResult? Function( String userId)?  refreshOrders,TResult? Function( String userId,  int page)?  loadMoreOrders,}) {final _that = this;
switch (_that) {
case _GetOrders() when getOrders != null:
return getOrders(_that.userId,_that.page,_that.limit);case _GetOrderDetails() when getOrderDetails != null:
return getOrderDetails(_that.userId,_that.orderId);case _CancelOrder() when cancelOrder != null:
return cancelOrder(_that.userId,_that.orderId);case _RefreshOrders() when refreshOrders != null:
return refreshOrders(_that.userId);case _LoadMoreOrders() when loadMoreOrders != null:
return loadMoreOrders(_that.userId,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _GetOrders implements OrdersEvent {
  const _GetOrders({required this.userId, this.page = 1, this.limit = 20});
  

@override final  String userId;
@JsonKey() final  int page;
@JsonKey() final  int limit;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetOrdersCopyWith<_GetOrders> get copyWith => __$GetOrdersCopyWithImpl<_GetOrders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrders&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,userId,page,limit);

@override
String toString() {
  return 'OrdersEvent.getOrders(userId: $userId, page: $page, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$GetOrdersCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$GetOrdersCopyWith(_GetOrders value, $Res Function(_GetOrders) _then) = __$GetOrdersCopyWithImpl;
@override @useResult
$Res call({
 String userId, int page, int limit
});




}
/// @nodoc
class __$GetOrdersCopyWithImpl<$Res>
    implements _$GetOrdersCopyWith<$Res> {
  __$GetOrdersCopyWithImpl(this._self, this._then);

  final _GetOrders _self;
  final $Res Function(_GetOrders) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? page = null,Object? limit = null,}) {
  return _then(_GetOrders(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _GetOrderDetails implements OrdersEvent {
  const _GetOrderDetails({required this.userId, required this.orderId});
  

@override final  String userId;
 final  int orderId;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetOrderDetailsCopyWith<_GetOrderDetails> get copyWith => __$GetOrderDetailsCopyWithImpl<_GetOrderDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetOrderDetails&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,orderId);

@override
String toString() {
  return 'OrdersEvent.getOrderDetails(userId: $userId, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$GetOrderDetailsCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$GetOrderDetailsCopyWith(_GetOrderDetails value, $Res Function(_GetOrderDetails) _then) = __$GetOrderDetailsCopyWithImpl;
@override @useResult
$Res call({
 String userId, int orderId
});




}
/// @nodoc
class __$GetOrderDetailsCopyWithImpl<$Res>
    implements _$GetOrderDetailsCopyWith<$Res> {
  __$GetOrderDetailsCopyWithImpl(this._self, this._then);

  final _GetOrderDetails _self;
  final $Res Function(_GetOrderDetails) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? orderId = null,}) {
  return _then(_GetOrderDetails(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _CancelOrder implements OrdersEvent {
  const _CancelOrder({required this.userId, required this.orderId});
  

@override final  String userId;
 final  int orderId;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CancelOrderCopyWith<_CancelOrder> get copyWith => __$CancelOrderCopyWithImpl<_CancelOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOrder&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}


@override
int get hashCode => Object.hash(runtimeType,userId,orderId);

@override
String toString() {
  return 'OrdersEvent.cancelOrder(userId: $userId, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$CancelOrderCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$CancelOrderCopyWith(_CancelOrder value, $Res Function(_CancelOrder) _then) = __$CancelOrderCopyWithImpl;
@override @useResult
$Res call({
 String userId, int orderId
});




}
/// @nodoc
class __$CancelOrderCopyWithImpl<$Res>
    implements _$CancelOrderCopyWith<$Res> {
  __$CancelOrderCopyWithImpl(this._self, this._then);

  final _CancelOrder _self;
  final $Res Function(_CancelOrder) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? orderId = null,}) {
  return _then(_CancelOrder(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RefreshOrders implements OrdersEvent {
  const _RefreshOrders({required this.userId});
  

@override final  String userId;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshOrdersCopyWith<_RefreshOrders> get copyWith => __$RefreshOrdersCopyWithImpl<_RefreshOrders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshOrders&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'OrdersEvent.refreshOrders(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$RefreshOrdersCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$RefreshOrdersCopyWith(_RefreshOrders value, $Res Function(_RefreshOrders) _then) = __$RefreshOrdersCopyWithImpl;
@override @useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$RefreshOrdersCopyWithImpl<$Res>
    implements _$RefreshOrdersCopyWith<$Res> {
  __$RefreshOrdersCopyWithImpl(this._self, this._then);

  final _RefreshOrders _self;
  final $Res Function(_RefreshOrders) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_RefreshOrders(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadMoreOrders implements OrdersEvent {
  const _LoadMoreOrders({required this.userId, required this.page});
  

@override final  String userId;
 final  int page;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadMoreOrdersCopyWith<_LoadMoreOrders> get copyWith => __$LoadMoreOrdersCopyWithImpl<_LoadMoreOrders>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadMoreOrders&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,userId,page);

@override
String toString() {
  return 'OrdersEvent.loadMoreOrders(userId: $userId, page: $page)';
}


}

/// @nodoc
abstract mixin class _$LoadMoreOrdersCopyWith<$Res> implements $OrdersEventCopyWith<$Res> {
  factory _$LoadMoreOrdersCopyWith(_LoadMoreOrders value, $Res Function(_LoadMoreOrders) _then) = __$LoadMoreOrdersCopyWithImpl;
@override @useResult
$Res call({
 String userId, int page
});




}
/// @nodoc
class __$LoadMoreOrdersCopyWithImpl<$Res>
    implements _$LoadMoreOrdersCopyWith<$Res> {
  __$LoadMoreOrdersCopyWithImpl(this._self, this._then);

  final _LoadMoreOrders _self;
  final $Res Function(_LoadMoreOrders) _then;

/// Create a copy of OrdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? page = null,}) {
  return _then(_LoadMoreOrders(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
