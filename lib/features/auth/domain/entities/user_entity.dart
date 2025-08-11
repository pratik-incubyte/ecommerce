import 'package:equatable/equatable.dart';

/// User entity representing the domain model
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String? phone;
  final String? profilePicture;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final bool isVerified;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  const UserEntity({
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
  
  String get fullName => '$firstName $lastName';
  
  UserEntity copyWith({
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
    return UserEntity(
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
  
  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    phone,
    profilePicture,
    address,
    city,
    country,
    postalCode,
    isVerified,
    isActive,
    createdAt,
    updatedAt,
  ];
}
