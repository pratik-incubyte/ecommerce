import 'package:equatable/equatable.dart';

/// Address entity representing shipping or billing address
class Address extends Equatable {
  final String firstName;
  final String lastName;
  final String addressLine1;
  final String? addressLine2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final String? phoneNumber;
  final String? email;
  final bool isDefault;

  const Address({
    required this.firstName,
    required this.lastName,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.phoneNumber,
    this.email,
    this.isDefault = false,
  });

  /// Get full name
  String get fullName => '$firstName $lastName';

  /// Get formatted address string
  String get formattedAddress {
    final buffer = StringBuffer();
    buffer.write(addressLine1);
    if (addressLine2 != null && addressLine2!.isNotEmpty) {
      buffer.write(', $addressLine2');
    }
    buffer.write(', $city, $state $postalCode');
    buffer.write(', $country');
    return buffer.toString();
  }

  /// Convert to map for JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'phoneNumber': phoneNumber,
      'email': email,
      'isDefault': isDefault,
    };
  }

  /// Create from map
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      addressLine1: map['addressLine1'] ?? '',
      addressLine2: map['addressLine2'],
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      postalCode: map['postalCode'] ?? '',
      country: map['country'] ?? '',
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      isDefault: map['isDefault'] ?? false,
    );
  }

  /// Copy with method for creating modified instances
  Address copyWith({
    String? firstName,
    String? lastName,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    String? phoneNumber,
    String? email,
    bool? isDefault,
  }) {
    return Address(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    phoneNumber,
    email,
    isDefault,
  ];
}
