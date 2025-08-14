// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String?,
  profilePicture: json['profile_picture'] as String?,
  address: json['address'] as String?,
  city: json['city'] as String?,
  country: json['country'] as String?,
  postalCode: json['postal_code'] as String?,
  isVerified: json['is_verified'] as bool? ?? false,
  isActive: json['is_active'] as bool? ?? true,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
  'profile_picture': instance.profilePicture,
  'address': instance.address,
  'city': instance.city,
  'country': instance.country,
  'postal_code': instance.postalCode,
  'is_verified': instance.isVerified,
  'is_active': instance.isActive,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
