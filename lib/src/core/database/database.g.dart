// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _profilePictureMeta = const VerificationMeta(
    'profilePicture',
  );
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
    'profile_picture',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _postalCodeMeta = const VerificationMeta(
    'postalCode',
  );
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
    'postal_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isVerifiedMeta = const VerificationMeta(
    'isVerified',
  );
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
    'is_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    serverId,
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
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
        _profilePictureMeta,
        profilePicture.isAcceptableOrUnknown(
          data['profile_picture']!,
          _profilePictureMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('postal_code')) {
      context.handle(
        _postalCodeMeta,
        postalCode.isAcceptableOrUnknown(data['postal_code']!, _postalCodeMeta),
      );
    }
    if (data.containsKey('is_verified')) {
      context.handle(
        _isVerifiedMeta,
        isVerified.isAcceptableOrUnknown(data['is_verified']!, _isVerifiedMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      profilePicture: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_picture'],
      ),
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      postalCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}postal_code'],
      ),
      isVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_verified'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  /// Primary key - user ID
  final int id;

  /// User's unique identifier from the server
  final String? serverId;

  /// User's email address
  final String email;

  /// User's first name
  final String firstName;

  /// User's last name
  final String lastName;

  /// User's phone number
  final String? phone;

  /// User's profile picture URL
  final String? profilePicture;

  /// User's address
  final String? address;

  /// User's city
  final String? city;

  /// User's country
  final String? country;

  /// User's postal code
  final String? postalCode;

  /// Whether user is verified
  final bool isVerified;

  /// Whether user account is active
  final bool isActive;

  /// When the user was created
  final DateTime createdAt;

  /// When the user was last updated
  final DateTime updatedAt;
  const UserTableData({
    required this.id,
    this.serverId,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.phone,
    this.profilePicture,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    required this.isVerified,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['email'] = Variable<String>(email);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || profilePicture != null) {
      map['profile_picture'] = Variable<String>(profilePicture);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    map['is_verified'] = Variable<bool>(isVerified);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      email: Value(email),
      firstName: Value(firstName),
      lastName: Value(lastName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      isVerified: Value(isVerified),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      email: serializer.fromJson<String>(json['email']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      phone: serializer.fromJson<String?>(json['phone']),
      profilePicture: serializer.fromJson<String?>(json['profilePicture']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String?>(json['country']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'serverId': serializer.toJson<String?>(serverId),
      'email': serializer.toJson<String>(email),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'phone': serializer.toJson<String?>(phone),
      'profilePicture': serializer.toJson<String?>(profilePicture),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String?>(country),
      'postalCode': serializer.toJson<String?>(postalCode),
      'isVerified': serializer.toJson<bool>(isVerified),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserTableData copyWith({
    int? id,
    Value<String?> serverId = const Value.absent(),
    String? email,
    String? firstName,
    String? lastName,
    Value<String?> phone = const Value.absent(),
    Value<String?> profilePicture = const Value.absent(),
    Value<String?> address = const Value.absent(),
    Value<String?> city = const Value.absent(),
    Value<String?> country = const Value.absent(),
    Value<String?> postalCode = const Value.absent(),
    bool? isVerified,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserTableData(
    id: id ?? this.id,
    serverId: serverId.present ? serverId.value : this.serverId,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phone: phone.present ? phone.value : this.phone,
    profilePicture: profilePicture.present
        ? profilePicture.value
        : this.profilePicture,
    address: address.present ? address.value : this.address,
    city: city.present ? city.value : this.city,
    country: country.present ? country.value : this.country,
    postalCode: postalCode.present ? postalCode.value : this.postalCode,
    isVerified: isVerified ?? this.isVerified,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      email: data.email.present ? data.email.value : this.email,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      phone: data.phone.present ? data.phone.value : this.phone,
      profilePicture: data.profilePicture.present
          ? data.profilePicture.value
          : this.profilePicture,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      postalCode: data.postalCode.present
          ? data.postalCode.value
          : this.postalCode,
      isVerified: data.isVerified.present
          ? data.isVerified.value
          : this.isVerified,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('phone: $phone, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('postalCode: $postalCode, ')
          ..write('isVerified: $isVerified, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    serverId,
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.email == this.email &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.phone == this.phone &&
          other.profilePicture == this.profilePicture &&
          other.address == this.address &&
          other.city == this.city &&
          other.country == this.country &&
          other.postalCode == this.postalCode &&
          other.isVerified == this.isVerified &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String?> serverId;
  final Value<String> email;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> phone;
  final Value<String?> profilePicture;
  final Value<String?> address;
  final Value<String?> city;
  final Value<String?> country;
  final Value<String?> postalCode;
  final Value<bool> isVerified;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.phone = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    required String email,
    required String firstName,
    required String lastName,
    this.phone = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : email = Value(email),
       firstName = Value(firstName),
       lastName = Value(lastName);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? serverId,
    Expression<String>? email,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? phone,
    Expression<String>? profilePicture,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? postalCode,
    Expression<bool>? isVerified,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (email != null) 'email': email,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (phone != null) 'phone': phone,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (postalCode != null) 'postal_code': postalCode,
      if (isVerified != null) 'is_verified': isVerified,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? serverId,
    Value<String>? email,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String?>? phone,
    Value<String?>? profilePicture,
    Value<String?>? address,
    Value<String?>? city,
    Value<String?>? country,
    Value<String?>? postalCode,
    Value<bool>? isVerified,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
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
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('phone: $phone, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('postalCode: $postalCode, ')
          ..write('isVerified: $isVerified, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _imagesMeta = const VerificationMeta('images');
  @override
  late final GeneratedColumn<String> images = GeneratedColumn<String>(
    'images',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    price,
    brand,
    sku,
    images,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    }
    if (data.containsKey('images')) {
      context.handle(
        _imagesMeta,
        images.isAcceptableOrUnknown(data['images']!, _imagesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      ),
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      ),
      images: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}images'],
      ),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class ProductTableData extends DataClass
    implements Insertable<ProductTableData> {
  /// Product's unique identifier from the server
  final String? id;

  /// Product name
  final String name;

  /// Product description
  final String? description;

  /// Product price
  final double price;

  /// Product brand
  final String? brand;

  /// Product SKU (Stock Keeping Unit)
  final String? sku;

  /// Product images (JSON array of image URLs)
  final String? images;
  const ProductTableData({
    this.id,
    required this.name,
    this.description,
    required this.price,
    this.brand,
    this.sku,
    this.images,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || brand != null) {
      map['brand'] = Variable<String>(brand);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || images != null) {
      map['images'] = Variable<String>(images);
    }
    return map;
  }

  ProductTableCompanion toCompanion(bool nullToAbsent) {
    return ProductTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      price: Value(price),
      brand: brand == null && nullToAbsent
          ? const Value.absent()
          : Value(brand),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      images: images == null && nullToAbsent
          ? const Value.absent()
          : Value(images),
    );
  }

  factory ProductTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTableData(
      id: serializer.fromJson<String?>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      price: serializer.fromJson<double>(json['price']),
      brand: serializer.fromJson<String?>(json['brand']),
      sku: serializer.fromJson<String?>(json['sku']),
      images: serializer.fromJson<String?>(json['images']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'price': serializer.toJson<double>(price),
      'brand': serializer.toJson<String?>(brand),
      'sku': serializer.toJson<String?>(sku),
      'images': serializer.toJson<String?>(images),
    };
  }

  ProductTableData copyWith({
    Value<String?> id = const Value.absent(),
    String? name,
    Value<String?> description = const Value.absent(),
    double? price,
    Value<String?> brand = const Value.absent(),
    Value<String?> sku = const Value.absent(),
    Value<String?> images = const Value.absent(),
  }) => ProductTableData(
    id: id.present ? id.value : this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    price: price ?? this.price,
    brand: brand.present ? brand.value : this.brand,
    sku: sku.present ? sku.value : this.sku,
    images: images.present ? images.value : this.images,
  );
  ProductTableData copyWithCompanion(ProductTableCompanion data) {
    return ProductTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      price: data.price.present ? data.price.value : this.price,
      brand: data.brand.present ? data.brand.value : this.brand,
      sku: data.sku.present ? data.sku.value : this.sku,
      images: data.images.present ? data.images.value : this.images,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('images: $images')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, price, brand, sku, images);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.brand == this.brand &&
          other.sku == this.sku &&
          other.images == this.images);
}

class ProductTableCompanion extends UpdateCompanion<ProductTableData> {
  final Value<String?> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> price;
  final Value<String?> brand;
  final Value<String?> sku;
  final Value<String?> images;
  final Value<int> rowid;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.images = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required double price,
    this.brand = const Value.absent(),
    this.sku = const Value.absent(),
    this.images = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       price = Value(price);
  static Insertable<ProductTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? price,
    Expression<String>? brand,
    Expression<String>? sku,
    Expression<String>? images,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (brand != null) 'brand': brand,
      if (sku != null) 'sku': sku,
      if (images != null) 'images': images,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTableCompanion copyWith({
    Value<String?>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<double>? price,
    Value<String?>? brand,
    Value<String?>? sku,
    Value<String?>? images,
    Value<int>? rowid,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      images: images ?? this.images,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(images.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('brand: $brand, ')
          ..write('sku: $sku, ')
          ..write('images: $images, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartTableTable extends CartTable
    with TableInfo<$CartTableTable, CartTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productServerIdMeta = const VerificationMeta(
    'productServerId',
  );
  @override
  late final GeneratedColumn<String> productServerId = GeneratedColumn<String>(
    'product_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productPriceMeta = const VerificationMeta(
    'productPrice',
  );
  @override
  late final GeneratedColumn<double> productPrice = GeneratedColumn<double>(
    'product_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productDiscountPriceMeta =
      const VerificationMeta('productDiscountPrice');
  @override
  late final GeneratedColumn<double> productDiscountPrice =
      GeneratedColumn<double>(
        'product_discount_price',
        aliasedName,
        true,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _productThumbnailMeta = const VerificationMeta(
    'productThumbnail',
  );
  @override
  late final GeneratedColumn<String> productThumbnail = GeneratedColumn<String>(
    'product_thumbnail',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _selectedVariantsMeta = const VerificationMeta(
    'selectedVariants',
  );
  @override
  late final GeneratedColumn<String> selectedVariants = GeneratedColumn<String>(
    'selected_variants',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    productId,
    productServerId,
    productName,
    productPrice,
    productDiscountPrice,
    productThumbnail,
    quantity,
    selectedVariants,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_server_id')) {
      context.handle(
        _productServerIdMeta,
        productServerId.isAcceptableOrUnknown(
          data['product_server_id']!,
          _productServerIdMeta,
        ),
      );
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_price')) {
      context.handle(
        _productPriceMeta,
        productPrice.isAcceptableOrUnknown(
          data['product_price']!,
          _productPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productPriceMeta);
    }
    if (data.containsKey('product_discount_price')) {
      context.handle(
        _productDiscountPriceMeta,
        productDiscountPrice.isAcceptableOrUnknown(
          data['product_discount_price']!,
          _productDiscountPriceMeta,
        ),
      );
    }
    if (data.containsKey('product_thumbnail')) {
      context.handle(
        _productThumbnailMeta,
        productThumbnail.isAcceptableOrUnknown(
          data['product_thumbnail']!,
          _productThumbnailMeta,
        ),
      );
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    }
    if (data.containsKey('selected_variants')) {
      context.handle(
        _selectedVariantsMeta,
        selectedVariants.isAcceptableOrUnknown(
          data['selected_variants']!,
          _selectedVariantsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      productServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_server_id'],
      ),
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      productPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}product_price'],
      )!,
      productDiscountPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}product_discount_price'],
      ),
      productThumbnail: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_thumbnail'],
      ),
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      selectedVariants: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_variants'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $CartTableTable createAlias(String alias) {
    return $CartTableTable(attachedDatabase, alias);
  }
}

class CartTableData extends DataClass implements Insertable<CartTableData> {
  /// Primary key - cart item ID
  final int id;

  /// User ID (foreign key to users table)
  final int userId;

  /// Product ID (foreign key to products table)
  final int productId;

  /// Product's server ID
  final String? productServerId;

  /// Product name (cached for offline access)
  final String productName;

  /// Product price at the time of adding to cart
  final double productPrice;

  /// Product discount price at the time of adding to cart
  final double? productDiscountPrice;

  /// Product thumbnail (cached for offline access)
  final String? productThumbnail;

  /// Quantity of the product in cart
  final int quantity;

  /// Selected variant options (JSON object)
  final String? selectedVariants;

  /// When the item was added to cart
  final DateTime createdAt;

  /// When the cart item was last updated
  final DateTime updatedAt;
  const CartTableData({
    required this.id,
    required this.userId,
    required this.productId,
    this.productServerId,
    required this.productName,
    required this.productPrice,
    this.productDiscountPrice,
    this.productThumbnail,
    required this.quantity,
    this.selectedVariants,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || productServerId != null) {
      map['product_server_id'] = Variable<String>(productServerId);
    }
    map['product_name'] = Variable<String>(productName);
    map['product_price'] = Variable<double>(productPrice);
    if (!nullToAbsent || productDiscountPrice != null) {
      map['product_discount_price'] = Variable<double>(productDiscountPrice);
    }
    if (!nullToAbsent || productThumbnail != null) {
      map['product_thumbnail'] = Variable<String>(productThumbnail);
    }
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || selectedVariants != null) {
      map['selected_variants'] = Variable<String>(selectedVariants);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CartTableCompanion toCompanion(bool nullToAbsent) {
    return CartTableCompanion(
      id: Value(id),
      userId: Value(userId),
      productId: Value(productId),
      productServerId: productServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(productServerId),
      productName: Value(productName),
      productPrice: Value(productPrice),
      productDiscountPrice: productDiscountPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(productDiscountPrice),
      productThumbnail: productThumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(productThumbnail),
      quantity: Value(quantity),
      selectedVariants: selectedVariants == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedVariants),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CartTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      productId: serializer.fromJson<int>(json['productId']),
      productServerId: serializer.fromJson<String?>(json['productServerId']),
      productName: serializer.fromJson<String>(json['productName']),
      productPrice: serializer.fromJson<double>(json['productPrice']),
      productDiscountPrice: serializer.fromJson<double?>(
        json['productDiscountPrice'],
      ),
      productThumbnail: serializer.fromJson<String?>(json['productThumbnail']),
      quantity: serializer.fromJson<int>(json['quantity']),
      selectedVariants: serializer.fromJson<String?>(json['selectedVariants']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'productId': serializer.toJson<int>(productId),
      'productServerId': serializer.toJson<String?>(productServerId),
      'productName': serializer.toJson<String>(productName),
      'productPrice': serializer.toJson<double>(productPrice),
      'productDiscountPrice': serializer.toJson<double?>(productDiscountPrice),
      'productThumbnail': serializer.toJson<String?>(productThumbnail),
      'quantity': serializer.toJson<int>(quantity),
      'selectedVariants': serializer.toJson<String?>(selectedVariants),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CartTableData copyWith({
    int? id,
    int? userId,
    int? productId,
    Value<String?> productServerId = const Value.absent(),
    String? productName,
    double? productPrice,
    Value<double?> productDiscountPrice = const Value.absent(),
    Value<String?> productThumbnail = const Value.absent(),
    int? quantity,
    Value<String?> selectedVariants = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => CartTableData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    productId: productId ?? this.productId,
    productServerId: productServerId.present
        ? productServerId.value
        : this.productServerId,
    productName: productName ?? this.productName,
    productPrice: productPrice ?? this.productPrice,
    productDiscountPrice: productDiscountPrice.present
        ? productDiscountPrice.value
        : this.productDiscountPrice,
    productThumbnail: productThumbnail.present
        ? productThumbnail.value
        : this.productThumbnail,
    quantity: quantity ?? this.quantity,
    selectedVariants: selectedVariants.present
        ? selectedVariants.value
        : this.selectedVariants,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  CartTableData copyWithCompanion(CartTableCompanion data) {
    return CartTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productServerId: data.productServerId.present
          ? data.productServerId.value
          : this.productServerId,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      productPrice: data.productPrice.present
          ? data.productPrice.value
          : this.productPrice,
      productDiscountPrice: data.productDiscountPrice.present
          ? data.productDiscountPrice.value
          : this.productDiscountPrice,
      productThumbnail: data.productThumbnail.present
          ? data.productThumbnail.value
          : this.productThumbnail,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      selectedVariants: data.selectedVariants.present
          ? data.selectedVariants.value
          : this.selectedVariants,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId, ')
          ..write('productServerId: $productServerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('productDiscountPrice: $productDiscountPrice, ')
          ..write('productThumbnail: $productThumbnail, ')
          ..write('quantity: $quantity, ')
          ..write('selectedVariants: $selectedVariants, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    productId,
    productServerId,
    productName,
    productPrice,
    productDiscountPrice,
    productThumbnail,
    quantity,
    selectedVariants,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.productId == this.productId &&
          other.productServerId == this.productServerId &&
          other.productName == this.productName &&
          other.productPrice == this.productPrice &&
          other.productDiscountPrice == this.productDiscountPrice &&
          other.productThumbnail == this.productThumbnail &&
          other.quantity == this.quantity &&
          other.selectedVariants == this.selectedVariants &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CartTableCompanion extends UpdateCompanion<CartTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> productId;
  final Value<String?> productServerId;
  final Value<String> productName;
  final Value<double> productPrice;
  final Value<double?> productDiscountPrice;
  final Value<String?> productThumbnail;
  final Value<int> quantity;
  final Value<String?> selectedVariants;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CartTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productServerId = const Value.absent(),
    this.productName = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.productDiscountPrice = const Value.absent(),
    this.productThumbnail = const Value.absent(),
    this.quantity = const Value.absent(),
    this.selectedVariants = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CartTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int productId,
    this.productServerId = const Value.absent(),
    required String productName,
    required double productPrice,
    this.productDiscountPrice = const Value.absent(),
    this.productThumbnail = const Value.absent(),
    this.quantity = const Value.absent(),
    this.selectedVariants = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : userId = Value(userId),
       productId = Value(productId),
       productName = Value(productName),
       productPrice = Value(productPrice);
  static Insertable<CartTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? productId,
    Expression<String>? productServerId,
    Expression<String>? productName,
    Expression<double>? productPrice,
    Expression<double>? productDiscountPrice,
    Expression<String>? productThumbnail,
    Expression<int>? quantity,
    Expression<String>? selectedVariants,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (productId != null) 'product_id': productId,
      if (productServerId != null) 'product_server_id': productServerId,
      if (productName != null) 'product_name': productName,
      if (productPrice != null) 'product_price': productPrice,
      if (productDiscountPrice != null)
        'product_discount_price': productDiscountPrice,
      if (productThumbnail != null) 'product_thumbnail': productThumbnail,
      if (quantity != null) 'quantity': quantity,
      if (selectedVariants != null) 'selected_variants': selectedVariants,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CartTableCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? productId,
    Value<String?>? productServerId,
    Value<String>? productName,
    Value<double>? productPrice,
    Value<double?>? productDiscountPrice,
    Value<String?>? productThumbnail,
    Value<int>? quantity,
    Value<String?>? selectedVariants,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return CartTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      productServerId: productServerId ?? this.productServerId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productDiscountPrice: productDiscountPrice ?? this.productDiscountPrice,
      productThumbnail: productThumbnail ?? this.productThumbnail,
      quantity: quantity ?? this.quantity,
      selectedVariants: selectedVariants ?? this.selectedVariants,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productServerId.present) {
      map['product_server_id'] = Variable<String>(productServerId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<double>(productPrice.value);
    }
    if (productDiscountPrice.present) {
      map['product_discount_price'] = Variable<double>(
        productDiscountPrice.value,
      );
    }
    if (productThumbnail.present) {
      map['product_thumbnail'] = Variable<String>(productThumbnail.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (selectedVariants.present) {
      map['selected_variants'] = Variable<String>(selectedVariants.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId, ')
          ..write('productServerId: $productServerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('productDiscountPrice: $productDiscountPrice, ')
          ..write('productThumbnail: $productThumbnail, ')
          ..write('quantity: $quantity, ')
          ..write('selectedVariants: $selectedVariants, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $OrderTableTable extends OrderTable
    with TableInfo<$OrderTableTable, OrderTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalAmountMeta = const VerificationMeta(
    'totalAmount',
  );
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
    'total_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountAmountMeta = const VerificationMeta(
    'discountAmount',
  );
  @override
  late final GeneratedColumn<double> discountAmount = GeneratedColumn<double>(
    'discount_amount',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _shippingAddressMeta = const VerificationMeta(
    'shippingAddress',
  );
  @override
  late final GeneratedColumn<String> shippingAddress = GeneratedColumn<String>(
    'shipping_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _billingAddressMeta = const VerificationMeta(
    'billingAddress',
  );
  @override
  late final GeneratedColumn<String> billingAddress = GeneratedColumn<String>(
    'billing_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentMethodMeta = const VerificationMeta(
    'paymentMethod',
  );
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
    'payment_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paymentStatusMeta = const VerificationMeta(
    'paymentStatus',
  );
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
    'payment_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shippingMethodMeta = const VerificationMeta(
    'shippingMethod',
  );
  @override
  late final GeneratedColumn<String> shippingMethod = GeneratedColumn<String>(
    'shipping_method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _trackingNumberMeta = const VerificationMeta(
    'trackingNumber',
  );
  @override
  late final GeneratedColumn<String> trackingNumber = GeneratedColumn<String>(
    'tracking_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    serverId,
    userId,
    status,
    totalAmount,
    discountAmount,
    shippingAddress,
    billingAddress,
    paymentMethod,
    paymentStatus,
    shippingMethod,
    trackingNumber,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
        _totalAmountMeta,
        totalAmount.isAcceptableOrUnknown(
          data['total_amount']!,
          _totalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('discount_amount')) {
      context.handle(
        _discountAmountMeta,
        discountAmount.isAcceptableOrUnknown(
          data['discount_amount']!,
          _discountAmountMeta,
        ),
      );
    }
    if (data.containsKey('shipping_address')) {
      context.handle(
        _shippingAddressMeta,
        shippingAddress.isAcceptableOrUnknown(
          data['shipping_address']!,
          _shippingAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shippingAddressMeta);
    }
    if (data.containsKey('billing_address')) {
      context.handle(
        _billingAddressMeta,
        billingAddress.isAcceptableOrUnknown(
          data['billing_address']!,
          _billingAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_billingAddressMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentMethodMeta);
    }
    if (data.containsKey('payment_status')) {
      context.handle(
        _paymentStatusMeta,
        paymentStatus.isAcceptableOrUnknown(
          data['payment_status']!,
          _paymentStatusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paymentStatusMeta);
    }
    if (data.containsKey('shipping_method')) {
      context.handle(
        _shippingMethodMeta,
        shippingMethod.isAcceptableOrUnknown(
          data['shipping_method']!,
          _shippingMethodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shippingMethodMeta);
    }
    if (data.containsKey('tracking_number')) {
      context.handle(
        _trackingNumberMeta,
        trackingNumber.isAcceptableOrUnknown(
          data['tracking_number']!,
          _trackingNumberMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      ),
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      discountAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_amount'],
      ),
      shippingAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_address'],
      )!,
      billingAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}billing_address'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      paymentStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_status'],
      )!,
      shippingMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shipping_method'],
      )!,
      trackingNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tracking_number'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $OrderTableTable createAlias(String alias) {
    return $OrderTableTable(attachedDatabase, alias);
  }
}

class OrderTableData extends DataClass implements Insertable<OrderTableData> {
  /// Primary key - order ID
  final String id;

  /// Order's unique identifier from the server
  final String? serverId;

  /// User ID (foreign key to users table)
  final String userId;

  /// Order status (e.g. pending, completed, cancelled)
  final String status;

  /// Order total amount
  final double totalAmount;

  /// Order discount amount
  final double? discountAmount;

  /// Shipping address (JSON object)
  final String shippingAddress;

  /// Billing address (JSON object)
  final String billingAddress;

  /// Payment method used
  final String paymentMethod;

  /// Payment status (e.g. paid, unpaid)
  final String paymentStatus;

  /// Shipping method
  final String shippingMethod;

  /// Tracking number
  final String? trackingNumber;

  /// Order notes
  final String? notes;

  /// When the order was created
  final DateTime createdAt;

  /// When the order was last updated
  final DateTime updatedAt;
  const OrderTableData({
    required this.id,
    this.serverId,
    required this.userId,
    required this.status,
    required this.totalAmount,
    this.discountAmount,
    required this.shippingAddress,
    required this.billingAddress,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.shippingMethod,
    this.trackingNumber,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<String>(serverId);
    }
    map['user_id'] = Variable<String>(userId);
    map['status'] = Variable<String>(status);
    map['total_amount'] = Variable<double>(totalAmount);
    if (!nullToAbsent || discountAmount != null) {
      map['discount_amount'] = Variable<double>(discountAmount);
    }
    map['shipping_address'] = Variable<String>(shippingAddress);
    map['billing_address'] = Variable<String>(billingAddress);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['payment_status'] = Variable<String>(paymentStatus);
    map['shipping_method'] = Variable<String>(shippingMethod);
    if (!nullToAbsent || trackingNumber != null) {
      map['tracking_number'] = Variable<String>(trackingNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OrderTableCompanion toCompanion(bool nullToAbsent) {
    return OrderTableCompanion(
      id: Value(id),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      userId: Value(userId),
      status: Value(status),
      totalAmount: Value(totalAmount),
      discountAmount: discountAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(discountAmount),
      shippingAddress: Value(shippingAddress),
      billingAddress: Value(billingAddress),
      paymentMethod: Value(paymentMethod),
      paymentStatus: Value(paymentStatus),
      shippingMethod: Value(shippingMethod),
      trackingNumber: trackingNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(trackingNumber),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OrderTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderTableData(
      id: serializer.fromJson<String>(json['id']),
      serverId: serializer.fromJson<String?>(json['serverId']),
      userId: serializer.fromJson<String>(json['userId']),
      status: serializer.fromJson<String>(json['status']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      discountAmount: serializer.fromJson<double?>(json['discountAmount']),
      shippingAddress: serializer.fromJson<String>(json['shippingAddress']),
      billingAddress: serializer.fromJson<String>(json['billingAddress']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      shippingMethod: serializer.fromJson<String>(json['shippingMethod']),
      trackingNumber: serializer.fromJson<String?>(json['trackingNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'serverId': serializer.toJson<String?>(serverId),
      'userId': serializer.toJson<String>(userId),
      'status': serializer.toJson<String>(status),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'discountAmount': serializer.toJson<double?>(discountAmount),
      'shippingAddress': serializer.toJson<String>(shippingAddress),
      'billingAddress': serializer.toJson<String>(billingAddress),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'shippingMethod': serializer.toJson<String>(shippingMethod),
      'trackingNumber': serializer.toJson<String?>(trackingNumber),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OrderTableData copyWith({
    String? id,
    Value<String?> serverId = const Value.absent(),
    String? userId,
    String? status,
    double? totalAmount,
    Value<double?> discountAmount = const Value.absent(),
    String? shippingAddress,
    String? billingAddress,
    String? paymentMethod,
    String? paymentStatus,
    String? shippingMethod,
    Value<String?> trackingNumber = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => OrderTableData(
    id: id ?? this.id,
    serverId: serverId.present ? serverId.value : this.serverId,
    userId: userId ?? this.userId,
    status: status ?? this.status,
    totalAmount: totalAmount ?? this.totalAmount,
    discountAmount: discountAmount.present
        ? discountAmount.value
        : this.discountAmount,
    shippingAddress: shippingAddress ?? this.shippingAddress,
    billingAddress: billingAddress ?? this.billingAddress,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    shippingMethod: shippingMethod ?? this.shippingMethod,
    trackingNumber: trackingNumber.present
        ? trackingNumber.value
        : this.trackingNumber,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  OrderTableData copyWithCompanion(OrderTableCompanion data) {
    return OrderTableData(
      id: data.id.present ? data.id.value : this.id,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      userId: data.userId.present ? data.userId.value : this.userId,
      status: data.status.present ? data.status.value : this.status,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      discountAmount: data.discountAmount.present
          ? data.discountAmount.value
          : this.discountAmount,
      shippingAddress: data.shippingAddress.present
          ? data.shippingAddress.value
          : this.shippingAddress,
      billingAddress: data.billingAddress.present
          ? data.billingAddress.value
          : this.billingAddress,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      shippingMethod: data.shippingMethod.present
          ? data.shippingMethod.value
          : this.shippingMethod,
      trackingNumber: data.trackingNumber.present
          ? data.trackingNumber.value
          : this.trackingNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableData(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('shippingMethod: $shippingMethod, ')
          ..write('trackingNumber: $trackingNumber, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    serverId,
    userId,
    status,
    totalAmount,
    discountAmount,
    shippingAddress,
    billingAddress,
    paymentMethod,
    paymentStatus,
    shippingMethod,
    trackingNumber,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderTableData &&
          other.id == this.id &&
          other.serverId == this.serverId &&
          other.userId == this.userId &&
          other.status == this.status &&
          other.totalAmount == this.totalAmount &&
          other.discountAmount == this.discountAmount &&
          other.shippingAddress == this.shippingAddress &&
          other.billingAddress == this.billingAddress &&
          other.paymentMethod == this.paymentMethod &&
          other.paymentStatus == this.paymentStatus &&
          other.shippingMethod == this.shippingMethod &&
          other.trackingNumber == this.trackingNumber &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrderTableCompanion extends UpdateCompanion<OrderTableData> {
  final Value<String> id;
  final Value<String?> serverId;
  final Value<String> userId;
  final Value<String> status;
  final Value<double> totalAmount;
  final Value<double?> discountAmount;
  final Value<String> shippingAddress;
  final Value<String> billingAddress;
  final Value<String> paymentMethod;
  final Value<String> paymentStatus;
  final Value<String> shippingMethod;
  final Value<String?> trackingNumber;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const OrderTableCompanion({
    this.id = const Value.absent(),
    this.serverId = const Value.absent(),
    this.userId = const Value.absent(),
    this.status = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.discountAmount = const Value.absent(),
    this.shippingAddress = const Value.absent(),
    this.billingAddress = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.shippingMethod = const Value.absent(),
    this.trackingNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderTableCompanion.insert({
    required String id,
    this.serverId = const Value.absent(),
    required String userId,
    required String status,
    required double totalAmount,
    this.discountAmount = const Value.absent(),
    required String shippingAddress,
    required String billingAddress,
    required String paymentMethod,
    required String paymentStatus,
    required String shippingMethod,
    this.trackingNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       userId = Value(userId),
       status = Value(status),
       totalAmount = Value(totalAmount),
       shippingAddress = Value(shippingAddress),
       billingAddress = Value(billingAddress),
       paymentMethod = Value(paymentMethod),
       paymentStatus = Value(paymentStatus),
       shippingMethod = Value(shippingMethod);
  static Insertable<OrderTableData> custom({
    Expression<String>? id,
    Expression<String>? serverId,
    Expression<String>? userId,
    Expression<String>? status,
    Expression<double>? totalAmount,
    Expression<double>? discountAmount,
    Expression<String>? shippingAddress,
    Expression<String>? billingAddress,
    Expression<String>? paymentMethod,
    Expression<String>? paymentStatus,
    Expression<String>? shippingMethod,
    Expression<String>? trackingNumber,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (serverId != null) 'server_id': serverId,
      if (userId != null) 'user_id': userId,
      if (status != null) 'status': status,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (discountAmount != null) 'discount_amount': discountAmount,
      if (shippingAddress != null) 'shipping_address': shippingAddress,
      if (billingAddress != null) 'billing_address': billingAddress,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (shippingMethod != null) 'shipping_method': shippingMethod,
      if (trackingNumber != null) 'tracking_number': trackingNumber,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? serverId,
    Value<String>? userId,
    Value<String>? status,
    Value<double>? totalAmount,
    Value<double?>? discountAmount,
    Value<String>? shippingAddress,
    Value<String>? billingAddress,
    Value<String>? paymentMethod,
    Value<String>? paymentStatus,
    Value<String>? shippingMethod,
    Value<String?>? trackingNumber,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return OrderTableCompanion(
      id: id ?? this.id,
      serverId: serverId ?? this.serverId,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      billingAddress: billingAddress ?? this.billingAddress,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (discountAmount.present) {
      map['discount_amount'] = Variable<double>(discountAmount.value);
    }
    if (shippingAddress.present) {
      map['shipping_address'] = Variable<String>(shippingAddress.value);
    }
    if (billingAddress.present) {
      map['billing_address'] = Variable<String>(billingAddress.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (shippingMethod.present) {
      map['shipping_method'] = Variable<String>(shippingMethod.value);
    }
    if (trackingNumber.present) {
      map['tracking_number'] = Variable<String>(trackingNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderTableCompanion(')
          ..write('id: $id, ')
          ..write('serverId: $serverId, ')
          ..write('userId: $userId, ')
          ..write('status: $status, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('discountAmount: $discountAmount, ')
          ..write('shippingAddress: $shippingAddress, ')
          ..write('billingAddress: $billingAddress, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('shippingMethod: $shippingMethod, ')
          ..write('trackingNumber: $trackingNumber, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderItemTableTable extends OrderItemTable
    with TableInfo<$OrderItemTableTable, OrderItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _orderIdMeta = const VerificationMeta(
    'orderId',
  );
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
    'order_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productServerIdMeta = const VerificationMeta(
    'productServerId',
  );
  @override
  late final GeneratedColumn<String> productServerId = GeneratedColumn<String>(
    'product_server_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _productNameMeta = const VerificationMeta(
    'productName',
  );
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
    'product_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _productPriceMeta = const VerificationMeta(
    'productPrice',
  );
  @override
  late final GeneratedColumn<double> productPrice = GeneratedColumn<double>(
    'product_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedVariantsMeta = const VerificationMeta(
    'selectedVariants',
  );
  @override
  late final GeneratedColumn<String> selectedVariants = GeneratedColumn<String>(
    'selected_variants',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    orderId,
    productId,
    productServerId,
    productName,
    productPrice,
    quantity,
    selectedVariants,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(
        _orderIdMeta,
        orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_server_id')) {
      context.handle(
        _productServerIdMeta,
        productServerId.isAcceptableOrUnknown(
          data['product_server_id']!,
          _productServerIdMeta,
        ),
      );
    }
    if (data.containsKey('product_name')) {
      context.handle(
        _productNameMeta,
        productName.isAcceptableOrUnknown(
          data['product_name']!,
          _productNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('product_price')) {
      context.handle(
        _productPriceMeta,
        productPrice.isAcceptableOrUnknown(
          data['product_price']!,
          _productPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_productPriceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('selected_variants')) {
      context.handle(
        _selectedVariantsMeta,
        selectedVariants.isAcceptableOrUnknown(
          data['selected_variants']!,
          _selectedVariantsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      orderId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}order_id'],
      )!,
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      productServerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_server_id'],
      ),
      productName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_name'],
      )!,
      productPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}product_price'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      selectedVariants: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_variants'],
      ),
    );
  }

  @override
  $OrderItemTableTable createAlias(String alias) {
    return $OrderItemTableTable(attachedDatabase, alias);
  }
}

class OrderItemTableData extends DataClass
    implements Insertable<OrderItemTableData> {
  /// Primary key - order item ID
  final int id;

  /// Order ID (foreign key to orders table)
  final String orderId;

  /// Product ID (foreign key to products table)
  final int productId;

  /// Product's server ID
  final String? productServerId;

  /// Product name (cached)
  final String productName;

  /// Product price at the time of order
  final double productPrice;

  /// Quantity of the product ordered
  final int quantity;

  /// Selected variants (JSON object)
  final String? selectedVariants;
  const OrderItemTableData({
    required this.id,
    required this.orderId,
    required this.productId,
    this.productServerId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    this.selectedVariants,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<String>(orderId);
    map['product_id'] = Variable<int>(productId);
    if (!nullToAbsent || productServerId != null) {
      map['product_server_id'] = Variable<String>(productServerId);
    }
    map['product_name'] = Variable<String>(productName);
    map['product_price'] = Variable<double>(productPrice);
    map['quantity'] = Variable<int>(quantity);
    if (!nullToAbsent || selectedVariants != null) {
      map['selected_variants'] = Variable<String>(selectedVariants);
    }
    return map;
  }

  OrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return OrderItemTableCompanion(
      id: Value(id),
      orderId: Value(orderId),
      productId: Value(productId),
      productServerId: productServerId == null && nullToAbsent
          ? const Value.absent()
          : Value(productServerId),
      productName: Value(productName),
      productPrice: Value(productPrice),
      quantity: Value(quantity),
      selectedVariants: selectedVariants == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedVariants),
    );
  }

  factory OrderItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<String>(json['orderId']),
      productId: serializer.fromJson<int>(json['productId']),
      productServerId: serializer.fromJson<String?>(json['productServerId']),
      productName: serializer.fromJson<String>(json['productName']),
      productPrice: serializer.fromJson<double>(json['productPrice']),
      quantity: serializer.fromJson<int>(json['quantity']),
      selectedVariants: serializer.fromJson<String?>(json['selectedVariants']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<String>(orderId),
      'productId': serializer.toJson<int>(productId),
      'productServerId': serializer.toJson<String?>(productServerId),
      'productName': serializer.toJson<String>(productName),
      'productPrice': serializer.toJson<double>(productPrice),
      'quantity': serializer.toJson<int>(quantity),
      'selectedVariants': serializer.toJson<String?>(selectedVariants),
    };
  }

  OrderItemTableData copyWith({
    int? id,
    String? orderId,
    int? productId,
    Value<String?> productServerId = const Value.absent(),
    String? productName,
    double? productPrice,
    int? quantity,
    Value<String?> selectedVariants = const Value.absent(),
  }) => OrderItemTableData(
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    productId: productId ?? this.productId,
    productServerId: productServerId.present
        ? productServerId.value
        : this.productServerId,
    productName: productName ?? this.productName,
    productPrice: productPrice ?? this.productPrice,
    quantity: quantity ?? this.quantity,
    selectedVariants: selectedVariants.present
        ? selectedVariants.value
        : this.selectedVariants,
  );
  OrderItemTableData copyWithCompanion(OrderItemTableCompanion data) {
    return OrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productServerId: data.productServerId.present
          ? data.productServerId.value
          : this.productServerId,
      productName: data.productName.present
          ? data.productName.value
          : this.productName,
      productPrice: data.productPrice.present
          ? data.productPrice.value
          : this.productPrice,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      selectedVariants: data.selectedVariants.present
          ? data.selectedVariants.value
          : this.selectedVariants,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableData(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productServerId: $productServerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('quantity: $quantity, ')
          ..write('selectedVariants: $selectedVariants')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    orderId,
    productId,
    productServerId,
    productName,
    productPrice,
    quantity,
    selectedVariants,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemTableData &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.productServerId == this.productServerId &&
          other.productName == this.productName &&
          other.productPrice == this.productPrice &&
          other.quantity == this.quantity &&
          other.selectedVariants == this.selectedVariants);
}

class OrderItemTableCompanion extends UpdateCompanion<OrderItemTableData> {
  final Value<int> id;
  final Value<String> orderId;
  final Value<int> productId;
  final Value<String?> productServerId;
  final Value<String> productName;
  final Value<double> productPrice;
  final Value<int> quantity;
  final Value<String?> selectedVariants;
  const OrderItemTableCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productServerId = const Value.absent(),
    this.productName = const Value.absent(),
    this.productPrice = const Value.absent(),
    this.quantity = const Value.absent(),
    this.selectedVariants = const Value.absent(),
  });
  OrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required String orderId,
    required int productId,
    this.productServerId = const Value.absent(),
    required String productName,
    required double productPrice,
    required int quantity,
    this.selectedVariants = const Value.absent(),
  }) : orderId = Value(orderId),
       productId = Value(productId),
       productName = Value(productName),
       productPrice = Value(productPrice),
       quantity = Value(quantity);
  static Insertable<OrderItemTableData> custom({
    Expression<int>? id,
    Expression<String>? orderId,
    Expression<int>? productId,
    Expression<String>? productServerId,
    Expression<String>? productName,
    Expression<double>? productPrice,
    Expression<int>? quantity,
    Expression<String>? selectedVariants,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (productServerId != null) 'product_server_id': productServerId,
      if (productName != null) 'product_name': productName,
      if (productPrice != null) 'product_price': productPrice,
      if (quantity != null) 'quantity': quantity,
      if (selectedVariants != null) 'selected_variants': selectedVariants,
    });
  }

  OrderItemTableCompanion copyWith({
    Value<int>? id,
    Value<String>? orderId,
    Value<int>? productId,
    Value<String?>? productServerId,
    Value<String>? productName,
    Value<double>? productPrice,
    Value<int>? quantity,
    Value<String?>? selectedVariants,
  }) {
    return OrderItemTableCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      productServerId: productServerId ?? this.productServerId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      quantity: quantity ?? this.quantity,
      selectedVariants: selectedVariants ?? this.selectedVariants,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productServerId.present) {
      map['product_server_id'] = Variable<String>(productServerId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (productPrice.present) {
      map['product_price'] = Variable<double>(productPrice.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (selectedVariants.present) {
      map['selected_variants'] = Variable<String>(selectedVariants.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productServerId: $productServerId, ')
          ..write('productName: $productName, ')
          ..write('productPrice: $productPrice, ')
          ..write('quantity: $quantity, ')
          ..write('selectedVariants: $selectedVariants')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CartTableTable cartTable = $CartTableTable(this);
  late final $OrderTableTable orderTable = $OrderTableTable(this);
  late final $OrderItemTableTable orderItemTable = $OrderItemTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userTable,
    productTable,
    cartTable,
    orderTable,
    orderItemTable,
  ];
}

typedef $$UserTableTableCreateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String?> serverId,
      required String email,
      required String firstName,
      required String lastName,
      Value<String?> phone,
      Value<String?> profilePicture,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<String?> postalCode,
      Value<bool> isVerified,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserTableTableUpdateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String?> serverId,
      Value<String> email,
      Value<String> firstName,
      Value<String> lastName,
      Value<String?> phone,
      Value<String?> profilePicture,
      Value<String?> address,
      Value<String?> city,
      Value<String?> country,
      Value<String?> postalCode,
      Value<bool> isVerified,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get profilePicture => $composableBuilder(
    column: $table.profilePicture,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
    column: $table.postalCode,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isVerified => $composableBuilder(
    column: $table.isVerified,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTableTable,
          UserTableData,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (
            UserTableData,
            BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>,
          ),
          UserTableData,
          PrefetchHooks Function()
        > {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> profilePicture = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                serverId: serverId,
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
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                required String email,
                required String firstName,
                required String lastName,
                Value<String?> phone = const Value.absent(),
                Value<String?> profilePicture = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> city = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<String?> postalCode = const Value.absent(),
                Value<bool> isVerified = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                serverId: serverId,
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
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTableTable,
      UserTableData,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (
        UserTableData,
        BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>,
      ),
      UserTableData,
      PrefetchHooks Function()
    >;
typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<String?> id,
      required String name,
      Value<String?> description,
      required double price,
      Value<String?> brand,
      Value<String?> sku,
      Value<String?> images,
      Value<int> rowid,
    });
typedef $$ProductTableTableUpdateCompanionBuilder =
    ProductTableCompanion Function({
      Value<String?> id,
      Value<String> name,
      Value<String?> description,
      Value<double> price,
      Value<String?> brand,
      Value<String?> sku,
      Value<String?> images,
      Value<int> rowid,
    });

class $$ProductTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);
}

class $$ProductTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTableTable,
          ProductTableData,
          $$ProductTableTableFilterComposer,
          $$ProductTableTableOrderingComposer,
          $$ProductTableTableAnnotationComposer,
          $$ProductTableTableCreateCompanionBuilder,
          $$ProductTableTableUpdateCompanionBuilder,
          (
            ProductTableData,
            BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>,
          ),
          ProductTableData,
          PrefetchHooks Function()
        > {
  $$ProductTableTableTableManager(_$AppDatabase db, $ProductTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String?> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String?> brand = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> images = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                description: description,
                price: price,
                brand: brand,
                sku: sku,
                images: images,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String?> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required double price,
                Value<String?> brand = const Value.absent(),
                Value<String?> sku = const Value.absent(),
                Value<String?> images = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                price: price,
                brand: brand,
                sku: sku,
                images: images,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTableTable,
      ProductTableData,
      $$ProductTableTableFilterComposer,
      $$ProductTableTableOrderingComposer,
      $$ProductTableTableAnnotationComposer,
      $$ProductTableTableCreateCompanionBuilder,
      $$ProductTableTableUpdateCompanionBuilder,
      (
        ProductTableData,
        BaseReferences<_$AppDatabase, $ProductTableTable, ProductTableData>,
      ),
      ProductTableData,
      PrefetchHooks Function()
    >;
typedef $$CartTableTableCreateCompanionBuilder =
    CartTableCompanion Function({
      Value<int> id,
      required int userId,
      required int productId,
      Value<String?> productServerId,
      required String productName,
      required double productPrice,
      Value<double?> productDiscountPrice,
      Value<String?> productThumbnail,
      Value<int> quantity,
      Value<String?> selectedVariants,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$CartTableTableUpdateCompanionBuilder =
    CartTableCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> productId,
      Value<String?> productServerId,
      Value<String> productName,
      Value<double> productPrice,
      Value<double?> productDiscountPrice,
      Value<String?> productThumbnail,
      Value<int> quantity,
      Value<String?> selectedVariants,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$CartTableTableFilterComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get productDiscountPrice => $composableBuilder(
    column: $table.productDiscountPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productThumbnail => $composableBuilder(
    column: $table.productThumbnail,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CartTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get productDiscountPrice => $composableBuilder(
    column: $table.productDiscountPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productThumbnail => $composableBuilder(
    column: $table.productThumbnail,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CartTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CartTableTable> {
  $$CartTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get productDiscountPrice => $composableBuilder(
    column: $table.productDiscountPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productThumbnail => $composableBuilder(
    column: $table.productThumbnail,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$CartTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CartTableTable,
          CartTableData,
          $$CartTableTableFilterComposer,
          $$CartTableTableOrderingComposer,
          $$CartTableTableAnnotationComposer,
          $$CartTableTableCreateCompanionBuilder,
          $$CartTableTableUpdateCompanionBuilder,
          (
            CartTableData,
            BaseReferences<_$AppDatabase, $CartTableTable, CartTableData>,
          ),
          CartTableData,
          PrefetchHooks Function()
        > {
  $$CartTableTableTableManager(_$AppDatabase db, $CartTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CartTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CartTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CartTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<String?> productServerId = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<double> productPrice = const Value.absent(),
                Value<double?> productDiscountPrice = const Value.absent(),
                Value<String?> productThumbnail = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String?> selectedVariants = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CartTableCompanion(
                id: id,
                userId: userId,
                productId: productId,
                productServerId: productServerId,
                productName: productName,
                productPrice: productPrice,
                productDiscountPrice: productDiscountPrice,
                productThumbnail: productThumbnail,
                quantity: quantity,
                selectedVariants: selectedVariants,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int productId,
                Value<String?> productServerId = const Value.absent(),
                required String productName,
                required double productPrice,
                Value<double?> productDiscountPrice = const Value.absent(),
                Value<String?> productThumbnail = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String?> selectedVariants = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => CartTableCompanion.insert(
                id: id,
                userId: userId,
                productId: productId,
                productServerId: productServerId,
                productName: productName,
                productPrice: productPrice,
                productDiscountPrice: productDiscountPrice,
                productThumbnail: productThumbnail,
                quantity: quantity,
                selectedVariants: selectedVariants,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CartTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CartTableTable,
      CartTableData,
      $$CartTableTableFilterComposer,
      $$CartTableTableOrderingComposer,
      $$CartTableTableAnnotationComposer,
      $$CartTableTableCreateCompanionBuilder,
      $$CartTableTableUpdateCompanionBuilder,
      (
        CartTableData,
        BaseReferences<_$AppDatabase, $CartTableTable, CartTableData>,
      ),
      CartTableData,
      PrefetchHooks Function()
    >;
typedef $$OrderTableTableCreateCompanionBuilder =
    OrderTableCompanion Function({
      required String id,
      Value<String?> serverId,
      required String userId,
      required String status,
      required double totalAmount,
      Value<double?> discountAmount,
      required String shippingAddress,
      required String billingAddress,
      required String paymentMethod,
      required String paymentStatus,
      required String shippingMethod,
      Value<String?> trackingNumber,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$OrderTableTableUpdateCompanionBuilder =
    OrderTableCompanion Function({
      Value<String> id,
      Value<String?> serverId,
      Value<String> userId,
      Value<String> status,
      Value<double> totalAmount,
      Value<double?> discountAmount,
      Value<String> shippingAddress,
      Value<String> billingAddress,
      Value<String> paymentMethod,
      Value<String> paymentStatus,
      Value<String> shippingMethod,
      Value<String?> trackingNumber,
      Value<String?> notes,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$OrderTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderTableTable> {
  $$OrderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shippingMethod => $composableBuilder(
    column: $table.shippingMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get trackingNumber => $composableBuilder(
    column: $table.trackingNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderTableTable> {
  $$OrderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shippingMethod => $composableBuilder(
    column: $table.shippingMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get trackingNumber => $composableBuilder(
    column: $table.trackingNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderTableTable> {
  $$OrderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountAmount => $composableBuilder(
    column: $table.discountAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingAddress => $composableBuilder(
    column: $table.shippingAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get billingAddress => $composableBuilder(
    column: $table.billingAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
    column: $table.paymentStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get shippingMethod => $composableBuilder(
    column: $table.shippingMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get trackingNumber => $composableBuilder(
    column: $table.trackingNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OrderTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderTableTable,
          OrderTableData,
          $$OrderTableTableFilterComposer,
          $$OrderTableTableOrderingComposer,
          $$OrderTableTableAnnotationComposer,
          $$OrderTableTableCreateCompanionBuilder,
          $$OrderTableTableUpdateCompanionBuilder,
          (
            OrderTableData,
            BaseReferences<_$AppDatabase, $OrderTableTable, OrderTableData>,
          ),
          OrderTableData,
          PrefetchHooks Function()
        > {
  $$OrderTableTableTableManager(_$AppDatabase db, $OrderTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> serverId = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double?> discountAmount = const Value.absent(),
                Value<String> shippingAddress = const Value.absent(),
                Value<String> billingAddress = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String> paymentStatus = const Value.absent(),
                Value<String> shippingMethod = const Value.absent(),
                Value<String?> trackingNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderTableCompanion(
                id: id,
                serverId: serverId,
                userId: userId,
                status: status,
                totalAmount: totalAmount,
                discountAmount: discountAmount,
                shippingAddress: shippingAddress,
                billingAddress: billingAddress,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                shippingMethod: shippingMethod,
                trackingNumber: trackingNumber,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> serverId = const Value.absent(),
                required String userId,
                required String status,
                required double totalAmount,
                Value<double?> discountAmount = const Value.absent(),
                required String shippingAddress,
                required String billingAddress,
                required String paymentMethod,
                required String paymentStatus,
                required String shippingMethod,
                Value<String?> trackingNumber = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrderTableCompanion.insert(
                id: id,
                serverId: serverId,
                userId: userId,
                status: status,
                totalAmount: totalAmount,
                discountAmount: discountAmount,
                shippingAddress: shippingAddress,
                billingAddress: billingAddress,
                paymentMethod: paymentMethod,
                paymentStatus: paymentStatus,
                shippingMethod: shippingMethod,
                trackingNumber: trackingNumber,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderTableTable,
      OrderTableData,
      $$OrderTableTableFilterComposer,
      $$OrderTableTableOrderingComposer,
      $$OrderTableTableAnnotationComposer,
      $$OrderTableTableCreateCompanionBuilder,
      $$OrderTableTableUpdateCompanionBuilder,
      (
        OrderTableData,
        BaseReferences<_$AppDatabase, $OrderTableTable, OrderTableData>,
      ),
      OrderTableData,
      PrefetchHooks Function()
    >;
typedef $$OrderItemTableTableCreateCompanionBuilder =
    OrderItemTableCompanion Function({
      Value<int> id,
      required String orderId,
      required int productId,
      Value<String?> productServerId,
      required String productName,
      required double productPrice,
      required int quantity,
      Value<String?> selectedVariants,
    });
typedef $$OrderItemTableTableUpdateCompanionBuilder =
    OrderItemTableCompanion Function({
      Value<int> id,
      Value<String> orderId,
      Value<int> productId,
      Value<String?> productServerId,
      Value<String> productName,
      Value<double> productPrice,
      Value<int> quantity,
      Value<String?> selectedVariants,
    });

class $$OrderItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrderItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get orderId => $composableBuilder(
    column: $table.orderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrderItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemTableTable> {
  $$OrderItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productServerId => $composableBuilder(
    column: $table.productServerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productName => $composableBuilder(
    column: $table.productName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get productPrice => $composableBuilder(
    column: $table.productPrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<String> get selectedVariants => $composableBuilder(
    column: $table.selectedVariants,
    builder: (column) => column,
  );
}

class $$OrderItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderItemTableTable,
          OrderItemTableData,
          $$OrderItemTableTableFilterComposer,
          $$OrderItemTableTableOrderingComposer,
          $$OrderItemTableTableAnnotationComposer,
          $$OrderItemTableTableCreateCompanionBuilder,
          $$OrderItemTableTableUpdateCompanionBuilder,
          (
            OrderItemTableData,
            BaseReferences<
              _$AppDatabase,
              $OrderItemTableTable,
              OrderItemTableData
            >,
          ),
          OrderItemTableData,
          PrefetchHooks Function()
        > {
  $$OrderItemTableTableTableManager(
    _$AppDatabase db,
    $OrderItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> orderId = const Value.absent(),
                Value<int> productId = const Value.absent(),
                Value<String?> productServerId = const Value.absent(),
                Value<String> productName = const Value.absent(),
                Value<double> productPrice = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<String?> selectedVariants = const Value.absent(),
              }) => OrderItemTableCompanion(
                id: id,
                orderId: orderId,
                productId: productId,
                productServerId: productServerId,
                productName: productName,
                productPrice: productPrice,
                quantity: quantity,
                selectedVariants: selectedVariants,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String orderId,
                required int productId,
                Value<String?> productServerId = const Value.absent(),
                required String productName,
                required double productPrice,
                required int quantity,
                Value<String?> selectedVariants = const Value.absent(),
              }) => OrderItemTableCompanion.insert(
                id: id,
                orderId: orderId,
                productId: productId,
                productServerId: productServerId,
                productName: productName,
                productPrice: productPrice,
                quantity: quantity,
                selectedVariants: selectedVariants,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrderItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderItemTableTable,
      OrderItemTableData,
      $$OrderItemTableTableFilterComposer,
      $$OrderItemTableTableOrderingComposer,
      $$OrderItemTableTableAnnotationComposer,
      $$OrderItemTableTableCreateCompanionBuilder,
      $$OrderItemTableTableUpdateCompanionBuilder,
      (
        OrderItemTableData,
        BaseReferences<_$AppDatabase, $OrderItemTableTable, OrderItemTableData>,
      ),
      OrderItemTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$CartTableTableTableManager get cartTable =>
      $$CartTableTableTableManager(_db, _db.cartTable);
  $$OrderTableTableTableManager get orderTable =>
      $$OrderTableTableTableManager(_db, _db.orderTable);
  $$OrderItemTableTableTableManager get orderItemTable =>
      $$OrderItemTableTableTableManager(_db, _db.orderItemTable);
}
