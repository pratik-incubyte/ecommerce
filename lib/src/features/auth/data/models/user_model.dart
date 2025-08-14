import 'package:json_annotation/json_annotation.dart';
import 'package:ecommerce/src/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String? phone;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  final String? address;
  final String? city;
  final String? country;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.profilePicture,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.isVerified = false,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert to JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Convert from domain entity
  factory UserModel.fromDomain(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      profilePicture: entity.profilePicture,
      address: entity.address,
      city: entity.city,
      country: entity.country,
      postalCode: entity.postalCode,
      isVerified: entity.isVerified,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Convert to domain entity
  UserEntity toDomain() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      profilePicture: profilePicture,
      address: address,
      city: city,
      country: country,
      postalCode: postalCode,
      isVerified: isVerified,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Create a copy with different values
  UserModel copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? phone,
    String? profilePicture,
    String? address,
    String? city,
    String? country,
    String? postalCode,
    bool? isVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
