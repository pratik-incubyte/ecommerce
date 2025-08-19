// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Calculating value)?  calculating,TResult Function( _Calculated value)?  calculated,TResult Function( _ShippingMethodsLoaded value)?  shippingMethodsLoaded,TResult Function( _AddressValidated value)?  addressValidated,TResult Function( _PromoCodeApplied value)?  promoCodeApplied,TResult Function( _PromoCodeRemoved value)?  promoCodeRemoved,TResult Function( _ProcessingPayment value)?  processingPayment,TResult Function( _PaymentProcessed value)?  paymentProcessed,TResult Function( _CompletingCheckout value)?  completingCheckout,TResult Function( _CheckoutCompleted value)?  checkoutCompleted,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Calculating() when calculating != null:
return calculating(_that);case _Calculated() when calculated != null:
return calculated(_that);case _ShippingMethodsLoaded() when shippingMethodsLoaded != null:
return shippingMethodsLoaded(_that);case _AddressValidated() when addressValidated != null:
return addressValidated(_that);case _PromoCodeApplied() when promoCodeApplied != null:
return promoCodeApplied(_that);case _PromoCodeRemoved() when promoCodeRemoved != null:
return promoCodeRemoved(_that);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that);case _PaymentProcessed() when paymentProcessed != null:
return paymentProcessed(_that);case _CompletingCheckout() when completingCheckout != null:
return completingCheckout(_that);case _CheckoutCompleted() when checkoutCompleted != null:
return checkoutCompleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Calculating value)  calculating,required TResult Function( _Calculated value)  calculated,required TResult Function( _ShippingMethodsLoaded value)  shippingMethodsLoaded,required TResult Function( _AddressValidated value)  addressValidated,required TResult Function( _PromoCodeApplied value)  promoCodeApplied,required TResult Function( _PromoCodeRemoved value)  promoCodeRemoved,required TResult Function( _ProcessingPayment value)  processingPayment,required TResult Function( _PaymentProcessed value)  paymentProcessed,required TResult Function( _CompletingCheckout value)  completingCheckout,required TResult Function( _CheckoutCompleted value)  checkoutCompleted,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Calculating():
return calculating(_that);case _Calculated():
return calculated(_that);case _ShippingMethodsLoaded():
return shippingMethodsLoaded(_that);case _AddressValidated():
return addressValidated(_that);case _PromoCodeApplied():
return promoCodeApplied(_that);case _PromoCodeRemoved():
return promoCodeRemoved(_that);case _ProcessingPayment():
return processingPayment(_that);case _PaymentProcessed():
return paymentProcessed(_that);case _CompletingCheckout():
return completingCheckout(_that);case _CheckoutCompleted():
return checkoutCompleted(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Calculating value)?  calculating,TResult? Function( _Calculated value)?  calculated,TResult? Function( _ShippingMethodsLoaded value)?  shippingMethodsLoaded,TResult? Function( _AddressValidated value)?  addressValidated,TResult? Function( _PromoCodeApplied value)?  promoCodeApplied,TResult? Function( _PromoCodeRemoved value)?  promoCodeRemoved,TResult? Function( _ProcessingPayment value)?  processingPayment,TResult? Function( _PaymentProcessed value)?  paymentProcessed,TResult? Function( _CompletingCheckout value)?  completingCheckout,TResult? Function( _CheckoutCompleted value)?  checkoutCompleted,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Calculating() when calculating != null:
return calculating(_that);case _Calculated() when calculated != null:
return calculated(_that);case _ShippingMethodsLoaded() when shippingMethodsLoaded != null:
return shippingMethodsLoaded(_that);case _AddressValidated() when addressValidated != null:
return addressValidated(_that);case _PromoCodeApplied() when promoCodeApplied != null:
return promoCodeApplied(_that);case _PromoCodeRemoved() when promoCodeRemoved != null:
return promoCodeRemoved(_that);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that);case _PaymentProcessed() when paymentProcessed != null:
return paymentProcessed(_that);case _CompletingCheckout() when completingCheckout != null:
return completingCheckout(_that);case _CheckoutCompleted() when checkoutCompleted != null:
return checkoutCompleted(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  calculating,TResult Function( Checkout checkout,  List<Map<String, dynamic>>? availableShippingMethods)?  calculated,TResult Function( List<Map<String, dynamic>> shippingMethods,  Checkout? checkout)?  shippingMethodsLoaded,TResult Function( bool isValid,  Map<String, dynamic> address,  Checkout? checkout)?  addressValidated,TResult Function( Map<String, dynamic> promoResult,  Checkout checkout)?  promoCodeApplied,TResult Function( Checkout checkout)?  promoCodeRemoved,TResult Function( Checkout checkout)?  processingPayment,TResult Function( Map<String, dynamic> paymentResult,  Checkout checkout)?  paymentProcessed,TResult Function( Checkout checkout,  Map<String, dynamic> paymentResult)?  completingCheckout,TResult Function( Order order)?  checkoutCompleted,TResult Function( String message,  Checkout? checkout)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Calculating() when calculating != null:
return calculating();case _Calculated() when calculated != null:
return calculated(_that.checkout,_that.availableShippingMethods);case _ShippingMethodsLoaded() when shippingMethodsLoaded != null:
return shippingMethodsLoaded(_that.shippingMethods,_that.checkout);case _AddressValidated() when addressValidated != null:
return addressValidated(_that.isValid,_that.address,_that.checkout);case _PromoCodeApplied() when promoCodeApplied != null:
return promoCodeApplied(_that.promoResult,_that.checkout);case _PromoCodeRemoved() when promoCodeRemoved != null:
return promoCodeRemoved(_that.checkout);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that.checkout);case _PaymentProcessed() when paymentProcessed != null:
return paymentProcessed(_that.paymentResult,_that.checkout);case _CompletingCheckout() when completingCheckout != null:
return completingCheckout(_that.checkout,_that.paymentResult);case _CheckoutCompleted() when checkoutCompleted != null:
return checkoutCompleted(_that.order);case _Error() when error != null:
return error(_that.message,_that.checkout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  calculating,required TResult Function( Checkout checkout,  List<Map<String, dynamic>>? availableShippingMethods)  calculated,required TResult Function( List<Map<String, dynamic>> shippingMethods,  Checkout? checkout)  shippingMethodsLoaded,required TResult Function( bool isValid,  Map<String, dynamic> address,  Checkout? checkout)  addressValidated,required TResult Function( Map<String, dynamic> promoResult,  Checkout checkout)  promoCodeApplied,required TResult Function( Checkout checkout)  promoCodeRemoved,required TResult Function( Checkout checkout)  processingPayment,required TResult Function( Map<String, dynamic> paymentResult,  Checkout checkout)  paymentProcessed,required TResult Function( Checkout checkout,  Map<String, dynamic> paymentResult)  completingCheckout,required TResult Function( Order order)  checkoutCompleted,required TResult Function( String message,  Checkout? checkout)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Calculating():
return calculating();case _Calculated():
return calculated(_that.checkout,_that.availableShippingMethods);case _ShippingMethodsLoaded():
return shippingMethodsLoaded(_that.shippingMethods,_that.checkout);case _AddressValidated():
return addressValidated(_that.isValid,_that.address,_that.checkout);case _PromoCodeApplied():
return promoCodeApplied(_that.promoResult,_that.checkout);case _PromoCodeRemoved():
return promoCodeRemoved(_that.checkout);case _ProcessingPayment():
return processingPayment(_that.checkout);case _PaymentProcessed():
return paymentProcessed(_that.paymentResult,_that.checkout);case _CompletingCheckout():
return completingCheckout(_that.checkout,_that.paymentResult);case _CheckoutCompleted():
return checkoutCompleted(_that.order);case _Error():
return error(_that.message,_that.checkout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  calculating,TResult? Function( Checkout checkout,  List<Map<String, dynamic>>? availableShippingMethods)?  calculated,TResult? Function( List<Map<String, dynamic>> shippingMethods,  Checkout? checkout)?  shippingMethodsLoaded,TResult? Function( bool isValid,  Map<String, dynamic> address,  Checkout? checkout)?  addressValidated,TResult? Function( Map<String, dynamic> promoResult,  Checkout checkout)?  promoCodeApplied,TResult? Function( Checkout checkout)?  promoCodeRemoved,TResult? Function( Checkout checkout)?  processingPayment,TResult? Function( Map<String, dynamic> paymentResult,  Checkout checkout)?  paymentProcessed,TResult? Function( Checkout checkout,  Map<String, dynamic> paymentResult)?  completingCheckout,TResult? Function( Order order)?  checkoutCompleted,TResult? Function( String message,  Checkout? checkout)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Calculating() when calculating != null:
return calculating();case _Calculated() when calculated != null:
return calculated(_that.checkout,_that.availableShippingMethods);case _ShippingMethodsLoaded() when shippingMethodsLoaded != null:
return shippingMethodsLoaded(_that.shippingMethods,_that.checkout);case _AddressValidated() when addressValidated != null:
return addressValidated(_that.isValid,_that.address,_that.checkout);case _PromoCodeApplied() when promoCodeApplied != null:
return promoCodeApplied(_that.promoResult,_that.checkout);case _PromoCodeRemoved() when promoCodeRemoved != null:
return promoCodeRemoved(_that.checkout);case _ProcessingPayment() when processingPayment != null:
return processingPayment(_that.checkout);case _PaymentProcessed() when paymentProcessed != null:
return paymentProcessed(_that.paymentResult,_that.checkout);case _CompletingCheckout() when completingCheckout != null:
return completingCheckout(_that.checkout,_that.paymentResult);case _CheckoutCompleted() when checkoutCompleted != null:
return checkoutCompleted(_that.order);case _Error() when error != null:
return error(_that.message,_that.checkout);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckoutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.initial()';
}


}




/// @nodoc


class _Calculating implements CheckoutState {
  const _Calculating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calculating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckoutState.calculating()';
}


}




/// @nodoc


class _Calculated implements CheckoutState {
  const _Calculated({required this.checkout, final  List<Map<String, dynamic>>? availableShippingMethods}): _availableShippingMethods = availableShippingMethods;
  

 final  Checkout checkout;
 final  List<Map<String, dynamic>>? _availableShippingMethods;
 List<Map<String, dynamic>>? get availableShippingMethods {
  final value = _availableShippingMethods;
  if (value == null) return null;
  if (_availableShippingMethods is EqualUnmodifiableListView) return _availableShippingMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalculatedCopyWith<_Calculated> get copyWith => __$CalculatedCopyWithImpl<_Calculated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Calculated&&(identical(other.checkout, checkout) || other.checkout == checkout)&&const DeepCollectionEquality().equals(other._availableShippingMethods, _availableShippingMethods));
}


@override
int get hashCode => Object.hash(runtimeType,checkout,const DeepCollectionEquality().hash(_availableShippingMethods));

@override
String toString() {
  return 'CheckoutState.calculated(checkout: $checkout, availableShippingMethods: $availableShippingMethods)';
}


}

/// @nodoc
abstract mixin class _$CalculatedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CalculatedCopyWith(_Calculated value, $Res Function(_Calculated) _then) = __$CalculatedCopyWithImpl;
@useResult
$Res call({
 Checkout checkout, List<Map<String, dynamic>>? availableShippingMethods
});




}
/// @nodoc
class __$CalculatedCopyWithImpl<$Res>
    implements _$CalculatedCopyWith<$Res> {
  __$CalculatedCopyWithImpl(this._self, this._then);

  final _Calculated _self;
  final $Res Function(_Calculated) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,Object? availableShippingMethods = freezed,}) {
  return _then(_Calculated(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,availableShippingMethods: freezed == availableShippingMethods ? _self._availableShippingMethods : availableShippingMethods // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,
  ));
}


}

/// @nodoc


class _ShippingMethodsLoaded implements CheckoutState {
  const _ShippingMethodsLoaded({required final  List<Map<String, dynamic>> shippingMethods, this.checkout}): _shippingMethods = shippingMethods;
  

 final  List<Map<String, dynamic>> _shippingMethods;
 List<Map<String, dynamic>> get shippingMethods {
  if (_shippingMethods is EqualUnmodifiableListView) return _shippingMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shippingMethods);
}

 final  Checkout? checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingMethodsLoadedCopyWith<_ShippingMethodsLoaded> get copyWith => __$ShippingMethodsLoadedCopyWithImpl<_ShippingMethodsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingMethodsLoaded&&const DeepCollectionEquality().equals(other._shippingMethods, _shippingMethods)&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_shippingMethods),checkout);

@override
String toString() {
  return 'CheckoutState.shippingMethodsLoaded(shippingMethods: $shippingMethods, checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$ShippingMethodsLoadedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$ShippingMethodsLoadedCopyWith(_ShippingMethodsLoaded value, $Res Function(_ShippingMethodsLoaded) _then) = __$ShippingMethodsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Map<String, dynamic>> shippingMethods, Checkout? checkout
});




}
/// @nodoc
class __$ShippingMethodsLoadedCopyWithImpl<$Res>
    implements _$ShippingMethodsLoadedCopyWith<$Res> {
  __$ShippingMethodsLoadedCopyWithImpl(this._self, this._then);

  final _ShippingMethodsLoaded _self;
  final $Res Function(_ShippingMethodsLoaded) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shippingMethods = null,Object? checkout = freezed,}) {
  return _then(_ShippingMethodsLoaded(
shippingMethods: null == shippingMethods ? _self._shippingMethods : shippingMethods // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,checkout: freezed == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout?,
  ));
}


}

/// @nodoc


class _AddressValidated implements CheckoutState {
  const _AddressValidated({required this.isValid, required final  Map<String, dynamic> address, this.checkout}): _address = address;
  

 final  bool isValid;
 final  Map<String, dynamic> _address;
 Map<String, dynamic> get address {
  if (_address is EqualUnmodifiableMapView) return _address;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_address);
}

 final  Checkout? checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressValidatedCopyWith<_AddressValidated> get copyWith => __$AddressValidatedCopyWithImpl<_AddressValidated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressValidated&&(identical(other.isValid, isValid) || other.isValid == isValid)&&const DeepCollectionEquality().equals(other._address, _address)&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,isValid,const DeepCollectionEquality().hash(_address),checkout);

@override
String toString() {
  return 'CheckoutState.addressValidated(isValid: $isValid, address: $address, checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$AddressValidatedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$AddressValidatedCopyWith(_AddressValidated value, $Res Function(_AddressValidated) _then) = __$AddressValidatedCopyWithImpl;
@useResult
$Res call({
 bool isValid, Map<String, dynamic> address, Checkout? checkout
});




}
/// @nodoc
class __$AddressValidatedCopyWithImpl<$Res>
    implements _$AddressValidatedCopyWith<$Res> {
  __$AddressValidatedCopyWithImpl(this._self, this._then);

  final _AddressValidated _self;
  final $Res Function(_AddressValidated) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isValid = null,Object? address = null,Object? checkout = freezed,}) {
  return _then(_AddressValidated(
isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self._address : address // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,checkout: freezed == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout?,
  ));
}


}

/// @nodoc


class _PromoCodeApplied implements CheckoutState {
  const _PromoCodeApplied({required final  Map<String, dynamic> promoResult, required this.checkout}): _promoResult = promoResult;
  

 final  Map<String, dynamic> _promoResult;
 Map<String, dynamic> get promoResult {
  if (_promoResult is EqualUnmodifiableMapView) return _promoResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_promoResult);
}

 final  Checkout checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoCodeAppliedCopyWith<_PromoCodeApplied> get copyWith => __$PromoCodeAppliedCopyWithImpl<_PromoCodeApplied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoCodeApplied&&const DeepCollectionEquality().equals(other._promoResult, _promoResult)&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_promoResult),checkout);

@override
String toString() {
  return 'CheckoutState.promoCodeApplied(promoResult: $promoResult, checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$PromoCodeAppliedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$PromoCodeAppliedCopyWith(_PromoCodeApplied value, $Res Function(_PromoCodeApplied) _then) = __$PromoCodeAppliedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> promoResult, Checkout checkout
});




}
/// @nodoc
class __$PromoCodeAppliedCopyWithImpl<$Res>
    implements _$PromoCodeAppliedCopyWith<$Res> {
  __$PromoCodeAppliedCopyWithImpl(this._self, this._then);

  final _PromoCodeApplied _self;
  final $Res Function(_PromoCodeApplied) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? promoResult = null,Object? checkout = null,}) {
  return _then(_PromoCodeApplied(
promoResult: null == promoResult ? _self._promoResult : promoResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,
  ));
}


}

/// @nodoc


class _PromoCodeRemoved implements CheckoutState {
  const _PromoCodeRemoved({required this.checkout});
  

 final  Checkout checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoCodeRemovedCopyWith<_PromoCodeRemoved> get copyWith => __$PromoCodeRemovedCopyWithImpl<_PromoCodeRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoCodeRemoved&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,checkout);

@override
String toString() {
  return 'CheckoutState.promoCodeRemoved(checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$PromoCodeRemovedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$PromoCodeRemovedCopyWith(_PromoCodeRemoved value, $Res Function(_PromoCodeRemoved) _then) = __$PromoCodeRemovedCopyWithImpl;
@useResult
$Res call({
 Checkout checkout
});




}
/// @nodoc
class __$PromoCodeRemovedCopyWithImpl<$Res>
    implements _$PromoCodeRemovedCopyWith<$Res> {
  __$PromoCodeRemovedCopyWithImpl(this._self, this._then);

  final _PromoCodeRemoved _self;
  final $Res Function(_PromoCodeRemoved) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,}) {
  return _then(_PromoCodeRemoved(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,
  ));
}


}

/// @nodoc


class _ProcessingPayment implements CheckoutState {
  const _ProcessingPayment({required this.checkout});
  

 final  Checkout checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingPaymentCopyWith<_ProcessingPayment> get copyWith => __$ProcessingPaymentCopyWithImpl<_ProcessingPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessingPayment&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,checkout);

@override
String toString() {
  return 'CheckoutState.processingPayment(checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$ProcessingPaymentCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$ProcessingPaymentCopyWith(_ProcessingPayment value, $Res Function(_ProcessingPayment) _then) = __$ProcessingPaymentCopyWithImpl;
@useResult
$Res call({
 Checkout checkout
});




}
/// @nodoc
class __$ProcessingPaymentCopyWithImpl<$Res>
    implements _$ProcessingPaymentCopyWith<$Res> {
  __$ProcessingPaymentCopyWithImpl(this._self, this._then);

  final _ProcessingPayment _self;
  final $Res Function(_ProcessingPayment) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,}) {
  return _then(_ProcessingPayment(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,
  ));
}


}

/// @nodoc


class _PaymentProcessed implements CheckoutState {
  const _PaymentProcessed({required final  Map<String, dynamic> paymentResult, required this.checkout}): _paymentResult = paymentResult;
  

 final  Map<String, dynamic> _paymentResult;
 Map<String, dynamic> get paymentResult {
  if (_paymentResult is EqualUnmodifiableMapView) return _paymentResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentResult);
}

 final  Checkout checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentProcessedCopyWith<_PaymentProcessed> get copyWith => __$PaymentProcessedCopyWithImpl<_PaymentProcessed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentProcessed&&const DeepCollectionEquality().equals(other._paymentResult, _paymentResult)&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_paymentResult),checkout);

@override
String toString() {
  return 'CheckoutState.paymentProcessed(paymentResult: $paymentResult, checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$PaymentProcessedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$PaymentProcessedCopyWith(_PaymentProcessed value, $Res Function(_PaymentProcessed) _then) = __$PaymentProcessedCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> paymentResult, Checkout checkout
});




}
/// @nodoc
class __$PaymentProcessedCopyWithImpl<$Res>
    implements _$PaymentProcessedCopyWith<$Res> {
  __$PaymentProcessedCopyWithImpl(this._self, this._then);

  final _PaymentProcessed _self;
  final $Res Function(_PaymentProcessed) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentResult = null,Object? checkout = null,}) {
  return _then(_PaymentProcessed(
paymentResult: null == paymentResult ? _self._paymentResult : paymentResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,
  ));
}


}

/// @nodoc


class _CompletingCheckout implements CheckoutState {
  const _CompletingCheckout({required this.checkout, required final  Map<String, dynamic> paymentResult}): _paymentResult = paymentResult;
  

 final  Checkout checkout;
 final  Map<String, dynamic> _paymentResult;
 Map<String, dynamic> get paymentResult {
  if (_paymentResult is EqualUnmodifiableMapView) return _paymentResult;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_paymentResult);
}


/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletingCheckoutCopyWith<_CompletingCheckout> get copyWith => __$CompletingCheckoutCopyWithImpl<_CompletingCheckout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletingCheckout&&(identical(other.checkout, checkout) || other.checkout == checkout)&&const DeepCollectionEquality().equals(other._paymentResult, _paymentResult));
}


@override
int get hashCode => Object.hash(runtimeType,checkout,const DeepCollectionEquality().hash(_paymentResult));

@override
String toString() {
  return 'CheckoutState.completingCheckout(checkout: $checkout, paymentResult: $paymentResult)';
}


}

/// @nodoc
abstract mixin class _$CompletingCheckoutCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CompletingCheckoutCopyWith(_CompletingCheckout value, $Res Function(_CompletingCheckout) _then) = __$CompletingCheckoutCopyWithImpl;
@useResult
$Res call({
 Checkout checkout, Map<String, dynamic> paymentResult
});




}
/// @nodoc
class __$CompletingCheckoutCopyWithImpl<$Res>
    implements _$CompletingCheckoutCopyWith<$Res> {
  __$CompletingCheckoutCopyWithImpl(this._self, this._then);

  final _CompletingCheckout _self;
  final $Res Function(_CompletingCheckout) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,Object? paymentResult = null,}) {
  return _then(_CompletingCheckout(
checkout: null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout,paymentResult: null == paymentResult ? _self._paymentResult : paymentResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class _CheckoutCompleted implements CheckoutState {
  const _CheckoutCompleted({required this.order});
  

 final  Order order;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutCompletedCopyWith<_CheckoutCompleted> get copyWith => __$CheckoutCompletedCopyWithImpl<_CheckoutCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutCompleted&&(identical(other.order, order) || other.order == order));
}


@override
int get hashCode => Object.hash(runtimeType,order);

@override
String toString() {
  return 'CheckoutState.checkoutCompleted(order: $order)';
}


}

/// @nodoc
abstract mixin class _$CheckoutCompletedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutCompletedCopyWith(_CheckoutCompleted value, $Res Function(_CheckoutCompleted) _then) = __$CheckoutCompletedCopyWithImpl;
@useResult
$Res call({
 Order order
});




}
/// @nodoc
class __$CheckoutCompletedCopyWithImpl<$Res>
    implements _$CheckoutCompletedCopyWith<$Res> {
  __$CheckoutCompletedCopyWithImpl(this._self, this._then);

  final _CheckoutCompleted _self;
  final $Res Function(_CheckoutCompleted) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? order = null,}) {
  return _then(_CheckoutCompleted(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,
  ));
}


}

/// @nodoc


class _Error implements CheckoutState {
  const _Error({required this.message, this.checkout});
  

 final  String message;
 final  Checkout? checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode => Object.hash(runtimeType,message,checkout);

@override
String toString() {
  return 'CheckoutState.error(message: $message, checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, Checkout? checkout
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? checkout = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,checkout: freezed == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as Checkout?,
  ));
}


}

// dart format on
