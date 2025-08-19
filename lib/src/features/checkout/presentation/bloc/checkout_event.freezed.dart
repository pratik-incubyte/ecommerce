// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent()';
}


}

/// @nodoc
class $CheckoutEventCopyWith<$Res>  {
$CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}


/// Adds pattern-matching-related methods to [CheckoutEvent].
extension CheckoutEventPatterns on CheckoutEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CalculateCheckout value)?  calculateCheckout,TResult Function( _UpdateShippingAddress value)?  updateShippingAddress,TResult Function( _UpdateBillingAddress value)?  updateBillingAddress,TResult Function( _UpdatePaymentMethod value)?  updatePaymentMethod,TResult Function( _UpdateShippingMethod value)?  updateShippingMethod,TResult Function( _ApplyPromoCode value)?  applyPromoCode,TResult Function( _RemovePromoCode value)?  removePromoCode,TResult Function( _ValidateAddress value)?  validateAddress,TResult Function( _GetShippingMethods value)?  getShippingMethods,TResult Function( _ProcessPayment value)?  processPayment,TResult Function( _CompleteCheckout value)?  completeCheckout,TResult Function( _ResetCheckout value)?  resetCheckout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalculateCheckout() when calculateCheckout != null:
return calculateCheckout(_that);case _UpdateShippingAddress() when updateShippingAddress != null:
return updateShippingAddress(_that);case _UpdateBillingAddress() when updateBillingAddress != null:
return updateBillingAddress(_that);case _UpdatePaymentMethod() when updatePaymentMethod != null:
return updatePaymentMethod(_that);case _UpdateShippingMethod() when updateShippingMethod != null:
return updateShippingMethod(_that);case _ApplyPromoCode() when applyPromoCode != null:
return applyPromoCode(_that);case _RemovePromoCode() when removePromoCode != null:
return removePromoCode(_that);case _ValidateAddress() when validateAddress != null:
return validateAddress(_that);case _GetShippingMethods() when getShippingMethods != null:
return getShippingMethods(_that);case _ProcessPayment() when processPayment != null:
return processPayment(_that);case _CompleteCheckout() when completeCheckout != null:
return completeCheckout(_that);case _ResetCheckout() when resetCheckout != null:
return resetCheckout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CalculateCheckout value)  calculateCheckout,required TResult Function( _UpdateShippingAddress value)  updateShippingAddress,required TResult Function( _UpdateBillingAddress value)  updateBillingAddress,required TResult Function( _UpdatePaymentMethod value)  updatePaymentMethod,required TResult Function( _UpdateShippingMethod value)  updateShippingMethod,required TResult Function( _ApplyPromoCode value)  applyPromoCode,required TResult Function( _RemovePromoCode value)  removePromoCode,required TResult Function( _ValidateAddress value)  validateAddress,required TResult Function( _GetShippingMethods value)  getShippingMethods,required TResult Function( _ProcessPayment value)  processPayment,required TResult Function( _CompleteCheckout value)  completeCheckout,required TResult Function( _ResetCheckout value)  resetCheckout,}){
final _that = this;
switch (_that) {
case _CalculateCheckout():
return calculateCheckout(_that);case _UpdateShippingAddress():
return updateShippingAddress(_that);case _UpdateBillingAddress():
return updateBillingAddress(_that);case _UpdatePaymentMethod():
return updatePaymentMethod(_that);case _UpdateShippingMethod():
return updateShippingMethod(_that);case _ApplyPromoCode():
return applyPromoCode(_that);case _RemovePromoCode():
return removePromoCode(_that);case _ValidateAddress():
return validateAddress(_that);case _GetShippingMethods():
return getShippingMethods(_that);case _ProcessPayment():
return processPayment(_that);case _CompleteCheckout():
return completeCheckout(_that);case _ResetCheckout():
return resetCheckout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CalculateCheckout value)?  calculateCheckout,TResult? Function( _UpdateShippingAddress value)?  updateShippingAddress,TResult? Function( _UpdateBillingAddress value)?  updateBillingAddress,TResult? Function( _UpdatePaymentMethod value)?  updatePaymentMethod,TResult? Function( _UpdateShippingMethod value)?  updateShippingMethod,TResult? Function( _ApplyPromoCode value)?  applyPromoCode,TResult? Function( _RemovePromoCode value)?  removePromoCode,TResult? Function( _ValidateAddress value)?  validateAddress,TResult? Function( _GetShippingMethods value)?  getShippingMethods,TResult? Function( _ProcessPayment value)?  processPayment,TResult? Function( _CompleteCheckout value)?  completeCheckout,TResult? Function( _ResetCheckout value)?  resetCheckout,}){
final _that = this;
switch (_that) {
case _CalculateCheckout() when calculateCheckout != null:
return calculateCheckout(_that);case _UpdateShippingAddress() when updateShippingAddress != null:
return updateShippingAddress(_that);case _UpdateBillingAddress() when updateBillingAddress != null:
return updateBillingAddress(_that);case _UpdatePaymentMethod() when updatePaymentMethod != null:
return updatePaymentMethod(_that);case _UpdateShippingMethod() when updateShippingMethod != null:
return updateShippingMethod(_that);case _ApplyPromoCode() when applyPromoCode != null:
return applyPromoCode(_that);case _RemovePromoCode() when removePromoCode != null:
return removePromoCode(_that);case _ValidateAddress() when validateAddress != null:
return validateAddress(_that);case _GetShippingMethods() when getShippingMethods != null:
return getShippingMethods(_that);case _ProcessPayment() when processPayment != null:
return processPayment(_that);case _CompleteCheckout() when completeCheckout != null:
return completeCheckout(_that);case _ResetCheckout() when resetCheckout != null:
return resetCheckout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)?  calculateCheckout,TResult Function( Map<String, dynamic> address)?  updateShippingAddress,TResult Function( Map<String, dynamic> address)?  updateBillingAddress,TResult Function( String paymentMethod)?  updatePaymentMethod,TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)?  updateShippingMethod,TResult Function( String userId,  String promoCode,  double subtotal,  String shippingMethod,  Map<String, dynamic> shippingAddress)?  applyPromoCode,TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress)?  removePromoCode,TResult Function( Map<String, dynamic> address)?  validateAddress,TResult Function( Map<String, dynamic> address,  double weight)?  getShippingMethods,TResult Function( String paymentMethod,  double amount,  Map<String, dynamic> paymentDetails)?  processPayment,TResult Function( Checkout checkout,  Map<String, dynamic> paymentResult)?  completeCheckout,TResult Function()?  resetCheckout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalculateCheckout() when calculateCheckout != null:
return calculateCheckout(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _UpdateShippingAddress() when updateShippingAddress != null:
return updateShippingAddress(_that.address);case _UpdateBillingAddress() when updateBillingAddress != null:
return updateBillingAddress(_that.address);case _UpdatePaymentMethod() when updatePaymentMethod != null:
return updatePaymentMethod(_that.paymentMethod);case _UpdateShippingMethod() when updateShippingMethod != null:
return updateShippingMethod(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _ApplyPromoCode() when applyPromoCode != null:
return applyPromoCode(_that.userId,_that.promoCode,_that.subtotal,_that.shippingMethod,_that.shippingAddress);case _RemovePromoCode() when removePromoCode != null:
return removePromoCode(_that.userId,_that.shippingMethod,_that.shippingAddress);case _ValidateAddress() when validateAddress != null:
return validateAddress(_that.address);case _GetShippingMethods() when getShippingMethods != null:
return getShippingMethods(_that.address,_that.weight);case _ProcessPayment() when processPayment != null:
return processPayment(_that.paymentMethod,_that.amount,_that.paymentDetails);case _CompleteCheckout() when completeCheckout != null:
return completeCheckout(_that.checkout,_that.paymentResult);case _ResetCheckout() when resetCheckout != null:
return resetCheckout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)  calculateCheckout,required TResult Function( Map<String, dynamic> address)  updateShippingAddress,required TResult Function( Map<String, dynamic> address)  updateBillingAddress,required TResult Function( String paymentMethod)  updatePaymentMethod,required TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)  updateShippingMethod,required TResult Function( String userId,  String promoCode,  double subtotal,  String shippingMethod,  Map<String, dynamic> shippingAddress)  applyPromoCode,required TResult Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress)  removePromoCode,required TResult Function( Map<String, dynamic> address)  validateAddress,required TResult Function( Map<String, dynamic> address,  double weight)  getShippingMethods,required TResult Function( String paymentMethod,  double amount,  Map<String, dynamic> paymentDetails)  processPayment,required TResult Function( Checkout checkout,  Map<String, dynamic> paymentResult)  completeCheckout,required TResult Function()  resetCheckout,}) {final _that = this;
switch (_that) {
case _CalculateCheckout():
return calculateCheckout(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _UpdateShippingAddress():
return updateShippingAddress(_that.address);case _UpdateBillingAddress():
return updateBillingAddress(_that.address);case _UpdatePaymentMethod():
return updatePaymentMethod(_that.paymentMethod);case _UpdateShippingMethod():
return updateShippingMethod(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _ApplyPromoCode():
return applyPromoCode(_that.userId,_that.promoCode,_that.subtotal,_that.shippingMethod,_that.shippingAddress);case _RemovePromoCode():
return removePromoCode(_that.userId,_that.shippingMethod,_that.shippingAddress);case _ValidateAddress():
return validateAddress(_that.address);case _GetShippingMethods():
return getShippingMethods(_that.address,_that.weight);case _ProcessPayment():
return processPayment(_that.paymentMethod,_that.amount,_that.paymentDetails);case _CompleteCheckout():
return completeCheckout(_that.checkout,_that.paymentResult);case _ResetCheckout():
return resetCheckout();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)?  calculateCheckout,TResult? Function( Map<String, dynamic> address)?  updateShippingAddress,TResult? Function( Map<String, dynamic> address)?  updateBillingAddress,TResult? Function( String paymentMethod)?  updatePaymentMethod,TResult? Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress,  String? promoCode)?  updateShippingMethod,TResult? Function( String userId,  String promoCode,  double subtotal,  String shippingMethod,  Map<String, dynamic> shippingAddress)?  applyPromoCode,TResult? Function( String userId,  String shippingMethod,  Map<String, dynamic> shippingAddress)?  removePromoCode,TResult? Function( Map<String, dynamic> address)?  validateAddress,TResult? Function( Map<String, dynamic> address,  double weight)?  getShippingMethods,TResult? Function( String paymentMethod,  double amount,  Map<String, dynamic> paymentDetails)?  processPayment,TResult? Function( Checkout checkout,  Map<String, dynamic> paymentResult)?  completeCheckout,TResult? Function()?  resetCheckout,}) {final _that = this;
switch (_that) {
case _CalculateCheckout() when calculateCheckout != null:
return calculateCheckout(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _UpdateShippingAddress() when updateShippingAddress != null:
return updateShippingAddress(_that.address);case _UpdateBillingAddress() when updateBillingAddress != null:
return updateBillingAddress(_that.address);case _UpdatePaymentMethod() when updatePaymentMethod != null:
return updatePaymentMethod(_that.paymentMethod);case _UpdateShippingMethod() when updateShippingMethod != null:
return updateShippingMethod(_that.userId,_that.shippingMethod,_that.shippingAddress,_that.promoCode);case _ApplyPromoCode() when applyPromoCode != null:
return applyPromoCode(_that.userId,_that.promoCode,_that.subtotal,_that.shippingMethod,_that.shippingAddress);case _RemovePromoCode() when removePromoCode != null:
return removePromoCode(_that.userId,_that.shippingMethod,_that.shippingAddress);case _ValidateAddress() when validateAddress != null:
return validateAddress(_that.address);case _GetShippingMethods() when getShippingMethods != null:
return getShippingMethods(_that.address,_that.weight);case _ProcessPayment() when processPayment != null:
return processPayment(_that.paymentMethod,_that.amount,_that.paymentDetails);case _CompleteCheckout() when completeCheckout != null:
return completeCheckout(_that.checkout,_that.paymentResult);case _ResetCheckout() when resetCheckout != null:
return resetCheckout();case _:
  return null;

}
}

}

/// @nodoc


class _CalculateCheckout implements CheckoutEvent {
  const _CalculateCheckout({required this.userId, required this.shippingMethod, required final  Map<String, dynamic> shippingAddress, this.promoCode}): _shippingAddress = shippingAddress;
  

 final  String userId;
 final  String shippingMethod;
 final  Map<String, dynamic> _shippingAddress;
 Map<String, dynamic> get shippingAddress {
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shippingAddress);
}

 final  String? promoCode;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculateCheckoutCopyWith<_CalculateCheckout> get copyWith => __$CalculateCheckoutCopyWithImpl<_CalculateCheckout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalculateCheckout&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode));
}


@override
int get hashCode => Object.hash(runtimeType,userId,shippingMethod,const DeepCollectionEquality().hash(_shippingAddress),promoCode);

@override
String toString() {
  return 'CheckoutEvent.calculateCheckout(userId: $userId, shippingMethod: $shippingMethod, shippingAddress: $shippingAddress, promoCode: $promoCode)';
}


}

/// @nodoc
abstract mixin class _$CalculateCheckoutCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$CalculateCheckoutCopyWith(_CalculateCheckout value, $Res Function(_CalculateCheckout) _then) = __$CalculateCheckoutCopyWithImpl;
@useResult
$Res call({
 String userId, String shippingMethod, Map<String, dynamic> shippingAddress, String? promoCode
});




}
/// @nodoc
class __$CalculateCheckoutCopyWithImpl<$Res>
    implements _$CalculateCheckoutCopyWith<$Res> {
  __$CalculateCheckoutCopyWithImpl(this._self, this._then);

  final _CalculateCheckout _self;
  final $Res Function(_CalculateCheckout) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? shippingMethod = null,Object? shippingAddress = null,Object? promoCode = freezed,}) {
  return _then(_CalculateCheckout(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,shippingMethod: null == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _UpdateShippingAddress implements CheckoutEvent {
  const _UpdateShippingAddress({required final  Map<String, dynamic> address}): _address = address;
  

 final  Map<String, dynamic> _address;
 Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateShippingAddressCopyWith<_UpdateShippingAddress> get copyWith => __$UpdateShippingAddressCopyWithImpl<_UpdateShippingAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateShippingAddress&&const DeepCollectionEquality().equals(other._address, _address));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_address));

@override
String toString() {
  return 'CheckoutEvent.updateShippingAddress(address: $address)';
}


}

/// @nodoc
abstract mixin class _$UpdateShippingAddressCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$UpdateShippingAddressCopyWith(_UpdateShippingAddress value, $Res Function(_UpdateShippingAddress) _then) = __$UpdateShippingAddressCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> address
});




}
/// @nodoc
class __$UpdateShippingAddressCopyWithImpl<$Res>
    implements _$UpdateShippingAddressCopyWith<$Res> {
  __$UpdateShippingAddressCopyWithImpl(this._self, this._then);

  final _UpdateShippingAddress _self;
  final $Res Function(_UpdateShippingAddress) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_UpdateShippingAddress(
address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _UpdateBillingAddress implements CheckoutEvent {
  const _UpdateBillingAddress({required final  Map<String, dynamic> address}): _address = address;
  

 final  Map<String, dynamic> _address;
 Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBillingAddressCopyWith<_UpdateBillingAddress> get copyWith => __$UpdateBillingAddressCopyWithImpl<_UpdateBillingAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBillingAddress&&const DeepCollectionEquality().equals(other._address, _address));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_address));

@override
String toString() {
  return 'CheckoutEvent.updateBillingAddress(address: $address)';
}


}

/// @nodoc
abstract mixin class _$UpdateBillingAddressCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$UpdateBillingAddressCopyWith(_UpdateBillingAddress value, $Res Function(_UpdateBillingAddress) _then) = __$UpdateBillingAddressCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> address
});




}
/// @nodoc
class __$UpdateBillingAddressCopyWithImpl<$Res>
    implements _$UpdateBillingAddressCopyWith<$Res> {
  __$UpdateBillingAddressCopyWithImpl(this._self, this._then);

  final _UpdateBillingAddress _self;
  final $Res Function(_UpdateBillingAddress) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_UpdateBillingAddress(
address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _UpdatePaymentMethod implements CheckoutEvent {
  const _UpdatePaymentMethod({required this.paymentMethod});
  

 final  String paymentMethod;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePaymentMethodCopyWith<_UpdatePaymentMethod> get copyWith => __$UpdatePaymentMethodCopyWithImpl<_UpdatePaymentMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePaymentMethod&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode => Object.hash(runtimeType,paymentMethod);

@override
String toString() {
  return 'CheckoutEvent.updatePaymentMethod(paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$UpdatePaymentMethodCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$UpdatePaymentMethodCopyWith(_UpdatePaymentMethod value, $Res Function(_UpdatePaymentMethod) _then) = __$UpdatePaymentMethodCopyWithImpl;
@useResult
$Res call({
 String paymentMethod
});




}
/// @nodoc
class __$UpdatePaymentMethodCopyWithImpl<$Res>
    implements _$UpdatePaymentMethodCopyWith<$Res> {
  __$UpdatePaymentMethodCopyWithImpl(this._self, this._then);

  final _UpdatePaymentMethod _self;
  final $Res Function(_UpdatePaymentMethod) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,}) {
  return _then(_UpdatePaymentMethod(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateShippingMethod implements CheckoutEvent {
  const _UpdateShippingMethod({required this.userId, required this.shippingMethod, required final  Map<String, dynamic> shippingAddress, this.promoCode}): _shippingAddress = shippingAddress;
  

 final  String userId;
 final  String shippingMethod;
 final  Map<String, dynamic> _shippingAddress;
 Map<String, dynamic> get shippingAddress {
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shippingAddress);
}

 final  String? promoCode;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateShippingMethodCopyWith<_UpdateShippingMethod> get copyWith => __$UpdateShippingMethodCopyWithImpl<_UpdateShippingMethod>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateShippingMethod&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode));
}


@override
int get hashCode => Object.hash(runtimeType,userId,shippingMethod,const DeepCollectionEquality().hash(_shippingAddress),promoCode);

@override
String toString() {
  return 'CheckoutEvent.updateShippingMethod(userId: $userId, shippingMethod: $shippingMethod, shippingAddress: $shippingAddress, promoCode: $promoCode)';
}


}

/// @nodoc
abstract mixin class _$UpdateShippingMethodCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$UpdateShippingMethodCopyWith(_UpdateShippingMethod value, $Res Function(_UpdateShippingMethod) _then) = __$UpdateShippingMethodCopyWithImpl;
@useResult
$Res call({
 String userId, String shippingMethod, Map<String, dynamic> shippingAddress, String? promoCode
});




}
/// @nodoc
class __$UpdateShippingMethodCopyWithImpl<$Res>
    implements _$UpdateShippingMethodCopyWith<$Res> {
  __$UpdateShippingMethodCopyWithImpl(this._self, this._then);

  final _UpdateShippingMethod _self;
  final $Res Function(_UpdateShippingMethod) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? shippingMethod = null,Object? shippingAddress = null,Object? promoCode = freezed,}) {
  return _then(_UpdateShippingMethod(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,shippingMethod: null == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _ApplyPromoCode implements CheckoutEvent {
  const _ApplyPromoCode({required this.userId, required this.promoCode, required this.subtotal, required this.shippingMethod, required final  Map<String, dynamic> shippingAddress}): _shippingAddress = shippingAddress;
  

 final  String userId;
 final  String promoCode;
 final  double subtotal;
 final  String shippingMethod;
 final  Map<String, dynamic> _shippingAddress;
 Map<String, dynamic> get shippingAddress {
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shippingAddress);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyPromoCodeCopyWith<_ApplyPromoCode> get copyWith => __$ApplyPromoCodeCopyWithImpl<_ApplyPromoCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyPromoCode&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress));
}


@override
int get hashCode => Object.hash(runtimeType,userId,promoCode,subtotal,shippingMethod,const DeepCollectionEquality().hash(_shippingAddress));

@override
String toString() {
  return 'CheckoutEvent.applyPromoCode(userId: $userId, promoCode: $promoCode, subtotal: $subtotal, shippingMethod: $shippingMethod, shippingAddress: $shippingAddress)';
}


}

/// @nodoc
abstract mixin class _$ApplyPromoCodeCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$ApplyPromoCodeCopyWith(_ApplyPromoCode value, $Res Function(_ApplyPromoCode) _then) = __$ApplyPromoCodeCopyWithImpl;
@useResult
$Res call({
 String userId, String promoCode, double subtotal, String shippingMethod, Map<String, dynamic> shippingAddress
});




}
/// @nodoc
class __$ApplyPromoCodeCopyWithImpl<$Res>
    implements _$ApplyPromoCodeCopyWith<$Res> {
  __$ApplyPromoCodeCopyWithImpl(this._self, this._then);

  final _ApplyPromoCode _self;
  final $Res Function(_ApplyPromoCode) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? promoCode = null,Object? subtotal = null,Object? shippingMethod = null,Object? shippingAddress = null,}) {
  return _then(_ApplyPromoCode(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,promoCode: null == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,shippingMethod: null == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _RemovePromoCode implements CheckoutEvent {
  const _RemovePromoCode({required this.userId, required this.shippingMethod, required final  Map<String, dynamic> shippingAddress}): _shippingAddress = shippingAddress;
  

 final  String userId;
 final  String shippingMethod;
 final  Map<String, dynamic> _shippingAddress;
 Map<String, dynamic> get shippingAddress {
  if (_shippingAddress is EqualUnmodifiableMapView) return _shippingAddress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shippingAddress);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemovePromoCodeCopyWith<_RemovePromoCode> get copyWith => __$RemovePromoCodeCopyWithImpl<_RemovePromoCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovePromoCode&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.shippingMethod, shippingMethod) || other.shippingMethod == shippingMethod)&&const DeepCollectionEquality().equals(other._shippingAddress, _shippingAddress));
}


@override
int get hashCode => Object.hash(runtimeType,userId,shippingMethod,const DeepCollectionEquality().hash(_shippingAddress));

@override
String toString() {
  return 'CheckoutEvent.removePromoCode(userId: $userId, shippingMethod: $shippingMethod, shippingAddress: $shippingAddress)';
}


}

/// @nodoc
abstract mixin class _$RemovePromoCodeCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$RemovePromoCodeCopyWith(_RemovePromoCode value, $Res Function(_RemovePromoCode) _then) = __$RemovePromoCodeCopyWithImpl;
@useResult
$Res call({
 String userId, String shippingMethod, Map<String, dynamic> shippingAddress
});




}
/// @nodoc
class __$RemovePromoCodeCopyWithImpl<$Res>
    implements _$RemovePromoCodeCopyWith<$Res> {
  __$RemovePromoCodeCopyWithImpl(this._self, this._then);

  final _RemovePromoCode _self;
  final $Res Function(_RemovePromoCode) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? shippingMethod = null,Object? shippingAddress = null,}) {
  return _then(_RemovePromoCode(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,shippingMethod: null == shippingMethod ? _self.shippingMethod : shippingMethod // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self._shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ValidateAddress implements CheckoutEvent {
  const _ValidateAddress({required final  Map<String, dynamic> address}): _address = address;
  

 final  Map<String, dynamic> _address;
 Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidateAddressCopyWith<_ValidateAddress> get copyWith => __$ValidateAddressCopyWithImpl<_ValidateAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidateAddress&&const DeepCollectionEquality().equals(other._address, _address));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_address));

@override
String toString() {
  return 'CheckoutEvent.validateAddress(address: $address)';
}


}

/// @nodoc
abstract mixin class _$ValidateAddressCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$ValidateAddressCopyWith(_ValidateAddress value, $Res Function(_ValidateAddress) _then) = __$ValidateAddressCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> address
});




}
/// @nodoc
class __$ValidateAddressCopyWithImpl<$Res>
    implements _$ValidateAddressCopyWith<$Res> {
  __$ValidateAddressCopyWithImpl(this._self, this._then);

  final _ValidateAddress _self;
  final $Res Function(_ValidateAddress) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_ValidateAddress(
address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _GetShippingMethods implements CheckoutEvent {
  const _GetShippingMethods({required final  Map<String, dynamic> address, required this.weight}): _address = address;
  

 final  Map<String, dynamic> _address;
 Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}

 final  double weight;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetShippingMethodsCopyWith<_GetShippingMethods> get copyWith => __$GetShippingMethodsCopyWithImpl<_GetShippingMethods>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetShippingMethods&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.weight, weight) || other.weight == weight));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_address),weight);

@override
String toString() {
  return 'CheckoutEvent.getShippingMethods(address: $address, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$GetShippingMethodsCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$GetShippingMethodsCopyWith(_GetShippingMethods value, $Res Function(_GetShippingMethods) _then) = __$GetShippingMethodsCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> address, double weight
});




}
/// @nodoc
class __$GetShippingMethodsCopyWithImpl<$Res>
    implements _$GetShippingMethodsCopyWith<$Res> {
  __$GetShippingMethodsCopyWithImpl(this._self, this._then);

  final _GetShippingMethods _self;
  final $Res Function(_GetShippingMethods) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,Object? weight = null,}) {
  return _then(_GetShippingMethods(
address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _ProcessPayment implements CheckoutEvent {
  const _ProcessPayment({required this.paymentMethod, required this.amount, required final  Map<String, dynamic> paymentDetails}): _paymentDetails = paymentDetails;
  

 final  String paymentMethod;
 final  double amount;
 final  Map<String, dynamic> _paymentDetails;
 Map<String, dynamic> get paymentDetails {
  if (_paymentDetails is EqualUnmodifiableMapView) return _paymentDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentDetails);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessPaymentCopyWith<_ProcessPayment> get copyWith => __$ProcessPaymentCopyWithImpl<_ProcessPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessPayment&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other._paymentDetails, _paymentDetails));
}


@override
int get hashCode => Object.hash(runtimeType,paymentMethod,amount,const DeepCollectionEquality().hash(_paymentDetails));

@override
String toString() {
  return 'CheckoutEvent.processPayment(paymentMethod: $paymentMethod, amount: $amount, paymentDetails: $paymentDetails)';
}


}

/// @nodoc
abstract mixin class _$ProcessPaymentCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$ProcessPaymentCopyWith(_ProcessPayment value, $Res Function(_ProcessPayment) _then) = __$ProcessPaymentCopyWithImpl;
@useResult
$Res call({
 String paymentMethod, double amount, Map<String, dynamic> paymentDetails
});




}
/// @nodoc
class __$ProcessPaymentCopyWithImpl<$Res>
    implements _$ProcessPaymentCopyWith<$Res> {
  __$ProcessPaymentCopyWithImpl(this._self, this._then);

  final _ProcessPayment _self;
  final $Res Function(_ProcessPayment) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,Object? amount = null,Object? paymentDetails = null,}) {
  return _then(_ProcessPayment(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,paymentDetails: null == paymentDetails ? _self._paymentDetails : paymentDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _CompleteCheckout implements CheckoutEvent {
  const _CompleteCheckout({required this.checkout, required final  Map<String, dynamic> paymentResult}): _paymentResult = paymentResult;
  

 final  Checkout checkout;
 final  Map<String, dynamic> _paymentResult;
 Map<String, dynamic> get paymentResult {
  if (_paymentResult is EqualUnmodifiableMapView) return _paymentResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentResult);
}


/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompleteCheckoutCopyWith<_CompleteCheckout> get copyWith => __$CompleteCheckoutCopyWithImpl<_CompleteCheckout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompleteCheckout&&(identical(other.checkout, checkout) || other.checkout == checkout)&&const DeepCollectionEquality().equals(other._paymentResult, _paymentResult));
}


@override
int get hashCode => Object.hash(runtimeType,checkout,const DeepCollectionEquality().hash(_paymentResult));

@override
String toString() {
  return 'CheckoutEvent.completeCheckout(checkout: $checkout, paymentResult: $paymentResult)';
}


}

/// @nodoc
abstract mixin class _$CompleteCheckoutCopyWith<$Res> implements $CheckoutEventCopyWith<$Res> {
  factory _$CompleteCheckoutCopyWith(_CompleteCheckout value, $Res Function(_CompleteCheckout) _then) = __$CompleteCheckoutCopyWithImpl;
@useResult
$Res call({
 Checkout checkout, Map<String, dynamic> paymentResult
});




}
/// @nodoc
class __$CompleteCheckoutCopyWithImpl<$Res>
    implements _$CompleteCheckoutCopyWith<$Res> {
  __$CompleteCheckoutCopyWithImpl(this._self, this._then);

  final _CompleteCheckout _self;
  final $Res Function(_CompleteCheckout) _then;

/// Create a copy of CheckoutEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,Object? paymentResult = null,}) {
  return _then(_CompleteCheckout(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,paymentResult: null == paymentResult ? _self._paymentResult : paymentResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _ResetCheckout implements CheckoutEvent {
  const _ResetCheckout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetCheckout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutEvent.resetCheckout()';
}


}




// dart format on
