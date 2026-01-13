// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordHashMeta = const VerificationMeta(
    'passwordHash',
  );
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
    'password_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('admin'),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    username,
    passwordHash,
    role,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
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
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
        _passwordHashMeta,
        passwordHash.isAcceptableOrUnknown(
          data['password_hash']!,
          _passwordHashMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      passwordHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password_hash'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String username;
  final String passwordHash;
  final String role;
  final bool isActive;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.passwordHash,
    required this.role,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['role'] = Variable<String>(role);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      passwordHash: Value(passwordHash),
      role: Value(role),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      role: serializer.fromJson<String>(json['role']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'role': serializer.toJson<String>(role),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? username,
    String? passwordHash,
    String? role,
    bool? isActive,
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    username: username ?? this.username,
    passwordHash: passwordHash ?? this.passwordHash,
    role: role ?? this.role,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, username, passwordHash, role, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> role;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String username,
    required String passwordHash,
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       username = Value(username),
       passwordHash = Value(passwordHash);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? role,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? username,
    Value<String>? passwordHash,
    Value<String>? role,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AreasTable extends Areas with TableInfo<$AreasTable, Area> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AreasTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'areas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Area> instance, {
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Area map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Area(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $AreasTable createAlias(String alias) {
    return $AreasTable(attachedDatabase, alias);
  }
}

class Area extends DataClass implements Insertable<Area> {
  final int id;
  final String name;
  const Area({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  AreasCompanion toCompanion(bool nullToAbsent) {
    return AreasCompanion(id: Value(id), name: Value(name));
  }

  factory Area.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Area(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Area copyWith({int? id, String? name}) =>
      Area(id: id ?? this.id, name: name ?? this.name);
  Area copyWithCompanion(AreasCompanion data) {
    return Area(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Area(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Area && other.id == this.id && other.name == this.name);
}

class AreasCompanion extends UpdateCompanion<Area> {
  final Value<int> id;
  final Value<String> name;
  const AreasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  AreasCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Area> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  AreasCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return AreasCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SubscribersTable extends Subscribers
    with TableInfo<$SubscribersTable, Subscriber> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscribersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
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
  static const VerificationMeta _areaIdMeta = const VerificationMeta('areaId');
  @override
  late final GeneratedColumn<int> areaId = GeneratedColumn<int>(
    'area_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES areas (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    fullName,
    phone,
    areaId,
    status,
    address,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscribers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subscriber> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('area_id')) {
      context.handle(
        _areaIdMeta,
        areaId.isAcceptableOrUnknown(data['area_id']!, _areaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_areaIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subscriber map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscriber(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      areaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}area_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SubscribersTable createAlias(String alias) {
    return $SubscribersTable(attachedDatabase, alias);
  }
}

class Subscriber extends DataClass implements Insertable<Subscriber> {
  final int id;
  final String fullName;
  final String? phone;
  final int areaId;
  final String status;
  final String? address;
  final DateTime createdAt;
  const Subscriber({
    required this.id,
    required this.fullName,
    this.phone,
    required this.areaId,
    required this.status,
    this.address,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['area_id'] = Variable<int>(areaId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SubscribersCompanion toCompanion(bool nullToAbsent) {
    return SubscribersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      areaId: Value(areaId),
      status: Value(status),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      createdAt: Value(createdAt),
    );
  }

  factory Subscriber.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscriber(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phone: serializer.fromJson<String?>(json['phone']),
      areaId: serializer.fromJson<int>(json['areaId']),
      status: serializer.fromJson<String>(json['status']),
      address: serializer.fromJson<String?>(json['address']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phone': serializer.toJson<String?>(phone),
      'areaId': serializer.toJson<int>(areaId),
      'status': serializer.toJson<String>(status),
      'address': serializer.toJson<String?>(address),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Subscriber copyWith({
    int? id,
    String? fullName,
    Value<String?> phone = const Value.absent(),
    int? areaId,
    String? status,
    Value<String?> address = const Value.absent(),
    DateTime? createdAt,
  }) => Subscriber(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    phone: phone.present ? phone.value : this.phone,
    areaId: areaId ?? this.areaId,
    status: status ?? this.status,
    address: address.present ? address.value : this.address,
    createdAt: createdAt ?? this.createdAt,
  );
  Subscriber copyWithCompanion(SubscribersCompanion data) {
    return Subscriber(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phone: data.phone.present ? data.phone.value : this.phone,
      areaId: data.areaId.present ? data.areaId.value : this.areaId,
      status: data.status.present ? data.status.value : this.status,
      address: data.address.present ? data.address.value : this.address,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subscriber(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('areaId: $areaId, ')
          ..write('status: $status, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, fullName, phone, areaId, status, address, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscriber &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.areaId == this.areaId &&
          other.status == this.status &&
          other.address == this.address &&
          other.createdAt == this.createdAt);
}

class SubscribersCompanion extends UpdateCompanion<Subscriber> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String?> phone;
  final Value<int> areaId;
  final Value<String> status;
  final Value<String?> address;
  final Value<DateTime> createdAt;
  const SubscribersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.areaId = const Value.absent(),
    this.status = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SubscribersCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    this.phone = const Value.absent(),
    required int areaId,
    this.status = const Value.absent(),
    this.address = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : fullName = Value(fullName),
       areaId = Value(areaId);
  static Insertable<Subscriber> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<int>? areaId,
    Expression<String>? status,
    Expression<String>? address,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (areaId != null) 'area_id': areaId,
      if (status != null) 'status': status,
      if (address != null) 'address': address,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SubscribersCompanion copyWith({
    Value<int>? id,
    Value<String>? fullName,
    Value<String?>? phone,
    Value<int>? areaId,
    Value<String>? status,
    Value<String?>? address,
    Value<DateTime>? createdAt,
  }) {
    return SubscribersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      areaId: areaId ?? this.areaId,
      status: status ?? this.status,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (areaId.present) {
      map['area_id'] = Variable<int>(areaId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscribersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('areaId: $areaId, ')
          ..write('status: $status, ')
          ..write('address: $address, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MetersTable extends Meters with TableInfo<$MetersTable, Meter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _meterNoMeta = const VerificationMeta(
    'meterNo',
  );
  @override
  late final GeneratedColumn<String> meterNo = GeneratedColumn<String>(
    'meter_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _subscriberIdMeta = const VerificationMeta(
    'subscriberId',
  );
  @override
  late final GeneratedColumn<int> subscriberId = GeneratedColumn<int>(
    'subscriber_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscribers (id)',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('ok'),
  );
  static const VerificationMeta _installedAtMeta = const VerificationMeta(
    'installedAt',
  );
  @override
  late final GeneratedColumn<DateTime> installedAt = GeneratedColumn<DateTime>(
    'installed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastReadingDateMeta = const VerificationMeta(
    'lastReadingDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastReadingDate =
      GeneratedColumn<DateTime>(
        'last_reading_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    meterNo,
    subscriberId,
    status,
    installedAt,
    lastReadingDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Meter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meter_no')) {
      context.handle(
        _meterNoMeta,
        meterNo.isAcceptableOrUnknown(data['meter_no']!, _meterNoMeta),
      );
    } else if (isInserting) {
      context.missing(_meterNoMeta);
    }
    if (data.containsKey('subscriber_id')) {
      context.handle(
        _subscriberIdMeta,
        subscriberId.isAcceptableOrUnknown(
          data['subscriber_id']!,
          _subscriberIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('installed_at')) {
      context.handle(
        _installedAtMeta,
        installedAt.isAcceptableOrUnknown(
          data['installed_at']!,
          _installedAtMeta,
        ),
      );
    }
    if (data.containsKey('last_reading_date')) {
      context.handle(
        _lastReadingDateMeta,
        lastReadingDate.isAcceptableOrUnknown(
          data['last_reading_date']!,
          _lastReadingDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Meter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Meter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      meterNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meter_no'],
      )!,
      subscriberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscriber_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      installedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}installed_at'],
      )!,
      lastReadingDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reading_date'],
      ),
    );
  }

  @override
  $MetersTable createAlias(String alias) {
    return $MetersTable(attachedDatabase, alias);
  }
}

class Meter extends DataClass implements Insertable<Meter> {
  final int id;
  final String meterNo;
  final int? subscriberId;
  final String status;
  final DateTime installedAt;
  final DateTime? lastReadingDate;
  const Meter({
    required this.id,
    required this.meterNo,
    this.subscriberId,
    required this.status,
    required this.installedAt,
    this.lastReadingDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meter_no'] = Variable<String>(meterNo);
    if (!nullToAbsent || subscriberId != null) {
      map['subscriber_id'] = Variable<int>(subscriberId);
    }
    map['status'] = Variable<String>(status);
    map['installed_at'] = Variable<DateTime>(installedAt);
    if (!nullToAbsent || lastReadingDate != null) {
      map['last_reading_date'] = Variable<DateTime>(lastReadingDate);
    }
    return map;
  }

  MetersCompanion toCompanion(bool nullToAbsent) {
    return MetersCompanion(
      id: Value(id),
      meterNo: Value(meterNo),
      subscriberId: subscriberId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriberId),
      status: Value(status),
      installedAt: Value(installedAt),
      lastReadingDate: lastReadingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReadingDate),
    );
  }

  factory Meter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Meter(
      id: serializer.fromJson<int>(json['id']),
      meterNo: serializer.fromJson<String>(json['meterNo']),
      subscriberId: serializer.fromJson<int?>(json['subscriberId']),
      status: serializer.fromJson<String>(json['status']),
      installedAt: serializer.fromJson<DateTime>(json['installedAt']),
      lastReadingDate: serializer.fromJson<DateTime?>(json['lastReadingDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'meterNo': serializer.toJson<String>(meterNo),
      'subscriberId': serializer.toJson<int?>(subscriberId),
      'status': serializer.toJson<String>(status),
      'installedAt': serializer.toJson<DateTime>(installedAt),
      'lastReadingDate': serializer.toJson<DateTime?>(lastReadingDate),
    };
  }

  Meter copyWith({
    int? id,
    String? meterNo,
    Value<int?> subscriberId = const Value.absent(),
    String? status,
    DateTime? installedAt,
    Value<DateTime?> lastReadingDate = const Value.absent(),
  }) => Meter(
    id: id ?? this.id,
    meterNo: meterNo ?? this.meterNo,
    subscriberId: subscriberId.present ? subscriberId.value : this.subscriberId,
    status: status ?? this.status,
    installedAt: installedAt ?? this.installedAt,
    lastReadingDate: lastReadingDate.present
        ? lastReadingDate.value
        : this.lastReadingDate,
  );
  Meter copyWithCompanion(MetersCompanion data) {
    return Meter(
      id: data.id.present ? data.id.value : this.id,
      meterNo: data.meterNo.present ? data.meterNo.value : this.meterNo,
      subscriberId: data.subscriberId.present
          ? data.subscriberId.value
          : this.subscriberId,
      status: data.status.present ? data.status.value : this.status,
      installedAt: data.installedAt.present
          ? data.installedAt.value
          : this.installedAt,
      lastReadingDate: data.lastReadingDate.present
          ? data.lastReadingDate.value
          : this.lastReadingDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Meter(')
          ..write('id: $id, ')
          ..write('meterNo: $meterNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('status: $status, ')
          ..write('installedAt: $installedAt, ')
          ..write('lastReadingDate: $lastReadingDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    meterNo,
    subscriberId,
    status,
    installedAt,
    lastReadingDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Meter &&
          other.id == this.id &&
          other.meterNo == this.meterNo &&
          other.subscriberId == this.subscriberId &&
          other.status == this.status &&
          other.installedAt == this.installedAt &&
          other.lastReadingDate == this.lastReadingDate);
}

class MetersCompanion extends UpdateCompanion<Meter> {
  final Value<int> id;
  final Value<String> meterNo;
  final Value<int?> subscriberId;
  final Value<String> status;
  final Value<DateTime> installedAt;
  final Value<DateTime?> lastReadingDate;
  const MetersCompanion({
    this.id = const Value.absent(),
    this.meterNo = const Value.absent(),
    this.subscriberId = const Value.absent(),
    this.status = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.lastReadingDate = const Value.absent(),
  });
  MetersCompanion.insert({
    this.id = const Value.absent(),
    required String meterNo,
    this.subscriberId = const Value.absent(),
    this.status = const Value.absent(),
    this.installedAt = const Value.absent(),
    this.lastReadingDate = const Value.absent(),
  }) : meterNo = Value(meterNo);
  static Insertable<Meter> custom({
    Expression<int>? id,
    Expression<String>? meterNo,
    Expression<int>? subscriberId,
    Expression<String>? status,
    Expression<DateTime>? installedAt,
    Expression<DateTime>? lastReadingDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (meterNo != null) 'meter_no': meterNo,
      if (subscriberId != null) 'subscriber_id': subscriberId,
      if (status != null) 'status': status,
      if (installedAt != null) 'installed_at': installedAt,
      if (lastReadingDate != null) 'last_reading_date': lastReadingDate,
    });
  }

  MetersCompanion copyWith({
    Value<int>? id,
    Value<String>? meterNo,
    Value<int?>? subscriberId,
    Value<String>? status,
    Value<DateTime>? installedAt,
    Value<DateTime?>? lastReadingDate,
  }) {
    return MetersCompanion(
      id: id ?? this.id,
      meterNo: meterNo ?? this.meterNo,
      subscriberId: subscriberId ?? this.subscriberId,
      status: status ?? this.status,
      installedAt: installedAt ?? this.installedAt,
      lastReadingDate: lastReadingDate ?? this.lastReadingDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (meterNo.present) {
      map['meter_no'] = Variable<String>(meterNo.value);
    }
    if (subscriberId.present) {
      map['subscriber_id'] = Variable<int>(subscriberId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (installedAt.present) {
      map['installed_at'] = Variable<DateTime>(installedAt.value);
    }
    if (lastReadingDate.present) {
      map['last_reading_date'] = Variable<DateTime>(lastReadingDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetersCompanion(')
          ..write('id: $id, ')
          ..write('meterNo: $meterNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('status: $status, ')
          ..write('installedAt: $installedAt, ')
          ..write('lastReadingDate: $lastReadingDate')
          ..write(')'))
        .toString();
  }
}

class $TariffsTable extends Tariffs with TableInfo<$TariffsTable, Tariff> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TariffsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fixedFeeMeta = const VerificationMeta(
    'fixedFee',
  );
  @override
  late final GeneratedColumn<double> fixedFee = GeneratedColumn<double>(
    'fixed_fee',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(100.0),
  );
  static const VerificationMeta _effectiveFromMeta = const VerificationMeta(
    'effectiveFrom',
  );
  @override
  late final GeneratedColumn<DateTime> effectiveFrom =
      GeneratedColumn<DateTime>(
        'effective_from',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    fixedFee,
    effectiveFrom,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tariffs';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tariff> instance, {
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
    if (data.containsKey('fixed_fee')) {
      context.handle(
        _fixedFeeMeta,
        fixedFee.isAcceptableOrUnknown(data['fixed_fee']!, _fixedFeeMeta),
      );
    }
    if (data.containsKey('effective_from')) {
      context.handle(
        _effectiveFromMeta,
        effectiveFrom.isAcceptableOrUnknown(
          data['effective_from']!,
          _effectiveFromMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_effectiveFromMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tariff map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tariff(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      fixedFee: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fixed_fee'],
      )!,
      effectiveFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}effective_from'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TariffsTable createAlias(String alias) {
    return $TariffsTable(attachedDatabase, alias);
  }
}

class Tariff extends DataClass implements Insertable<Tariff> {
  final int id;
  final String name;
  final double fixedFee;
  final DateTime effectiveFrom;
  final bool isActive;
  final DateTime createdAt;
  const Tariff({
    required this.id,
    required this.name,
    required this.fixedFee,
    required this.effectiveFrom,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['fixed_fee'] = Variable<double>(fixedFee);
    map['effective_from'] = Variable<DateTime>(effectiveFrom);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TariffsCompanion toCompanion(bool nullToAbsent) {
    return TariffsCompanion(
      id: Value(id),
      name: Value(name),
      fixedFee: Value(fixedFee),
      effectiveFrom: Value(effectiveFrom),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory Tariff.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tariff(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      fixedFee: serializer.fromJson<double>(json['fixedFee']),
      effectiveFrom: serializer.fromJson<DateTime>(json['effectiveFrom']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'fixedFee': serializer.toJson<double>(fixedFee),
      'effectiveFrom': serializer.toJson<DateTime>(effectiveFrom),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Tariff copyWith({
    int? id,
    String? name,
    double? fixedFee,
    DateTime? effectiveFrom,
    bool? isActive,
    DateTime? createdAt,
  }) => Tariff(
    id: id ?? this.id,
    name: name ?? this.name,
    fixedFee: fixedFee ?? this.fixedFee,
    effectiveFrom: effectiveFrom ?? this.effectiveFrom,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  Tariff copyWithCompanion(TariffsCompanion data) {
    return Tariff(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      fixedFee: data.fixedFee.present ? data.fixedFee.value : this.fixedFee,
      effectiveFrom: data.effectiveFrom.present
          ? data.effectiveFrom.value
          : this.effectiveFrom,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tariff(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fixedFee: $fixedFee, ')
          ..write('effectiveFrom: $effectiveFrom, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, fixedFee, effectiveFrom, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tariff &&
          other.id == this.id &&
          other.name == this.name &&
          other.fixedFee == this.fixedFee &&
          other.effectiveFrom == this.effectiveFrom &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class TariffsCompanion extends UpdateCompanion<Tariff> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> fixedFee;
  final Value<DateTime> effectiveFrom;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const TariffsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.fixedFee = const Value.absent(),
    this.effectiveFrom = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TariffsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.fixedFee = const Value.absent(),
    required DateTime effectiveFrom,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       effectiveFrom = Value(effectiveFrom);
  static Insertable<Tariff> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? fixedFee,
    Expression<DateTime>? effectiveFrom,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (fixedFee != null) 'fixed_fee': fixedFee,
      if (effectiveFrom != null) 'effective_from': effectiveFrom,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TariffsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? fixedFee,
    Value<DateTime>? effectiveFrom,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return TariffsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      fixedFee: fixedFee ?? this.fixedFee,
      effectiveFrom: effectiveFrom ?? this.effectiveFrom,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (fixedFee.present) {
      map['fixed_fee'] = Variable<double>(fixedFee.value);
    }
    if (effectiveFrom.present) {
      map['effective_from'] = Variable<DateTime>(effectiveFrom.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TariffsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('fixedFee: $fixedFee, ')
          ..write('effectiveFrom: $effectiveFrom, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TariffSlabsTable extends TariffSlabs
    with TableInfo<$TariffSlabsTable, TariffSlab> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TariffSlabsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _tariffIdMeta = const VerificationMeta(
    'tariffId',
  );
  @override
  late final GeneratedColumn<int> tariffId = GeneratedColumn<int>(
    'tariff_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tariffs (id)',
    ),
  );
  static const VerificationMeta _startUnitMeta = const VerificationMeta(
    'startUnit',
  );
  @override
  late final GeneratedColumn<int> startUnit = GeneratedColumn<int>(
    'start_unit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endUnitMeta = const VerificationMeta(
    'endUnit',
  );
  @override
  late final GeneratedColumn<int> endUnit = GeneratedColumn<int>(
    'end_unit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tariffId,
    startUnit,
    endUnit,
    unitPrice,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tariff_slabs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TariffSlab> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tariff_id')) {
      context.handle(
        _tariffIdMeta,
        tariffId.isAcceptableOrUnknown(data['tariff_id']!, _tariffIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tariffIdMeta);
    }
    if (data.containsKey('start_unit')) {
      context.handle(
        _startUnitMeta,
        startUnit.isAcceptableOrUnknown(data['start_unit']!, _startUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_startUnitMeta);
    }
    if (data.containsKey('end_unit')) {
      context.handle(
        _endUnitMeta,
        endUnit.isAcceptableOrUnknown(data['end_unit']!, _endUnitMeta),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TariffSlab map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TariffSlab(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tariffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tariff_id'],
      )!,
      startUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_unit'],
      )!,
      endUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_unit'],
      ),
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
    );
  }

  @override
  $TariffSlabsTable createAlias(String alias) {
    return $TariffSlabsTable(attachedDatabase, alias);
  }
}

class TariffSlab extends DataClass implements Insertable<TariffSlab> {
  final int id;
  final int tariffId;
  final int startUnit;
  final int? endUnit;
  final double unitPrice;
  const TariffSlab({
    required this.id,
    required this.tariffId,
    required this.startUnit,
    this.endUnit,
    required this.unitPrice,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tariff_id'] = Variable<int>(tariffId);
    map['start_unit'] = Variable<int>(startUnit);
    if (!nullToAbsent || endUnit != null) {
      map['end_unit'] = Variable<int>(endUnit);
    }
    map['unit_price'] = Variable<double>(unitPrice);
    return map;
  }

  TariffSlabsCompanion toCompanion(bool nullToAbsent) {
    return TariffSlabsCompanion(
      id: Value(id),
      tariffId: Value(tariffId),
      startUnit: Value(startUnit),
      endUnit: endUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(endUnit),
      unitPrice: Value(unitPrice),
    );
  }

  factory TariffSlab.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TariffSlab(
      id: serializer.fromJson<int>(json['id']),
      tariffId: serializer.fromJson<int>(json['tariffId']),
      startUnit: serializer.fromJson<int>(json['startUnit']),
      endUnit: serializer.fromJson<int?>(json['endUnit']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tariffId': serializer.toJson<int>(tariffId),
      'startUnit': serializer.toJson<int>(startUnit),
      'endUnit': serializer.toJson<int?>(endUnit),
      'unitPrice': serializer.toJson<double>(unitPrice),
    };
  }

  TariffSlab copyWith({
    int? id,
    int? tariffId,
    int? startUnit,
    Value<int?> endUnit = const Value.absent(),
    double? unitPrice,
  }) => TariffSlab(
    id: id ?? this.id,
    tariffId: tariffId ?? this.tariffId,
    startUnit: startUnit ?? this.startUnit,
    endUnit: endUnit.present ? endUnit.value : this.endUnit,
    unitPrice: unitPrice ?? this.unitPrice,
  );
  TariffSlab copyWithCompanion(TariffSlabsCompanion data) {
    return TariffSlab(
      id: data.id.present ? data.id.value : this.id,
      tariffId: data.tariffId.present ? data.tariffId.value : this.tariffId,
      startUnit: data.startUnit.present ? data.startUnit.value : this.startUnit,
      endUnit: data.endUnit.present ? data.endUnit.value : this.endUnit,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TariffSlab(')
          ..write('id: $id, ')
          ..write('tariffId: $tariffId, ')
          ..write('startUnit: $startUnit, ')
          ..write('endUnit: $endUnit, ')
          ..write('unitPrice: $unitPrice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tariffId, startUnit, endUnit, unitPrice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TariffSlab &&
          other.id == this.id &&
          other.tariffId == this.tariffId &&
          other.startUnit == this.startUnit &&
          other.endUnit == this.endUnit &&
          other.unitPrice == this.unitPrice);
}

class TariffSlabsCompanion extends UpdateCompanion<TariffSlab> {
  final Value<int> id;
  final Value<int> tariffId;
  final Value<int> startUnit;
  final Value<int?> endUnit;
  final Value<double> unitPrice;
  const TariffSlabsCompanion({
    this.id = const Value.absent(),
    this.tariffId = const Value.absent(),
    this.startUnit = const Value.absent(),
    this.endUnit = const Value.absent(),
    this.unitPrice = const Value.absent(),
  });
  TariffSlabsCompanion.insert({
    this.id = const Value.absent(),
    required int tariffId,
    required int startUnit,
    this.endUnit = const Value.absent(),
    required double unitPrice,
  }) : tariffId = Value(tariffId),
       startUnit = Value(startUnit),
       unitPrice = Value(unitPrice);
  static Insertable<TariffSlab> custom({
    Expression<int>? id,
    Expression<int>? tariffId,
    Expression<int>? startUnit,
    Expression<int>? endUnit,
    Expression<double>? unitPrice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tariffId != null) 'tariff_id': tariffId,
      if (startUnit != null) 'start_unit': startUnit,
      if (endUnit != null) 'end_unit': endUnit,
      if (unitPrice != null) 'unit_price': unitPrice,
    });
  }

  TariffSlabsCompanion copyWith({
    Value<int>? id,
    Value<int>? tariffId,
    Value<int>? startUnit,
    Value<int?>? endUnit,
    Value<double>? unitPrice,
  }) {
    return TariffSlabsCompanion(
      id: id ?? this.id,
      tariffId: tariffId ?? this.tariffId,
      startUnit: startUnit ?? this.startUnit,
      endUnit: endUnit ?? this.endUnit,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tariffId.present) {
      map['tariff_id'] = Variable<int>(tariffId.value);
    }
    if (startUnit.present) {
      map['start_unit'] = Variable<int>(startUnit.value);
    }
    if (endUnit.present) {
      map['end_unit'] = Variable<int>(endUnit.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TariffSlabsCompanion(')
          ..write('id: $id, ')
          ..write('tariffId: $tariffId, ')
          ..write('startUnit: $startUnit, ')
          ..write('endUnit: $endUnit, ')
          ..write('unitPrice: $unitPrice')
          ..write(')'))
        .toString();
  }
}

class $BillingCyclesTable extends BillingCycles
    with TableInfo<$BillingCyclesTable, BillingCycle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BillingCyclesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
    'month',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('open'),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
  static const VerificationMeta _closedAtMeta = const VerificationMeta(
    'closedAt',
  );
  @override
  late final GeneratedColumn<DateTime> closedAt = GeneratedColumn<DateTime>(
    'closed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    year,
    month,
    status,
    startDate,
    endDate,
    createdAt,
    closedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'billing_cycles';
  @override
  VerificationContext validateIntegrity(
    Insertable<BillingCycle> instance, {
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
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
        _monthMeta,
        month.isAcceptableOrUnknown(data['month']!, _monthMeta),
      );
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('closed_at')) {
      context.handle(
        _closedAtMeta,
        closedAt.isAcceptableOrUnknown(data['closed_at']!, _closedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {year, month},
  ];
  @override
  BillingCycle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BillingCycle(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      month: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}month'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      closedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}closed_at'],
      ),
    );
  }

  @override
  $BillingCyclesTable createAlias(String alias) {
    return $BillingCyclesTable(attachedDatabase, alias);
  }
}

class BillingCycle extends DataClass implements Insertable<BillingCycle> {
  final int id;
  final String name;
  final int year;
  final int month;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime createdAt;
  final DateTime? closedAt;
  const BillingCycle({
    required this.id,
    required this.name,
    required this.year,
    required this.month,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    this.closedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['year'] = Variable<int>(year);
    map['month'] = Variable<int>(month);
    map['status'] = Variable<String>(status);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || closedAt != null) {
      map['closed_at'] = Variable<DateTime>(closedAt);
    }
    return map;
  }

  BillingCyclesCompanion toCompanion(bool nullToAbsent) {
    return BillingCyclesCompanion(
      id: Value(id),
      name: Value(name),
      year: Value(year),
      month: Value(month),
      status: Value(status),
      startDate: Value(startDate),
      endDate: Value(endDate),
      createdAt: Value(createdAt),
      closedAt: closedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(closedAt),
    );
  }

  factory BillingCycle.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BillingCycle(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      year: serializer.fromJson<int>(json['year']),
      month: serializer.fromJson<int>(json['month']),
      status: serializer.fromJson<String>(json['status']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      closedAt: serializer.fromJson<DateTime?>(json['closedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'year': serializer.toJson<int>(year),
      'month': serializer.toJson<int>(month),
      'status': serializer.toJson<String>(status),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'closedAt': serializer.toJson<DateTime?>(closedAt),
    };
  }

  BillingCycle copyWith({
    int? id,
    String? name,
    int? year,
    int? month,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    Value<DateTime?> closedAt = const Value.absent(),
  }) => BillingCycle(
    id: id ?? this.id,
    name: name ?? this.name,
    year: year ?? this.year,
    month: month ?? this.month,
    status: status ?? this.status,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    createdAt: createdAt ?? this.createdAt,
    closedAt: closedAt.present ? closedAt.value : this.closedAt,
  );
  BillingCycle copyWithCompanion(BillingCyclesCompanion data) {
    return BillingCycle(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      year: data.year.present ? data.year.value : this.year,
      month: data.month.present ? data.month.value : this.month,
      status: data.status.present ? data.status.value : this.status,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      closedAt: data.closedAt.present ? data.closedAt.value : this.closedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BillingCycle(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    year,
    month,
    status,
    startDate,
    endDate,
    createdAt,
    closedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BillingCycle &&
          other.id == this.id &&
          other.name == this.name &&
          other.year == this.year &&
          other.month == this.month &&
          other.status == this.status &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdAt == this.createdAt &&
          other.closedAt == this.closedAt);
}

class BillingCyclesCompanion extends UpdateCompanion<BillingCycle> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> year;
  final Value<int> month;
  final Value<String> status;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> closedAt;
  const BillingCyclesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.year = const Value.absent(),
    this.month = const Value.absent(),
    this.status = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
  });
  BillingCyclesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int year,
    required int month,
    this.status = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.createdAt = const Value.absent(),
    this.closedAt = const Value.absent(),
  }) : name = Value(name),
       year = Value(year),
       month = Value(month),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<BillingCycle> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? year,
    Expression<int>? month,
    Expression<String>? status,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? closedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (year != null) 'year': year,
      if (month != null) 'month': month,
      if (status != null) 'status': status,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdAt != null) 'created_at': createdAt,
      if (closedAt != null) 'closed_at': closedAt,
    });
  }

  BillingCyclesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? year,
    Value<int>? month,
    Value<String>? status,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? closedAt,
  }) {
    return BillingCyclesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      year: year ?? this.year,
      month: month ?? this.month,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      closedAt: closedAt ?? this.closedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (closedAt.present) {
      map['closed_at'] = Variable<DateTime>(closedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BillingCyclesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('year: $year, ')
          ..write('month: $month, ')
          ..write('status: $status, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('closedAt: $closedAt')
          ..write(')'))
        .toString();
  }
}

class $InvoicesTable extends Invoices with TableInfo<$InvoicesTable, Invoice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoicesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceNoMeta = const VerificationMeta(
    'invoiceNo',
  );
  @override
  late final GeneratedColumn<String> invoiceNo = GeneratedColumn<String>(
    'invoice_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _subscriberIdMeta = const VerificationMeta(
    'subscriberId',
  );
  @override
  late final GeneratedColumn<int> subscriberId = GeneratedColumn<int>(
    'subscriber_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscribers (id)',
    ),
  );
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES billing_cycles (id)',
    ),
  );
  static const VerificationMeta _tariffIdMeta = const VerificationMeta(
    'tariffId',
  );
  @override
  late final GeneratedColumn<int> tariffId = GeneratedColumn<int>(
    'tariff_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tariffs (id)',
    ),
  );
  static const VerificationMeta _meterIdMeta = const VerificationMeta(
    'meterId',
  );
  @override
  late final GeneratedColumn<int> meterId = GeneratedColumn<int>(
    'meter_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meters (id)',
    ),
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<int> units = GeneratedColumn<int>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fixedFeeAmountMeta = const VerificationMeta(
    'fixedFeeAmount',
  );
  @override
  late final GeneratedColumn<double> fixedFeeAmount = GeneratedColumn<double>(
    'fixed_fee_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _consumptionAmountMeta = const VerificationMeta(
    'consumptionAmount',
  );
  @override
  late final GeneratedColumn<double> consumptionAmount =
      GeneratedColumn<double>(
        'consumption_amount',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _adjustmentsAmountMeta = const VerificationMeta(
    'adjustmentsAmount',
  );
  @override
  late final GeneratedColumn<double> adjustmentsAmount =
      GeneratedColumn<double>(
        'adjustments_amount',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0.0),
      );
  static const VerificationMeta _arrearsAmountMeta = const VerificationMeta(
    'arrearsAmount',
  );
  @override
  late final GeneratedColumn<double> arrearsAmount = GeneratedColumn<double>(
    'arrears_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
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
  static const VerificationMeta _paidAmountMeta = const VerificationMeta(
    'paidAmount',
  );
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
    'paid_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('unpaid'),
  );
  static const VerificationMeta _issuedAtMeta = const VerificationMeta(
    'issuedAt',
  );
  @override
  late final GeneratedColumn<DateTime> issuedAt = GeneratedColumn<DateTime>(
    'issued_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceNo,
    subscriberId,
    cycleId,
    tariffId,
    meterId,
    units,
    fixedFeeAmount,
    consumptionAmount,
    adjustmentsAmount,
    arrearsAmount,
    totalAmount,
    paidAmount,
    status,
    issuedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Invoice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_no')) {
      context.handle(
        _invoiceNoMeta,
        invoiceNo.isAcceptableOrUnknown(data['invoice_no']!, _invoiceNoMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceNoMeta);
    }
    if (data.containsKey('subscriber_id')) {
      context.handle(
        _subscriberIdMeta,
        subscriberId.isAcceptableOrUnknown(
          data['subscriber_id']!,
          _subscriberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriberIdMeta);
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('tariff_id')) {
      context.handle(
        _tariffIdMeta,
        tariffId.isAcceptableOrUnknown(data['tariff_id']!, _tariffIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tariffIdMeta);
    }
    if (data.containsKey('meter_id')) {
      context.handle(
        _meterIdMeta,
        meterId.isAcceptableOrUnknown(data['meter_id']!, _meterIdMeta),
      );
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('fixed_fee_amount')) {
      context.handle(
        _fixedFeeAmountMeta,
        fixedFeeAmount.isAcceptableOrUnknown(
          data['fixed_fee_amount']!,
          _fixedFeeAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fixedFeeAmountMeta);
    }
    if (data.containsKey('consumption_amount')) {
      context.handle(
        _consumptionAmountMeta,
        consumptionAmount.isAcceptableOrUnknown(
          data['consumption_amount']!,
          _consumptionAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_consumptionAmountMeta);
    }
    if (data.containsKey('adjustments_amount')) {
      context.handle(
        _adjustmentsAmountMeta,
        adjustmentsAmount.isAcceptableOrUnknown(
          data['adjustments_amount']!,
          _adjustmentsAmountMeta,
        ),
      );
    }
    if (data.containsKey('arrears_amount')) {
      context.handle(
        _arrearsAmountMeta,
        arrearsAmount.isAcceptableOrUnknown(
          data['arrears_amount']!,
          _arrearsAmountMeta,
        ),
      );
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
    if (data.containsKey('paid_amount')) {
      context.handle(
        _paidAmountMeta,
        paidAmount.isAcceptableOrUnknown(data['paid_amount']!, _paidAmountMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('issued_at')) {
      context.handle(
        _issuedAtMeta,
        issuedAt.isAcceptableOrUnknown(data['issued_at']!, _issuedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Invoice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Invoice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invoice_no'],
      )!,
      subscriberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscriber_id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      tariffId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tariff_id'],
      )!,
      meterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meter_id'],
      ),
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}units'],
      )!,
      fixedFeeAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fixed_fee_amount'],
      )!,
      consumptionAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}consumption_amount'],
      )!,
      adjustmentsAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}adjustments_amount'],
      )!,
      arrearsAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}arrears_amount'],
      )!,
      totalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_amount'],
      )!,
      paidAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}paid_amount'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      issuedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}issued_at'],
      )!,
    );
  }

  @override
  $InvoicesTable createAlias(String alias) {
    return $InvoicesTable(attachedDatabase, alias);
  }
}

class Invoice extends DataClass implements Insertable<Invoice> {
  final int id;
  final String invoiceNo;
  final int subscriberId;
  final int cycleId;
  final int tariffId;
  final int? meterId;
  final int units;
  final double fixedFeeAmount;
  final double consumptionAmount;
  final double adjustmentsAmount;
  final double arrearsAmount;
  final double totalAmount;
  final double paidAmount;
  final String status;
  final DateTime issuedAt;
  const Invoice({
    required this.id,
    required this.invoiceNo,
    required this.subscriberId,
    required this.cycleId,
    required this.tariffId,
    this.meterId,
    required this.units,
    required this.fixedFeeAmount,
    required this.consumptionAmount,
    required this.adjustmentsAmount,
    required this.arrearsAmount,
    required this.totalAmount,
    required this.paidAmount,
    required this.status,
    required this.issuedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_no'] = Variable<String>(invoiceNo);
    map['subscriber_id'] = Variable<int>(subscriberId);
    map['cycle_id'] = Variable<int>(cycleId);
    map['tariff_id'] = Variable<int>(tariffId);
    if (!nullToAbsent || meterId != null) {
      map['meter_id'] = Variable<int>(meterId);
    }
    map['units'] = Variable<int>(units);
    map['fixed_fee_amount'] = Variable<double>(fixedFeeAmount);
    map['consumption_amount'] = Variable<double>(consumptionAmount);
    map['adjustments_amount'] = Variable<double>(adjustmentsAmount);
    map['arrears_amount'] = Variable<double>(arrearsAmount);
    map['total_amount'] = Variable<double>(totalAmount);
    map['paid_amount'] = Variable<double>(paidAmount);
    map['status'] = Variable<String>(status);
    map['issued_at'] = Variable<DateTime>(issuedAt);
    return map;
  }

  InvoicesCompanion toCompanion(bool nullToAbsent) {
    return InvoicesCompanion(
      id: Value(id),
      invoiceNo: Value(invoiceNo),
      subscriberId: Value(subscriberId),
      cycleId: Value(cycleId),
      tariffId: Value(tariffId),
      meterId: meterId == null && nullToAbsent
          ? const Value.absent()
          : Value(meterId),
      units: Value(units),
      fixedFeeAmount: Value(fixedFeeAmount),
      consumptionAmount: Value(consumptionAmount),
      adjustmentsAmount: Value(adjustmentsAmount),
      arrearsAmount: Value(arrearsAmount),
      totalAmount: Value(totalAmount),
      paidAmount: Value(paidAmount),
      status: Value(status),
      issuedAt: Value(issuedAt),
    );
  }

  factory Invoice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Invoice(
      id: serializer.fromJson<int>(json['id']),
      invoiceNo: serializer.fromJson<String>(json['invoiceNo']),
      subscriberId: serializer.fromJson<int>(json['subscriberId']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      tariffId: serializer.fromJson<int>(json['tariffId']),
      meterId: serializer.fromJson<int?>(json['meterId']),
      units: serializer.fromJson<int>(json['units']),
      fixedFeeAmount: serializer.fromJson<double>(json['fixedFeeAmount']),
      consumptionAmount: serializer.fromJson<double>(json['consumptionAmount']),
      adjustmentsAmount: serializer.fromJson<double>(json['adjustmentsAmount']),
      arrearsAmount: serializer.fromJson<double>(json['arrearsAmount']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      paidAmount: serializer.fromJson<double>(json['paidAmount']),
      status: serializer.fromJson<String>(json['status']),
      issuedAt: serializer.fromJson<DateTime>(json['issuedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceNo': serializer.toJson<String>(invoiceNo),
      'subscriberId': serializer.toJson<int>(subscriberId),
      'cycleId': serializer.toJson<int>(cycleId),
      'tariffId': serializer.toJson<int>(tariffId),
      'meterId': serializer.toJson<int?>(meterId),
      'units': serializer.toJson<int>(units),
      'fixedFeeAmount': serializer.toJson<double>(fixedFeeAmount),
      'consumptionAmount': serializer.toJson<double>(consumptionAmount),
      'adjustmentsAmount': serializer.toJson<double>(adjustmentsAmount),
      'arrearsAmount': serializer.toJson<double>(arrearsAmount),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'paidAmount': serializer.toJson<double>(paidAmount),
      'status': serializer.toJson<String>(status),
      'issuedAt': serializer.toJson<DateTime>(issuedAt),
    };
  }

  Invoice copyWith({
    int? id,
    String? invoiceNo,
    int? subscriberId,
    int? cycleId,
    int? tariffId,
    Value<int?> meterId = const Value.absent(),
    int? units,
    double? fixedFeeAmount,
    double? consumptionAmount,
    double? adjustmentsAmount,
    double? arrearsAmount,
    double? totalAmount,
    double? paidAmount,
    String? status,
    DateTime? issuedAt,
  }) => Invoice(
    id: id ?? this.id,
    invoiceNo: invoiceNo ?? this.invoiceNo,
    subscriberId: subscriberId ?? this.subscriberId,
    cycleId: cycleId ?? this.cycleId,
    tariffId: tariffId ?? this.tariffId,
    meterId: meterId.present ? meterId.value : this.meterId,
    units: units ?? this.units,
    fixedFeeAmount: fixedFeeAmount ?? this.fixedFeeAmount,
    consumptionAmount: consumptionAmount ?? this.consumptionAmount,
    adjustmentsAmount: adjustmentsAmount ?? this.adjustmentsAmount,
    arrearsAmount: arrearsAmount ?? this.arrearsAmount,
    totalAmount: totalAmount ?? this.totalAmount,
    paidAmount: paidAmount ?? this.paidAmount,
    status: status ?? this.status,
    issuedAt: issuedAt ?? this.issuedAt,
  );
  Invoice copyWithCompanion(InvoicesCompanion data) {
    return Invoice(
      id: data.id.present ? data.id.value : this.id,
      invoiceNo: data.invoiceNo.present ? data.invoiceNo.value : this.invoiceNo,
      subscriberId: data.subscriberId.present
          ? data.subscriberId.value
          : this.subscriberId,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      tariffId: data.tariffId.present ? data.tariffId.value : this.tariffId,
      meterId: data.meterId.present ? data.meterId.value : this.meterId,
      units: data.units.present ? data.units.value : this.units,
      fixedFeeAmount: data.fixedFeeAmount.present
          ? data.fixedFeeAmount.value
          : this.fixedFeeAmount,
      consumptionAmount: data.consumptionAmount.present
          ? data.consumptionAmount.value
          : this.consumptionAmount,
      adjustmentsAmount: data.adjustmentsAmount.present
          ? data.adjustmentsAmount.value
          : this.adjustmentsAmount,
      arrearsAmount: data.arrearsAmount.present
          ? data.arrearsAmount.value
          : this.arrearsAmount,
      totalAmount: data.totalAmount.present
          ? data.totalAmount.value
          : this.totalAmount,
      paidAmount: data.paidAmount.present
          ? data.paidAmount.value
          : this.paidAmount,
      status: data.status.present ? data.status.value : this.status,
      issuedAt: data.issuedAt.present ? data.issuedAt.value : this.issuedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Invoice(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('cycleId: $cycleId, ')
          ..write('tariffId: $tariffId, ')
          ..write('meterId: $meterId, ')
          ..write('units: $units, ')
          ..write('fixedFeeAmount: $fixedFeeAmount, ')
          ..write('consumptionAmount: $consumptionAmount, ')
          ..write('adjustmentsAmount: $adjustmentsAmount, ')
          ..write('arrearsAmount: $arrearsAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('status: $status, ')
          ..write('issuedAt: $issuedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceNo,
    subscriberId,
    cycleId,
    tariffId,
    meterId,
    units,
    fixedFeeAmount,
    consumptionAmount,
    adjustmentsAmount,
    arrearsAmount,
    totalAmount,
    paidAmount,
    status,
    issuedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Invoice &&
          other.id == this.id &&
          other.invoiceNo == this.invoiceNo &&
          other.subscriberId == this.subscriberId &&
          other.cycleId == this.cycleId &&
          other.tariffId == this.tariffId &&
          other.meterId == this.meterId &&
          other.units == this.units &&
          other.fixedFeeAmount == this.fixedFeeAmount &&
          other.consumptionAmount == this.consumptionAmount &&
          other.adjustmentsAmount == this.adjustmentsAmount &&
          other.arrearsAmount == this.arrearsAmount &&
          other.totalAmount == this.totalAmount &&
          other.paidAmount == this.paidAmount &&
          other.status == this.status &&
          other.issuedAt == this.issuedAt);
}

class InvoicesCompanion extends UpdateCompanion<Invoice> {
  final Value<int> id;
  final Value<String> invoiceNo;
  final Value<int> subscriberId;
  final Value<int> cycleId;
  final Value<int> tariffId;
  final Value<int?> meterId;
  final Value<int> units;
  final Value<double> fixedFeeAmount;
  final Value<double> consumptionAmount;
  final Value<double> adjustmentsAmount;
  final Value<double> arrearsAmount;
  final Value<double> totalAmount;
  final Value<double> paidAmount;
  final Value<String> status;
  final Value<DateTime> issuedAt;
  const InvoicesCompanion({
    this.id = const Value.absent(),
    this.invoiceNo = const Value.absent(),
    this.subscriberId = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.tariffId = const Value.absent(),
    this.meterId = const Value.absent(),
    this.units = const Value.absent(),
    this.fixedFeeAmount = const Value.absent(),
    this.consumptionAmount = const Value.absent(),
    this.adjustmentsAmount = const Value.absent(),
    this.arrearsAmount = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.issuedAt = const Value.absent(),
  });
  InvoicesCompanion.insert({
    this.id = const Value.absent(),
    required String invoiceNo,
    required int subscriberId,
    required int cycleId,
    required int tariffId,
    this.meterId = const Value.absent(),
    required int units,
    required double fixedFeeAmount,
    required double consumptionAmount,
    this.adjustmentsAmount = const Value.absent(),
    this.arrearsAmount = const Value.absent(),
    required double totalAmount,
    this.paidAmount = const Value.absent(),
    this.status = const Value.absent(),
    this.issuedAt = const Value.absent(),
  }) : invoiceNo = Value(invoiceNo),
       subscriberId = Value(subscriberId),
       cycleId = Value(cycleId),
       tariffId = Value(tariffId),
       units = Value(units),
       fixedFeeAmount = Value(fixedFeeAmount),
       consumptionAmount = Value(consumptionAmount),
       totalAmount = Value(totalAmount);
  static Insertable<Invoice> custom({
    Expression<int>? id,
    Expression<String>? invoiceNo,
    Expression<int>? subscriberId,
    Expression<int>? cycleId,
    Expression<int>? tariffId,
    Expression<int>? meterId,
    Expression<int>? units,
    Expression<double>? fixedFeeAmount,
    Expression<double>? consumptionAmount,
    Expression<double>? adjustmentsAmount,
    Expression<double>? arrearsAmount,
    Expression<double>? totalAmount,
    Expression<double>? paidAmount,
    Expression<String>? status,
    Expression<DateTime>? issuedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceNo != null) 'invoice_no': invoiceNo,
      if (subscriberId != null) 'subscriber_id': subscriberId,
      if (cycleId != null) 'cycle_id': cycleId,
      if (tariffId != null) 'tariff_id': tariffId,
      if (meterId != null) 'meter_id': meterId,
      if (units != null) 'units': units,
      if (fixedFeeAmount != null) 'fixed_fee_amount': fixedFeeAmount,
      if (consumptionAmount != null) 'consumption_amount': consumptionAmount,
      if (adjustmentsAmount != null) 'adjustments_amount': adjustmentsAmount,
      if (arrearsAmount != null) 'arrears_amount': arrearsAmount,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (status != null) 'status': status,
      if (issuedAt != null) 'issued_at': issuedAt,
    });
  }

  InvoicesCompanion copyWith({
    Value<int>? id,
    Value<String>? invoiceNo,
    Value<int>? subscriberId,
    Value<int>? cycleId,
    Value<int>? tariffId,
    Value<int?>? meterId,
    Value<int>? units,
    Value<double>? fixedFeeAmount,
    Value<double>? consumptionAmount,
    Value<double>? adjustmentsAmount,
    Value<double>? arrearsAmount,
    Value<double>? totalAmount,
    Value<double>? paidAmount,
    Value<String>? status,
    Value<DateTime>? issuedAt,
  }) {
    return InvoicesCompanion(
      id: id ?? this.id,
      invoiceNo: invoiceNo ?? this.invoiceNo,
      subscriberId: subscriberId ?? this.subscriberId,
      cycleId: cycleId ?? this.cycleId,
      tariffId: tariffId ?? this.tariffId,
      meterId: meterId ?? this.meterId,
      units: units ?? this.units,
      fixedFeeAmount: fixedFeeAmount ?? this.fixedFeeAmount,
      consumptionAmount: consumptionAmount ?? this.consumptionAmount,
      adjustmentsAmount: adjustmentsAmount ?? this.adjustmentsAmount,
      arrearsAmount: arrearsAmount ?? this.arrearsAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      status: status ?? this.status,
      issuedAt: issuedAt ?? this.issuedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceNo.present) {
      map['invoice_no'] = Variable<String>(invoiceNo.value);
    }
    if (subscriberId.present) {
      map['subscriber_id'] = Variable<int>(subscriberId.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (tariffId.present) {
      map['tariff_id'] = Variable<int>(tariffId.value);
    }
    if (meterId.present) {
      map['meter_id'] = Variable<int>(meterId.value);
    }
    if (units.present) {
      map['units'] = Variable<int>(units.value);
    }
    if (fixedFeeAmount.present) {
      map['fixed_fee_amount'] = Variable<double>(fixedFeeAmount.value);
    }
    if (consumptionAmount.present) {
      map['consumption_amount'] = Variable<double>(consumptionAmount.value);
    }
    if (adjustmentsAmount.present) {
      map['adjustments_amount'] = Variable<double>(adjustmentsAmount.value);
    }
    if (arrearsAmount.present) {
      map['arrears_amount'] = Variable<double>(arrearsAmount.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (issuedAt.present) {
      map['issued_at'] = Variable<DateTime>(issuedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoicesCompanion(')
          ..write('id: $id, ')
          ..write('invoiceNo: $invoiceNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('cycleId: $cycleId, ')
          ..write('tariffId: $tariffId, ')
          ..write('meterId: $meterId, ')
          ..write('units: $units, ')
          ..write('fixedFeeAmount: $fixedFeeAmount, ')
          ..write('consumptionAmount: $consumptionAmount, ')
          ..write('adjustmentsAmount: $adjustmentsAmount, ')
          ..write('arrearsAmount: $arrearsAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('status: $status, ')
          ..write('issuedAt: $issuedAt')
          ..write(')'))
        .toString();
  }
}

class $InvoiceSlabBreakdownsTable extends InvoiceSlabBreakdowns
    with TableInfo<$InvoiceSlabBreakdownsTable, InvoiceSlabBreakdown> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceSlabBreakdownsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _slabStartUnitMeta = const VerificationMeta(
    'slabStartUnit',
  );
  @override
  late final GeneratedColumn<int> slabStartUnit = GeneratedColumn<int>(
    'slab_start_unit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slabEndUnitMeta = const VerificationMeta(
    'slabEndUnit',
  );
  @override
  late final GeneratedColumn<int> slabEndUnit = GeneratedColumn<int>(
    'slab_end_unit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<double> unitPrice = GeneratedColumn<double>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitsInSlabMeta = const VerificationMeta(
    'unitsInSlab',
  );
  @override
  late final GeneratedColumn<int> unitsInSlab = GeneratedColumn<int>(
    'units_in_slab',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoiceId,
    slabStartUnit,
    slabEndUnit,
    unitPrice,
    unitsInSlab,
    amount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_slab_breakdowns';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceSlabBreakdown> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('slab_start_unit')) {
      context.handle(
        _slabStartUnitMeta,
        slabStartUnit.isAcceptableOrUnknown(
          data['slab_start_unit']!,
          _slabStartUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_slabStartUnitMeta);
    }
    if (data.containsKey('slab_end_unit')) {
      context.handle(
        _slabEndUnitMeta,
        slabEndUnit.isAcceptableOrUnknown(
          data['slab_end_unit']!,
          _slabEndUnitMeta,
        ),
      );
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('units_in_slab')) {
      context.handle(
        _unitsInSlabMeta,
        unitsInSlab.isAcceptableOrUnknown(
          data['units_in_slab']!,
          _unitsInSlabMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_unitsInSlabMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceSlabBreakdown map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceSlabBreakdown(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      slabStartUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}slab_start_unit'],
      )!,
      slabEndUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}slab_end_unit'],
      ),
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}unit_price'],
      )!,
      unitsInSlab: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}units_in_slab'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $InvoiceSlabBreakdownsTable createAlias(String alias) {
    return $InvoiceSlabBreakdownsTable(attachedDatabase, alias);
  }
}

class InvoiceSlabBreakdown extends DataClass
    implements Insertable<InvoiceSlabBreakdown> {
  final int id;
  final int invoiceId;
  final int slabStartUnit;
  final int? slabEndUnit;
  final double unitPrice;
  final int unitsInSlab;
  final double amount;
  const InvoiceSlabBreakdown({
    required this.id,
    required this.invoiceId,
    required this.slabStartUnit,
    this.slabEndUnit,
    required this.unitPrice,
    required this.unitsInSlab,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['slab_start_unit'] = Variable<int>(slabStartUnit);
    if (!nullToAbsent || slabEndUnit != null) {
      map['slab_end_unit'] = Variable<int>(slabEndUnit);
    }
    map['unit_price'] = Variable<double>(unitPrice);
    map['units_in_slab'] = Variable<int>(unitsInSlab);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  InvoiceSlabBreakdownsCompanion toCompanion(bool nullToAbsent) {
    return InvoiceSlabBreakdownsCompanion(
      id: Value(id),
      invoiceId: Value(invoiceId),
      slabStartUnit: Value(slabStartUnit),
      slabEndUnit: slabEndUnit == null && nullToAbsent
          ? const Value.absent()
          : Value(slabEndUnit),
      unitPrice: Value(unitPrice),
      unitsInSlab: Value(unitsInSlab),
      amount: Value(amount),
    );
  }

  factory InvoiceSlabBreakdown.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceSlabBreakdown(
      id: serializer.fromJson<int>(json['id']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      slabStartUnit: serializer.fromJson<int>(json['slabStartUnit']),
      slabEndUnit: serializer.fromJson<int?>(json['slabEndUnit']),
      unitPrice: serializer.fromJson<double>(json['unitPrice']),
      unitsInSlab: serializer.fromJson<int>(json['unitsInSlab']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'slabStartUnit': serializer.toJson<int>(slabStartUnit),
      'slabEndUnit': serializer.toJson<int?>(slabEndUnit),
      'unitPrice': serializer.toJson<double>(unitPrice),
      'unitsInSlab': serializer.toJson<int>(unitsInSlab),
      'amount': serializer.toJson<double>(amount),
    };
  }

  InvoiceSlabBreakdown copyWith({
    int? id,
    int? invoiceId,
    int? slabStartUnit,
    Value<int?> slabEndUnit = const Value.absent(),
    double? unitPrice,
    int? unitsInSlab,
    double? amount,
  }) => InvoiceSlabBreakdown(
    id: id ?? this.id,
    invoiceId: invoiceId ?? this.invoiceId,
    slabStartUnit: slabStartUnit ?? this.slabStartUnit,
    slabEndUnit: slabEndUnit.present ? slabEndUnit.value : this.slabEndUnit,
    unitPrice: unitPrice ?? this.unitPrice,
    unitsInSlab: unitsInSlab ?? this.unitsInSlab,
    amount: amount ?? this.amount,
  );
  InvoiceSlabBreakdown copyWithCompanion(InvoiceSlabBreakdownsCompanion data) {
    return InvoiceSlabBreakdown(
      id: data.id.present ? data.id.value : this.id,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      slabStartUnit: data.slabStartUnit.present
          ? data.slabStartUnit.value
          : this.slabStartUnit,
      slabEndUnit: data.slabEndUnit.present
          ? data.slabEndUnit.value
          : this.slabEndUnit,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      unitsInSlab: data.unitsInSlab.present
          ? data.unitsInSlab.value
          : this.unitsInSlab,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceSlabBreakdown(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('slabStartUnit: $slabStartUnit, ')
          ..write('slabEndUnit: $slabEndUnit, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitsInSlab: $unitsInSlab, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoiceId,
    slabStartUnit,
    slabEndUnit,
    unitPrice,
    unitsInSlab,
    amount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceSlabBreakdown &&
          other.id == this.id &&
          other.invoiceId == this.invoiceId &&
          other.slabStartUnit == this.slabStartUnit &&
          other.slabEndUnit == this.slabEndUnit &&
          other.unitPrice == this.unitPrice &&
          other.unitsInSlab == this.unitsInSlab &&
          other.amount == this.amount);
}

class InvoiceSlabBreakdownsCompanion
    extends UpdateCompanion<InvoiceSlabBreakdown> {
  final Value<int> id;
  final Value<int> invoiceId;
  final Value<int> slabStartUnit;
  final Value<int?> slabEndUnit;
  final Value<double> unitPrice;
  final Value<int> unitsInSlab;
  final Value<double> amount;
  const InvoiceSlabBreakdownsCompanion({
    this.id = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.slabStartUnit = const Value.absent(),
    this.slabEndUnit = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.unitsInSlab = const Value.absent(),
    this.amount = const Value.absent(),
  });
  InvoiceSlabBreakdownsCompanion.insert({
    this.id = const Value.absent(),
    required int invoiceId,
    required int slabStartUnit,
    this.slabEndUnit = const Value.absent(),
    required double unitPrice,
    required int unitsInSlab,
    required double amount,
  }) : invoiceId = Value(invoiceId),
       slabStartUnit = Value(slabStartUnit),
       unitPrice = Value(unitPrice),
       unitsInSlab = Value(unitsInSlab),
       amount = Value(amount);
  static Insertable<InvoiceSlabBreakdown> custom({
    Expression<int>? id,
    Expression<int>? invoiceId,
    Expression<int>? slabStartUnit,
    Expression<int>? slabEndUnit,
    Expression<double>? unitPrice,
    Expression<int>? unitsInSlab,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (slabStartUnit != null) 'slab_start_unit': slabStartUnit,
      if (slabEndUnit != null) 'slab_end_unit': slabEndUnit,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (unitsInSlab != null) 'units_in_slab': unitsInSlab,
      if (amount != null) 'amount': amount,
    });
  }

  InvoiceSlabBreakdownsCompanion copyWith({
    Value<int>? id,
    Value<int>? invoiceId,
    Value<int>? slabStartUnit,
    Value<int?>? slabEndUnit,
    Value<double>? unitPrice,
    Value<int>? unitsInSlab,
    Value<double>? amount,
  }) {
    return InvoiceSlabBreakdownsCompanion(
      id: id ?? this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      slabStartUnit: slabStartUnit ?? this.slabStartUnit,
      slabEndUnit: slabEndUnit ?? this.slabEndUnit,
      unitPrice: unitPrice ?? this.unitPrice,
      unitsInSlab: unitsInSlab ?? this.unitsInSlab,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (slabStartUnit.present) {
      map['slab_start_unit'] = Variable<int>(slabStartUnit.value);
    }
    if (slabEndUnit.present) {
      map['slab_end_unit'] = Variable<int>(slabEndUnit.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<double>(unitPrice.value);
    }
    if (unitsInSlab.present) {
      map['units_in_slab'] = Variable<int>(unitsInSlab.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceSlabBreakdownsCompanion(')
          ..write('id: $id, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('slabStartUnit: $slabStartUnit, ')
          ..write('slabEndUnit: $slabEndUnit, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('unitsInSlab: $unitsInSlab, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $MeterReadingsTable extends MeterReadings
    with TableInfo<$MeterReadingsTable, MeterReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MeterReadingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _cycleIdMeta = const VerificationMeta(
    'cycleId',
  );
  @override
  late final GeneratedColumn<int> cycleId = GeneratedColumn<int>(
    'cycle_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES billing_cycles (id)',
    ),
  );
  static const VerificationMeta _meterIdMeta = const VerificationMeta(
    'meterId',
  );
  @override
  late final GeneratedColumn<int> meterId = GeneratedColumn<int>(
    'meter_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES meters (id)',
    ),
  );
  static const VerificationMeta _previousReadingMeta = const VerificationMeta(
    'previousReading',
  );
  @override
  late final GeneratedColumn<int> previousReading = GeneratedColumn<int>(
    'previous_reading',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentReadingMeta = const VerificationMeta(
    'currentReading',
  );
  @override
  late final GeneratedColumn<int> currentReading = GeneratedColumn<int>(
    'current_reading',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<int> units = GeneratedColumn<int>(
    'units',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('normal'),
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cycleId,
    meterId,
    previousReading,
    currentReading,
    units,
    status,
    note,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meter_readings';
  @override
  VerificationContext validateIntegrity(
    Insertable<MeterReading> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cycle_id')) {
      context.handle(
        _cycleIdMeta,
        cycleId.isAcceptableOrUnknown(data['cycle_id']!, _cycleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_cycleIdMeta);
    }
    if (data.containsKey('meter_id')) {
      context.handle(
        _meterIdMeta,
        meterId.isAcceptableOrUnknown(data['meter_id']!, _meterIdMeta),
      );
    } else if (isInserting) {
      context.missing(_meterIdMeta);
    }
    if (data.containsKey('previous_reading')) {
      context.handle(
        _previousReadingMeta,
        previousReading.isAcceptableOrUnknown(
          data['previous_reading']!,
          _previousReadingMeta,
        ),
      );
    }
    if (data.containsKey('current_reading')) {
      context.handle(
        _currentReadingMeta,
        currentReading.isAcceptableOrUnknown(
          data['current_reading']!,
          _currentReadingMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentReadingMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
        _unitsMeta,
        units.isAcceptableOrUnknown(data['units']!, _unitsMeta),
      );
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {cycleId, meterId},
  ];
  @override
  MeterReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MeterReading(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cycleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cycle_id'],
      )!,
      meterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}meter_id'],
      )!,
      previousReading: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}previous_reading'],
      )!,
      currentReading: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_reading'],
      )!,
      units: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}units'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $MeterReadingsTable createAlias(String alias) {
    return $MeterReadingsTable(attachedDatabase, alias);
  }
}

class MeterReading extends DataClass implements Insertable<MeterReading> {
  final int id;
  final int cycleId;
  final int meterId;
  final int previousReading;
  final int currentReading;
  final int units;
  final String status;
  final String? note;
  final DateTime recordedAt;
  const MeterReading({
    required this.id,
    required this.cycleId,
    required this.meterId,
    required this.previousReading,
    required this.currentReading,
    required this.units,
    required this.status,
    this.note,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cycle_id'] = Variable<int>(cycleId);
    map['meter_id'] = Variable<int>(meterId);
    map['previous_reading'] = Variable<int>(previousReading);
    map['current_reading'] = Variable<int>(currentReading);
    map['units'] = Variable<int>(units);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  MeterReadingsCompanion toCompanion(bool nullToAbsent) {
    return MeterReadingsCompanion(
      id: Value(id),
      cycleId: Value(cycleId),
      meterId: Value(meterId),
      previousReading: Value(previousReading),
      currentReading: Value(currentReading),
      units: Value(units),
      status: Value(status),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      recordedAt: Value(recordedAt),
    );
  }

  factory MeterReading.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MeterReading(
      id: serializer.fromJson<int>(json['id']),
      cycleId: serializer.fromJson<int>(json['cycleId']),
      meterId: serializer.fromJson<int>(json['meterId']),
      previousReading: serializer.fromJson<int>(json['previousReading']),
      currentReading: serializer.fromJson<int>(json['currentReading']),
      units: serializer.fromJson<int>(json['units']),
      status: serializer.fromJson<String>(json['status']),
      note: serializer.fromJson<String?>(json['note']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cycleId': serializer.toJson<int>(cycleId),
      'meterId': serializer.toJson<int>(meterId),
      'previousReading': serializer.toJson<int>(previousReading),
      'currentReading': serializer.toJson<int>(currentReading),
      'units': serializer.toJson<int>(units),
      'status': serializer.toJson<String>(status),
      'note': serializer.toJson<String?>(note),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  MeterReading copyWith({
    int? id,
    int? cycleId,
    int? meterId,
    int? previousReading,
    int? currentReading,
    int? units,
    String? status,
    Value<String?> note = const Value.absent(),
    DateTime? recordedAt,
  }) => MeterReading(
    id: id ?? this.id,
    cycleId: cycleId ?? this.cycleId,
    meterId: meterId ?? this.meterId,
    previousReading: previousReading ?? this.previousReading,
    currentReading: currentReading ?? this.currentReading,
    units: units ?? this.units,
    status: status ?? this.status,
    note: note.present ? note.value : this.note,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  MeterReading copyWithCompanion(MeterReadingsCompanion data) {
    return MeterReading(
      id: data.id.present ? data.id.value : this.id,
      cycleId: data.cycleId.present ? data.cycleId.value : this.cycleId,
      meterId: data.meterId.present ? data.meterId.value : this.meterId,
      previousReading: data.previousReading.present
          ? data.previousReading.value
          : this.previousReading,
      currentReading: data.currentReading.present
          ? data.currentReading.value
          : this.currentReading,
      units: data.units.present ? data.units.value : this.units,
      status: data.status.present ? data.status.value : this.status,
      note: data.note.present ? data.note.value : this.note,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MeterReading(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('meterId: $meterId, ')
          ..write('previousReading: $previousReading, ')
          ..write('currentReading: $currentReading, ')
          ..write('units: $units, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cycleId,
    meterId,
    previousReading,
    currentReading,
    units,
    status,
    note,
    recordedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MeterReading &&
          other.id == this.id &&
          other.cycleId == this.cycleId &&
          other.meterId == this.meterId &&
          other.previousReading == this.previousReading &&
          other.currentReading == this.currentReading &&
          other.units == this.units &&
          other.status == this.status &&
          other.note == this.note &&
          other.recordedAt == this.recordedAt);
}

class MeterReadingsCompanion extends UpdateCompanion<MeterReading> {
  final Value<int> id;
  final Value<int> cycleId;
  final Value<int> meterId;
  final Value<int> previousReading;
  final Value<int> currentReading;
  final Value<int> units;
  final Value<String> status;
  final Value<String?> note;
  final Value<DateTime> recordedAt;
  const MeterReadingsCompanion({
    this.id = const Value.absent(),
    this.cycleId = const Value.absent(),
    this.meterId = const Value.absent(),
    this.previousReading = const Value.absent(),
    this.currentReading = const Value.absent(),
    this.units = const Value.absent(),
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.recordedAt = const Value.absent(),
  });
  MeterReadingsCompanion.insert({
    this.id = const Value.absent(),
    required int cycleId,
    required int meterId,
    this.previousReading = const Value.absent(),
    required int currentReading,
    required int units,
    this.status = const Value.absent(),
    this.note = const Value.absent(),
    this.recordedAt = const Value.absent(),
  }) : cycleId = Value(cycleId),
       meterId = Value(meterId),
       currentReading = Value(currentReading),
       units = Value(units);
  static Insertable<MeterReading> custom({
    Expression<int>? id,
    Expression<int>? cycleId,
    Expression<int>? meterId,
    Expression<int>? previousReading,
    Expression<int>? currentReading,
    Expression<int>? units,
    Expression<String>? status,
    Expression<String>? note,
    Expression<DateTime>? recordedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cycleId != null) 'cycle_id': cycleId,
      if (meterId != null) 'meter_id': meterId,
      if (previousReading != null) 'previous_reading': previousReading,
      if (currentReading != null) 'current_reading': currentReading,
      if (units != null) 'units': units,
      if (status != null) 'status': status,
      if (note != null) 'note': note,
      if (recordedAt != null) 'recorded_at': recordedAt,
    });
  }

  MeterReadingsCompanion copyWith({
    Value<int>? id,
    Value<int>? cycleId,
    Value<int>? meterId,
    Value<int>? previousReading,
    Value<int>? currentReading,
    Value<int>? units,
    Value<String>? status,
    Value<String?>? note,
    Value<DateTime>? recordedAt,
  }) {
    return MeterReadingsCompanion(
      id: id ?? this.id,
      cycleId: cycleId ?? this.cycleId,
      meterId: meterId ?? this.meterId,
      previousReading: previousReading ?? this.previousReading,
      currentReading: currentReading ?? this.currentReading,
      units: units ?? this.units,
      status: status ?? this.status,
      note: note ?? this.note,
      recordedAt: recordedAt ?? this.recordedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cycleId.present) {
      map['cycle_id'] = Variable<int>(cycleId.value);
    }
    if (meterId.present) {
      map['meter_id'] = Variable<int>(meterId.value);
    }
    if (previousReading.present) {
      map['previous_reading'] = Variable<int>(previousReading.value);
    }
    if (currentReading.present) {
      map['current_reading'] = Variable<int>(currentReading.value);
    }
    if (units.present) {
      map['units'] = Variable<int>(units.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MeterReadingsCompanion(')
          ..write('id: $id, ')
          ..write('cycleId: $cycleId, ')
          ..write('meterId: $meterId, ')
          ..write('previousReading: $previousReading, ')
          ..write('currentReading: $currentReading, ')
          ..write('units: $units, ')
          ..write('status: $status, ')
          ..write('note: $note, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }
}

class $PaymentsTable extends Payments with TableInfo<$PaymentsTable, Payment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _receiptNoMeta = const VerificationMeta(
    'receiptNo',
  );
  @override
  late final GeneratedColumn<String> receiptNo = GeneratedColumn<String>(
    'receipt_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _subscriberIdMeta = const VerificationMeta(
    'subscriberId',
  );
  @override
  late final GeneratedColumn<int> subscriberId = GeneratedColumn<int>(
    'subscriber_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscribers (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
    'paid_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
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
    requiredDuringInsert: false,
    defaultValue: const Constant('cash'),
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
  static const VerificationMeta _isLockedMeta = const VerificationMeta(
    'isLocked',
  );
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
    'is_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_locked" IN (0, 1))',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    receiptNo,
    subscriberId,
    amount,
    paidAt,
    paymentMethod,
    notes,
    isLocked,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Payment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receipt_no')) {
      context.handle(
        _receiptNoMeta,
        receiptNo.isAcceptableOrUnknown(data['receipt_no']!, _receiptNoMeta),
      );
    } else if (isInserting) {
      context.missing(_receiptNoMeta);
    }
    if (data.containsKey('subscriber_id')) {
      context.handle(
        _subscriberIdMeta,
        subscriberId.isAcceptableOrUnknown(
          data['subscriber_id']!,
          _subscriberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriberIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('paid_at')) {
      context.handle(
        _paidAtMeta,
        paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta),
      );
    }
    if (data.containsKey('payment_method')) {
      context.handle(
        _paymentMethodMeta,
        paymentMethod.isAcceptableOrUnknown(
          data['payment_method']!,
          _paymentMethodMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_locked')) {
      context.handle(
        _isLockedMeta,
        isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Payment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Payment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      receiptNo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_no'],
      )!,
      subscriberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscriber_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      paidAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}paid_at'],
      )!,
      paymentMethod: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payment_method'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_locked'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PaymentsTable createAlias(String alias) {
    return $PaymentsTable(attachedDatabase, alias);
  }
}

class Payment extends DataClass implements Insertable<Payment> {
  final int id;
  final String receiptNo;
  final int subscriberId;
  final double amount;
  final DateTime paidAt;
  final String paymentMethod;
  final String? notes;
  final bool isLocked;
  final DateTime createdAt;
  const Payment({
    required this.id,
    required this.receiptNo,
    required this.subscriberId,
    required this.amount,
    required this.paidAt,
    required this.paymentMethod,
    this.notes,
    required this.isLocked,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_no'] = Variable<String>(receiptNo);
    map['subscriber_id'] = Variable<int>(subscriberId);
    map['amount'] = Variable<double>(amount);
    map['paid_at'] = Variable<DateTime>(paidAt);
    map['payment_method'] = Variable<String>(paymentMethod);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_locked'] = Variable<bool>(isLocked);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PaymentsCompanion toCompanion(bool nullToAbsent) {
    return PaymentsCompanion(
      id: Value(id),
      receiptNo: Value(receiptNo),
      subscriberId: Value(subscriberId),
      amount: Value(amount),
      paidAt: Value(paidAt),
      paymentMethod: Value(paymentMethod),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isLocked: Value(isLocked),
      createdAt: Value(createdAt),
    );
  }

  factory Payment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Payment(
      id: serializer.fromJson<int>(json['id']),
      receiptNo: serializer.fromJson<String>(json['receiptNo']),
      subscriberId: serializer.fromJson<int>(json['subscriberId']),
      amount: serializer.fromJson<double>(json['amount']),
      paidAt: serializer.fromJson<DateTime>(json['paidAt']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      notes: serializer.fromJson<String?>(json['notes']),
      isLocked: serializer.fromJson<bool>(json['isLocked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptNo': serializer.toJson<String>(receiptNo),
      'subscriberId': serializer.toJson<int>(subscriberId),
      'amount': serializer.toJson<double>(amount),
      'paidAt': serializer.toJson<DateTime>(paidAt),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'notes': serializer.toJson<String?>(notes),
      'isLocked': serializer.toJson<bool>(isLocked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Payment copyWith({
    int? id,
    String? receiptNo,
    int? subscriberId,
    double? amount,
    DateTime? paidAt,
    String? paymentMethod,
    Value<String?> notes = const Value.absent(),
    bool? isLocked,
    DateTime? createdAt,
  }) => Payment(
    id: id ?? this.id,
    receiptNo: receiptNo ?? this.receiptNo,
    subscriberId: subscriberId ?? this.subscriberId,
    amount: amount ?? this.amount,
    paidAt: paidAt ?? this.paidAt,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    notes: notes.present ? notes.value : this.notes,
    isLocked: isLocked ?? this.isLocked,
    createdAt: createdAt ?? this.createdAt,
  );
  Payment copyWithCompanion(PaymentsCompanion data) {
    return Payment(
      id: data.id.present ? data.id.value : this.id,
      receiptNo: data.receiptNo.present ? data.receiptNo.value : this.receiptNo,
      subscriberId: data.subscriberId.present
          ? data.subscriberId.value
          : this.subscriberId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paidAt: data.paidAt.present ? data.paidAt.value : this.paidAt,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      notes: data.notes.present ? data.notes.value : this.notes,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Payment(')
          ..write('id: $id, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('amount: $amount, ')
          ..write('paidAt: $paidAt, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    receiptNo,
    subscriberId,
    amount,
    paidAt,
    paymentMethod,
    notes,
    isLocked,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          other.id == this.id &&
          other.receiptNo == this.receiptNo &&
          other.subscriberId == this.subscriberId &&
          other.amount == this.amount &&
          other.paidAt == this.paidAt &&
          other.paymentMethod == this.paymentMethod &&
          other.notes == this.notes &&
          other.isLocked == this.isLocked &&
          other.createdAt == this.createdAt);
}

class PaymentsCompanion extends UpdateCompanion<Payment> {
  final Value<int> id;
  final Value<String> receiptNo;
  final Value<int> subscriberId;
  final Value<double> amount;
  final Value<DateTime> paidAt;
  final Value<String> paymentMethod;
  final Value<String?> notes;
  final Value<bool> isLocked;
  final Value<DateTime> createdAt;
  const PaymentsCompanion({
    this.id = const Value.absent(),
    this.receiptNo = const Value.absent(),
    this.subscriberId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PaymentsCompanion.insert({
    this.id = const Value.absent(),
    required String receiptNo,
    required int subscriberId,
    required double amount,
    this.paidAt = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.notes = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : receiptNo = Value(receiptNo),
       subscriberId = Value(subscriberId),
       amount = Value(amount);
  static Insertable<Payment> custom({
    Expression<int>? id,
    Expression<String>? receiptNo,
    Expression<int>? subscriberId,
    Expression<double>? amount,
    Expression<DateTime>? paidAt,
    Expression<String>? paymentMethod,
    Expression<String>? notes,
    Expression<bool>? isLocked,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptNo != null) 'receipt_no': receiptNo,
      if (subscriberId != null) 'subscriber_id': subscriberId,
      if (amount != null) 'amount': amount,
      if (paidAt != null) 'paid_at': paidAt,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (notes != null) 'notes': notes,
      if (isLocked != null) 'is_locked': isLocked,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PaymentsCompanion copyWith({
    Value<int>? id,
    Value<String>? receiptNo,
    Value<int>? subscriberId,
    Value<double>? amount,
    Value<DateTime>? paidAt,
    Value<String>? paymentMethod,
    Value<String?>? notes,
    Value<bool>? isLocked,
    Value<DateTime>? createdAt,
  }) {
    return PaymentsCompanion(
      id: id ?? this.id,
      receiptNo: receiptNo ?? this.receiptNo,
      subscriberId: subscriberId ?? this.subscriberId,
      amount: amount ?? this.amount,
      paidAt: paidAt ?? this.paidAt,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      notes: notes ?? this.notes,
      isLocked: isLocked ?? this.isLocked,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (receiptNo.present) {
      map['receipt_no'] = Variable<String>(receiptNo.value);
    }
    if (subscriberId.present) {
      map['subscriber_id'] = Variable<int>(subscriberId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentsCompanion(')
          ..write('id: $id, ')
          ..write('receiptNo: $receiptNo, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('amount: $amount, ')
          ..write('paidAt: $paidAt, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('notes: $notes, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PaymentAllocationsTable extends PaymentAllocations
    with TableInfo<$PaymentAllocationsTable, PaymentAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentAllocationsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _paymentIdMeta = const VerificationMeta(
    'paymentId',
  );
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
    'payment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES payments (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, paymentId, invoiceId, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<PaymentAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payment_id')) {
      context.handle(
        _paymentIdMeta,
        paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_paymentIdMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentAllocation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      paymentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}payment_id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $PaymentAllocationsTable createAlias(String alias) {
    return $PaymentAllocationsTable(attachedDatabase, alias);
  }
}

class PaymentAllocation extends DataClass
    implements Insertable<PaymentAllocation> {
  final int id;
  final int paymentId;
  final int invoiceId;
  final double amount;
  const PaymentAllocation({
    required this.id,
    required this.paymentId,
    required this.invoiceId,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payment_id'] = Variable<int>(paymentId);
    map['invoice_id'] = Variable<int>(invoiceId);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  PaymentAllocationsCompanion toCompanion(bool nullToAbsent) {
    return PaymentAllocationsCompanion(
      id: Value(id),
      paymentId: Value(paymentId),
      invoiceId: Value(invoiceId),
      amount: Value(amount),
    );
  }

  factory PaymentAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentAllocation(
      id: serializer.fromJson<int>(json['id']),
      paymentId: serializer.fromJson<int>(json['paymentId']),
      invoiceId: serializer.fromJson<int>(json['invoiceId']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'paymentId': serializer.toJson<int>(paymentId),
      'invoiceId': serializer.toJson<int>(invoiceId),
      'amount': serializer.toJson<double>(amount),
    };
  }

  PaymentAllocation copyWith({
    int? id,
    int? paymentId,
    int? invoiceId,
    double? amount,
  }) => PaymentAllocation(
    id: id ?? this.id,
    paymentId: paymentId ?? this.paymentId,
    invoiceId: invoiceId ?? this.invoiceId,
    amount: amount ?? this.amount,
  );
  PaymentAllocation copyWithCompanion(PaymentAllocationsCompanion data) {
    return PaymentAllocation(
      id: data.id.present ? data.id.value : this.id,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocation(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, paymentId, invoiceId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentAllocation &&
          other.id == this.id &&
          other.paymentId == this.paymentId &&
          other.invoiceId == this.invoiceId &&
          other.amount == this.amount);
}

class PaymentAllocationsCompanion extends UpdateCompanion<PaymentAllocation> {
  final Value<int> id;
  final Value<int> paymentId;
  final Value<int> invoiceId;
  final Value<double> amount;
  const PaymentAllocationsCompanion({
    this.id = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.amount = const Value.absent(),
  });
  PaymentAllocationsCompanion.insert({
    this.id = const Value.absent(),
    required int paymentId,
    required int invoiceId,
    required double amount,
  }) : paymentId = Value(paymentId),
       invoiceId = Value(invoiceId),
       amount = Value(amount);
  static Insertable<PaymentAllocation> custom({
    Expression<int>? id,
    Expression<int>? paymentId,
    Expression<int>? invoiceId,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (paymentId != null) 'payment_id': paymentId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (amount != null) 'amount': amount,
    });
  }

  PaymentAllocationsCompanion copyWith({
    Value<int>? id,
    Value<int>? paymentId,
    Value<int>? invoiceId,
    Value<double>? amount,
  }) {
    return PaymentAllocationsCompanion(
      id: id ?? this.id,
      paymentId: paymentId ?? this.paymentId,
      invoiceId: invoiceId ?? this.invoiceId,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentAllocationsCompanion(')
          ..write('id: $id, ')
          ..write('paymentId: $paymentId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $AdjustmentsTable extends Adjustments
    with TableInfo<$AdjustmentsTable, Adjustment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdjustmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _subscriberIdMeta = const VerificationMeta(
    'subscriberId',
  );
  @override
  late final GeneratedColumn<int> subscriberId = GeneratedColumn<int>(
    'subscriber_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subscribers (id)',
    ),
  );
  static const VerificationMeta _invoiceIdMeta = const VerificationMeta(
    'invoiceId',
  );
  @override
  late final GeneratedColumn<int> invoiceId = GeneratedColumn<int>(
    'invoice_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoices (id)',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
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
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _requestedByMeta = const VerificationMeta(
    'requestedBy',
  );
  @override
  late final GeneratedColumn<int> requestedBy = GeneratedColumn<int>(
    'requested_by',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _approvedByMeta = const VerificationMeta(
    'approvedBy',
  );
  @override
  late final GeneratedColumn<int> approvedBy = GeneratedColumn<int>(
    'approved_by',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _approvedAtMeta = const VerificationMeta(
    'approvedAt',
  );
  @override
  late final GeneratedColumn<DateTime> approvedAt = GeneratedColumn<DateTime>(
    'approved_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subscriberId,
    invoiceId,
    type,
    amount,
    reason,
    status,
    requestedBy,
    approvedBy,
    approvedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'adjustments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Adjustment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subscriber_id')) {
      context.handle(
        _subscriberIdMeta,
        subscriberId.isAcceptableOrUnknown(
          data['subscriber_id']!,
          _subscriberIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriberIdMeta);
    }
    if (data.containsKey('invoice_id')) {
      context.handle(
        _invoiceIdMeta,
        invoiceId.isAcceptableOrUnknown(data['invoice_id']!, _invoiceIdMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('requested_by')) {
      context.handle(
        _requestedByMeta,
        requestedBy.isAcceptableOrUnknown(
          data['requested_by']!,
          _requestedByMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_requestedByMeta);
    }
    if (data.containsKey('approved_by')) {
      context.handle(
        _approvedByMeta,
        approvedBy.isAcceptableOrUnknown(data['approved_by']!, _approvedByMeta),
      );
    }
    if (data.containsKey('approved_at')) {
      context.handle(
        _approvedAtMeta,
        approvedAt.isAcceptableOrUnknown(data['approved_at']!, _approvedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Adjustment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Adjustment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      subscriberId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}subscriber_id'],
      )!,
      invoiceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice_id'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      reason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reason'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      requestedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}requested_by'],
      )!,
      approvedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}approved_by'],
      ),
      approvedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}approved_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AdjustmentsTable createAlias(String alias) {
    return $AdjustmentsTable(attachedDatabase, alias);
  }
}

class Adjustment extends DataClass implements Insertable<Adjustment> {
  final int id;
  final int subscriberId;
  final int? invoiceId;
  final String type;
  final double amount;
  final String reason;
  final String status;
  final int requestedBy;
  final int? approvedBy;
  final DateTime? approvedAt;
  final DateTime createdAt;
  const Adjustment({
    required this.id,
    required this.subscriberId,
    this.invoiceId,
    required this.type,
    required this.amount,
    required this.reason,
    required this.status,
    required this.requestedBy,
    this.approvedBy,
    this.approvedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subscriber_id'] = Variable<int>(subscriberId);
    if (!nullToAbsent || invoiceId != null) {
      map['invoice_id'] = Variable<int>(invoiceId);
    }
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    map['reason'] = Variable<String>(reason);
    map['status'] = Variable<String>(status);
    map['requested_by'] = Variable<int>(requestedBy);
    if (!nullToAbsent || approvedBy != null) {
      map['approved_by'] = Variable<int>(approvedBy);
    }
    if (!nullToAbsent || approvedAt != null) {
      map['approved_at'] = Variable<DateTime>(approvedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AdjustmentsCompanion toCompanion(bool nullToAbsent) {
    return AdjustmentsCompanion(
      id: Value(id),
      subscriberId: Value(subscriberId),
      invoiceId: invoiceId == null && nullToAbsent
          ? const Value.absent()
          : Value(invoiceId),
      type: Value(type),
      amount: Value(amount),
      reason: Value(reason),
      status: Value(status),
      requestedBy: Value(requestedBy),
      approvedBy: approvedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedBy),
      approvedAt: approvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedAt),
      createdAt: Value(createdAt),
    );
  }

  factory Adjustment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Adjustment(
      id: serializer.fromJson<int>(json['id']),
      subscriberId: serializer.fromJson<int>(json['subscriberId']),
      invoiceId: serializer.fromJson<int?>(json['invoiceId']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      reason: serializer.fromJson<String>(json['reason']),
      status: serializer.fromJson<String>(json['status']),
      requestedBy: serializer.fromJson<int>(json['requestedBy']),
      approvedBy: serializer.fromJson<int?>(json['approvedBy']),
      approvedAt: serializer.fromJson<DateTime?>(json['approvedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subscriberId': serializer.toJson<int>(subscriberId),
      'invoiceId': serializer.toJson<int?>(invoiceId),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'reason': serializer.toJson<String>(reason),
      'status': serializer.toJson<String>(status),
      'requestedBy': serializer.toJson<int>(requestedBy),
      'approvedBy': serializer.toJson<int?>(approvedBy),
      'approvedAt': serializer.toJson<DateTime?>(approvedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Adjustment copyWith({
    int? id,
    int? subscriberId,
    Value<int?> invoiceId = const Value.absent(),
    String? type,
    double? amount,
    String? reason,
    String? status,
    int? requestedBy,
    Value<int?> approvedBy = const Value.absent(),
    Value<DateTime?> approvedAt = const Value.absent(),
    DateTime? createdAt,
  }) => Adjustment(
    id: id ?? this.id,
    subscriberId: subscriberId ?? this.subscriberId,
    invoiceId: invoiceId.present ? invoiceId.value : this.invoiceId,
    type: type ?? this.type,
    amount: amount ?? this.amount,
    reason: reason ?? this.reason,
    status: status ?? this.status,
    requestedBy: requestedBy ?? this.requestedBy,
    approvedBy: approvedBy.present ? approvedBy.value : this.approvedBy,
    approvedAt: approvedAt.present ? approvedAt.value : this.approvedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  Adjustment copyWithCompanion(AdjustmentsCompanion data) {
    return Adjustment(
      id: data.id.present ? data.id.value : this.id,
      subscriberId: data.subscriberId.present
          ? data.subscriberId.value
          : this.subscriberId,
      invoiceId: data.invoiceId.present ? data.invoiceId.value : this.invoiceId,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      reason: data.reason.present ? data.reason.value : this.reason,
      status: data.status.present ? data.status.value : this.status,
      requestedBy: data.requestedBy.present
          ? data.requestedBy.value
          : this.requestedBy,
      approvedBy: data.approvedBy.present
          ? data.approvedBy.value
          : this.approvedBy,
      approvedAt: data.approvedAt.present
          ? data.approvedAt.value
          : this.approvedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Adjustment(')
          ..write('id: $id, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('requestedBy: $requestedBy, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('approvedAt: $approvedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subscriberId,
    invoiceId,
    type,
    amount,
    reason,
    status,
    requestedBy,
    approvedBy,
    approvedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Adjustment &&
          other.id == this.id &&
          other.subscriberId == this.subscriberId &&
          other.invoiceId == this.invoiceId &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.reason == this.reason &&
          other.status == this.status &&
          other.requestedBy == this.requestedBy &&
          other.approvedBy == this.approvedBy &&
          other.approvedAt == this.approvedAt &&
          other.createdAt == this.createdAt);
}

class AdjustmentsCompanion extends UpdateCompanion<Adjustment> {
  final Value<int> id;
  final Value<int> subscriberId;
  final Value<int?> invoiceId;
  final Value<String> type;
  final Value<double> amount;
  final Value<String> reason;
  final Value<String> status;
  final Value<int> requestedBy;
  final Value<int?> approvedBy;
  final Value<DateTime?> approvedAt;
  final Value<DateTime> createdAt;
  const AdjustmentsCompanion({
    this.id = const Value.absent(),
    this.subscriberId = const Value.absent(),
    this.invoiceId = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.reason = const Value.absent(),
    this.status = const Value.absent(),
    this.requestedBy = const Value.absent(),
    this.approvedBy = const Value.absent(),
    this.approvedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AdjustmentsCompanion.insert({
    this.id = const Value.absent(),
    required int subscriberId,
    this.invoiceId = const Value.absent(),
    required String type,
    required double amount,
    required String reason,
    this.status = const Value.absent(),
    required int requestedBy,
    this.approvedBy = const Value.absent(),
    this.approvedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : subscriberId = Value(subscriberId),
       type = Value(type),
       amount = Value(amount),
       reason = Value(reason),
       requestedBy = Value(requestedBy);
  static Insertable<Adjustment> custom({
    Expression<int>? id,
    Expression<int>? subscriberId,
    Expression<int>? invoiceId,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? reason,
    Expression<String>? status,
    Expression<int>? requestedBy,
    Expression<int>? approvedBy,
    Expression<DateTime>? approvedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subscriberId != null) 'subscriber_id': subscriberId,
      if (invoiceId != null) 'invoice_id': invoiceId,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (reason != null) 'reason': reason,
      if (status != null) 'status': status,
      if (requestedBy != null) 'requested_by': requestedBy,
      if (approvedBy != null) 'approved_by': approvedBy,
      if (approvedAt != null) 'approved_at': approvedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AdjustmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? subscriberId,
    Value<int?>? invoiceId,
    Value<String>? type,
    Value<double>? amount,
    Value<String>? reason,
    Value<String>? status,
    Value<int>? requestedBy,
    Value<int?>? approvedBy,
    Value<DateTime?>? approvedAt,
    Value<DateTime>? createdAt,
  }) {
    return AdjustmentsCompanion(
      id: id ?? this.id,
      subscriberId: subscriberId ?? this.subscriberId,
      invoiceId: invoiceId ?? this.invoiceId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      requestedBy: requestedBy ?? this.requestedBy,
      approvedBy: approvedBy ?? this.approvedBy,
      approvedAt: approvedAt ?? this.approvedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subscriberId.present) {
      map['subscriber_id'] = Variable<int>(subscriberId.value);
    }
    if (invoiceId.present) {
      map['invoice_id'] = Variable<int>(invoiceId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (requestedBy.present) {
      map['requested_by'] = Variable<int>(requestedBy.value);
    }
    if (approvedBy.present) {
      map['approved_by'] = Variable<int>(approvedBy.value);
    }
    if (approvedAt.present) {
      map['approved_at'] = Variable<DateTime>(approvedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdjustmentsCompanion(')
          ..write('id: $id, ')
          ..write('subscriberId: $subscriberId, ')
          ..write('invoiceId: $invoiceId, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('reason: $reason, ')
          ..write('status: $status, ')
          ..write('requestedBy: $requestedBy, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('approvedAt: $approvedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
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
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    action,
    entityType,
    entityId,
    details,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
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
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
      ),
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final int? userId;
  final String action;
  final String entityType;
  final int? entityId;
  final String? details;
  final DateTime createdAt;
  const AuditLog({
    required this.id,
    this.userId,
    required this.action,
    required this.entityType,
    this.entityId,
    this.details,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    map['action'] = Variable<String>(action);
    map['entity_type'] = Variable<String>(entityType);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<int>(entityId);
    }
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      action: Value(action),
      entityType: Value(entityType),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      createdAt: Value(createdAt),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int?>(json['userId']),
      action: serializer.fromJson<String>(json['action']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int?>(json['entityId']),
      details: serializer.fromJson<String?>(json['details']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int?>(userId),
      'action': serializer.toJson<String>(action),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int?>(entityId),
      'details': serializer.toJson<String?>(details),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditLog copyWith({
    int? id,
    Value<int?> userId = const Value.absent(),
    String? action,
    String? entityType,
    Value<int?> entityId = const Value.absent(),
    Value<String?> details = const Value.absent(),
    DateTime? createdAt,
  }) => AuditLog(
    id: id ?? this.id,
    userId: userId.present ? userId.value : this.userId,
    action: action ?? this.action,
    entityType: entityType ?? this.entityType,
    entityId: entityId.present ? entityId.value : this.entityId,
    details: details.present ? details.value : this.details,
    createdAt: createdAt ?? this.createdAt,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      action: data.action.present ? data.action.value : this.action,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      details: data.details.present ? data.details.value : this.details,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, action, entityType, entityId, details, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.action == this.action &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.details == this.details &&
          other.createdAt == this.createdAt);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<int?> userId;
  final Value<String> action;
  final Value<String> entityType;
  final Value<int?> entityId;
  final Value<String?> details;
  final Value<DateTime> createdAt;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.action = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    required String action,
    required String entityType,
    this.entityId = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : action = Value(action),
       entityType = Value(entityType);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? action,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<String>? details,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (action != null) 'action': action,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (details != null) 'details': details,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<int?>? userId,
    Value<String>? action,
    Value<String>? entityType,
    Value<int?>? entityId,
    Value<String?>? details,
    Value<DateTime>? createdAt,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      action: action ?? this.action,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
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
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('action: $action, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AreasTable areas = $AreasTable(this);
  late final $SubscribersTable subscribers = $SubscribersTable(this);
  late final $MetersTable meters = $MetersTable(this);
  late final $TariffsTable tariffs = $TariffsTable(this);
  late final $TariffSlabsTable tariffSlabs = $TariffSlabsTable(this);
  late final $BillingCyclesTable billingCycles = $BillingCyclesTable(this);
  late final $InvoicesTable invoices = $InvoicesTable(this);
  late final $InvoiceSlabBreakdownsTable invoiceSlabBreakdowns =
      $InvoiceSlabBreakdownsTable(this);
  late final $MeterReadingsTable meterReadings = $MeterReadingsTable(this);
  late final $PaymentsTable payments = $PaymentsTable(this);
  late final $PaymentAllocationsTable paymentAllocations =
      $PaymentAllocationsTable(this);
  late final $AdjustmentsTable adjustments = $AdjustmentsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final ReportsDao reportsDao = ReportsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    areas,
    subscribers,
    meters,
    tariffs,
    tariffSlabs,
    billingCycles,
    invoices,
    invoiceSlabBreakdowns,
    meterReadings,
    payments,
    paymentAllocations,
    adjustments,
    auditLogs,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'invoices',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('invoice_slab_breakdowns', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'payments',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('payment_allocations', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String name,
      required String username,
      required String passwordHash,
      Value<String> role,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> username,
      Value<String> passwordHash,
      Value<String> role,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AuditLogsTable, List<AuditLog>>
  _auditLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.auditLogs,
    aliasName: $_aliasNameGenerator(db.users.id, db.auditLogs.userId),
  );

  $$AuditLogsTableProcessedTableManager get auditLogsRefs {
    final manager = $$AuditLogsTableTableManager(
      $_db,
      $_db.auditLogs,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_auditLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
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

  Expression<bool> auditLogsRefs(
    Expression<bool> Function($$AuditLogsTableFilterComposer f) f,
  ) {
    final $$AuditLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogsTableFilterComposer(
            $db: $db,
            $table: $db.auditLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
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
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
    column: $table.passwordHash,
    builder: (column) => column,
  );

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> auditLogsRefs<T extends Object>(
    Expression<T> Function($$AuditLogsTableAnnotationComposer a) f,
  ) {
    final $$AuditLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.auditLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.auditLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool auditLogsRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> passwordHash = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                username: username,
                passwordHash: passwordHash,
                role: role,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String username,
                required String passwordHash,
                Value<String> role = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                username: username,
                passwordHash: passwordHash,
                role: role,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({auditLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (auditLogsRefs) db.auditLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (auditLogsRefs)
                    await $_getPrefetchedData<User, $UsersTable, AuditLog>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._auditLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).auditLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool auditLogsRefs})
    >;
typedef $$AreasTableCreateCompanionBuilder =
    AreasCompanion Function({Value<int> id, required String name});
typedef $$AreasTableUpdateCompanionBuilder =
    AreasCompanion Function({Value<int> id, Value<String> name});

final class $$AreasTableReferences
    extends BaseReferences<_$AppDatabase, $AreasTable, Area> {
  $$AreasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SubscribersTable, List<Subscriber>>
  _subscribersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.subscribers,
    aliasName: $_aliasNameGenerator(db.areas.id, db.subscribers.areaId),
  );

  $$SubscribersTableProcessedTableManager get subscribersRefs {
    final manager = $$SubscribersTableTableManager(
      $_db,
      $_db.subscribers,
    ).filter((f) => f.areaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_subscribersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AreasTableFilterComposer extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> subscribersRefs(
    Expression<bool> Function($$SubscribersTableFilterComposer f) f,
  ) {
    final $$SubscribersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.areaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableFilterComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AreasTableOrderingComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AreasTableAnnotationComposer
    extends Composer<_$AppDatabase, $AreasTable> {
  $$AreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> subscribersRefs<T extends Object>(
    Expression<T> Function($$SubscribersTableAnnotationComposer a) f,
  ) {
    final $$SubscribersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.areaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableAnnotationComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AreasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AreasTable,
          Area,
          $$AreasTableFilterComposer,
          $$AreasTableOrderingComposer,
          $$AreasTableAnnotationComposer,
          $$AreasTableCreateCompanionBuilder,
          $$AreasTableUpdateCompanionBuilder,
          (Area, $$AreasTableReferences),
          Area,
          PrefetchHooks Function({bool subscribersRefs})
        > {
  $$AreasTableTableManager(_$AppDatabase db, $AreasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => AreasCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  AreasCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AreasTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({subscribersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (subscribersRefs) db.subscribers],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (subscribersRefs)
                    await $_getPrefetchedData<Area, $AreasTable, Subscriber>(
                      currentTable: table,
                      referencedTable: $$AreasTableReferences
                          ._subscribersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AreasTableReferences(db, table, p0).subscribersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.areaId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AreasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AreasTable,
      Area,
      $$AreasTableFilterComposer,
      $$AreasTableOrderingComposer,
      $$AreasTableAnnotationComposer,
      $$AreasTableCreateCompanionBuilder,
      $$AreasTableUpdateCompanionBuilder,
      (Area, $$AreasTableReferences),
      Area,
      PrefetchHooks Function({bool subscribersRefs})
    >;
typedef $$SubscribersTableCreateCompanionBuilder =
    SubscribersCompanion Function({
      Value<int> id,
      required String fullName,
      Value<String?> phone,
      required int areaId,
      Value<String> status,
      Value<String?> address,
      Value<DateTime> createdAt,
    });
typedef $$SubscribersTableUpdateCompanionBuilder =
    SubscribersCompanion Function({
      Value<int> id,
      Value<String> fullName,
      Value<String?> phone,
      Value<int> areaId,
      Value<String> status,
      Value<String?> address,
      Value<DateTime> createdAt,
    });

final class $$SubscribersTableReferences
    extends BaseReferences<_$AppDatabase, $SubscribersTable, Subscriber> {
  $$SubscribersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AreasTable _areaIdTable(_$AppDatabase db) => db.areas.createAlias(
    $_aliasNameGenerator(db.subscribers.areaId, db.areas.id),
  );

  $$AreasTableProcessedTableManager get areaId {
    final $_column = $_itemColumn<int>('area_id')!;

    final manager = $$AreasTableTableManager(
      $_db,
      $_db.areas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_areaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MetersTable, List<Meter>> _metersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.meters,
    aliasName: $_aliasNameGenerator(db.subscribers.id, db.meters.subscriberId),
  );

  $$MetersTableProcessedTableManager get metersRefs {
    final manager = $$MetersTableTableManager(
      $_db,
      $_db.meters,
    ).filter((f) => f.subscriberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_metersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: $_aliasNameGenerator(
      db.subscribers.id,
      db.invoices.subscriberId,
    ),
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.subscriberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentsTable, List<Payment>> _paymentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.payments,
    aliasName: $_aliasNameGenerator(
      db.subscribers.id,
      db.payments.subscriberId,
    ),
  );

  $$PaymentsTableProcessedTableManager get paymentsRefs {
    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.subscriberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_paymentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdjustmentsTable, List<Adjustment>>
  _adjustmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.adjustments,
    aliasName: $_aliasNameGenerator(
      db.subscribers.id,
      db.adjustments.subscriberId,
    ),
  );

  $$AdjustmentsTableProcessedTableManager get adjustmentsRefs {
    final manager = $$AdjustmentsTableTableManager(
      $_db,
      $_db.adjustments,
    ).filter((f) => f.subscriberId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_adjustmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubscribersTableFilterComposer
    extends Composer<_$AppDatabase, $SubscribersTable> {
  $$SubscribersTableFilterComposer({
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

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AreasTableFilterComposer get areaId {
    final $$AreasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableFilterComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> metersRefs(
    Expression<bool> Function($$MetersTableFilterComposer f) f,
  ) {
    final $$MetersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableFilterComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> paymentsRefs(
    Expression<bool> Function($$PaymentsTableFilterComposer f) f,
  ) {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adjustmentsRefs(
    Expression<bool> Function($$AdjustmentsTableFilterComposer f) f,
  ) {
    final $$AdjustmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adjustments,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdjustmentsTableFilterComposer(
            $db: $db,
            $table: $db.adjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubscribersTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscribersTable> {
  $$SubscribersTableOrderingComposer({
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

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AreasTableOrderingComposer get areaId {
    final $$AreasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableOrderingComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubscribersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscribersTable> {
  $$SubscribersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AreasTableAnnotationComposer get areaId {
    final $$AreasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.areaId,
      referencedTable: $db.areas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AreasTableAnnotationComposer(
            $db: $db,
            $table: $db.areas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> metersRefs<T extends Object>(
    Expression<T> Function($$MetersTableAnnotationComposer a) f,
  ) {
    final $$MetersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableAnnotationComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> paymentsRefs<T extends Object>(
    Expression<T> Function($$PaymentsTableAnnotationComposer a) f,
  ) {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> adjustmentsRefs<T extends Object>(
    Expression<T> Function($$AdjustmentsTableAnnotationComposer a) f,
  ) {
    final $$AdjustmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adjustments,
      getReferencedColumn: (t) => t.subscriberId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdjustmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.adjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubscribersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubscribersTable,
          Subscriber,
          $$SubscribersTableFilterComposer,
          $$SubscribersTableOrderingComposer,
          $$SubscribersTableAnnotationComposer,
          $$SubscribersTableCreateCompanionBuilder,
          $$SubscribersTableUpdateCompanionBuilder,
          (Subscriber, $$SubscribersTableReferences),
          Subscriber,
          PrefetchHooks Function({
            bool areaId,
            bool metersRefs,
            bool invoicesRefs,
            bool paymentsRefs,
            bool adjustmentsRefs,
          })
        > {
  $$SubscribersTableTableManager(_$AppDatabase db, $SubscribersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscribersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscribersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscribersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> fullName = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<int> areaId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubscribersCompanion(
                id: id,
                fullName: fullName,
                phone: phone,
                areaId: areaId,
                status: status,
                address: address,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String fullName,
                Value<String?> phone = const Value.absent(),
                required int areaId,
                Value<String> status = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SubscribersCompanion.insert(
                id: id,
                fullName: fullName,
                phone: phone,
                areaId: areaId,
                status: status,
                address: address,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubscribersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                areaId = false,
                metersRefs = false,
                invoicesRefs = false,
                paymentsRefs = false,
                adjustmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (metersRefs) db.meters,
                    if (invoicesRefs) db.invoices,
                    if (paymentsRefs) db.payments,
                    if (adjustmentsRefs) db.adjustments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (areaId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.areaId,
                                    referencedTable:
                                        $$SubscribersTableReferences
                                            ._areaIdTable(db),
                                    referencedColumn:
                                        $$SubscribersTableReferences
                                            ._areaIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (metersRefs)
                        await $_getPrefetchedData<
                          Subscriber,
                          $SubscribersTable,
                          Meter
                        >(
                          currentTable: table,
                          referencedTable: $$SubscribersTableReferences
                              ._metersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscribersTableReferences(
                                db,
                                table,
                                p0,
                              ).metersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (invoicesRefs)
                        await $_getPrefetchedData<
                          Subscriber,
                          $SubscribersTable,
                          Invoice
                        >(
                          currentTable: table,
                          referencedTable: $$SubscribersTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscribersTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentsRefs)
                        await $_getPrefetchedData<
                          Subscriber,
                          $SubscribersTable,
                          Payment
                        >(
                          currentTable: table,
                          referencedTable: $$SubscribersTableReferences
                              ._paymentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscribersTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriberId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (adjustmentsRefs)
                        await $_getPrefetchedData<
                          Subscriber,
                          $SubscribersTable,
                          Adjustment
                        >(
                          currentTable: table,
                          referencedTable: $$SubscribersTableReferences
                              ._adjustmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SubscribersTableReferences(
                                db,
                                table,
                                p0,
                              ).adjustmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.subscriberId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SubscribersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubscribersTable,
      Subscriber,
      $$SubscribersTableFilterComposer,
      $$SubscribersTableOrderingComposer,
      $$SubscribersTableAnnotationComposer,
      $$SubscribersTableCreateCompanionBuilder,
      $$SubscribersTableUpdateCompanionBuilder,
      (Subscriber, $$SubscribersTableReferences),
      Subscriber,
      PrefetchHooks Function({
        bool areaId,
        bool metersRefs,
        bool invoicesRefs,
        bool paymentsRefs,
        bool adjustmentsRefs,
      })
    >;
typedef $$MetersTableCreateCompanionBuilder =
    MetersCompanion Function({
      Value<int> id,
      required String meterNo,
      Value<int?> subscriberId,
      Value<String> status,
      Value<DateTime> installedAt,
      Value<DateTime?> lastReadingDate,
    });
typedef $$MetersTableUpdateCompanionBuilder =
    MetersCompanion Function({
      Value<int> id,
      Value<String> meterNo,
      Value<int?> subscriberId,
      Value<String> status,
      Value<DateTime> installedAt,
      Value<DateTime?> lastReadingDate,
    });

final class $$MetersTableReferences
    extends BaseReferences<_$AppDatabase, $MetersTable, Meter> {
  $$MetersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubscribersTable _subscriberIdTable(_$AppDatabase db) =>
      db.subscribers.createAlias(
        $_aliasNameGenerator(db.meters.subscriberId, db.subscribers.id),
      );

  $$SubscribersTableProcessedTableManager? get subscriberId {
    final $_column = $_itemColumn<int>('subscriber_id');
    if ($_column == null) return null;
    final manager = $$SubscribersTableTableManager(
      $_db,
      $_db.subscribers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: $_aliasNameGenerator(db.meters.id, db.invoices.meterId),
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.meterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MeterReadingsTable, List<MeterReading>>
  _meterReadingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.meterReadings,
    aliasName: $_aliasNameGenerator(db.meters.id, db.meterReadings.meterId),
  );

  $$MeterReadingsTableProcessedTableManager get meterReadingsRefs {
    final manager = $$MeterReadingsTableTableManager(
      $_db,
      $_db.meterReadings,
    ).filter((f) => f.meterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_meterReadingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MetersTableFilterComposer
    extends Composer<_$AppDatabase, $MetersTable> {
  $$MetersTableFilterComposer({
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

  ColumnFilters<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReadingDate => $composableBuilder(
    column: $table.lastReadingDate,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscribersTableFilterComposer get subscriberId {
    final $$SubscribersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableFilterComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.meterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> meterReadingsRefs(
    Expression<bool> Function($$MeterReadingsTableFilterComposer f) f,
  ) {
    final $$MeterReadingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.meterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableFilterComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MetersTableOrderingComposer
    extends Composer<_$AppDatabase, $MetersTable> {
  $$MetersTableOrderingComposer({
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

  ColumnOrderings<String> get meterNo => $composableBuilder(
    column: $table.meterNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReadingDate => $composableBuilder(
    column: $table.lastReadingDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscribersTableOrderingComposer get subscriberId {
    final $$SubscribersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableOrderingComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MetersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MetersTable> {
  $$MetersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get meterNo =>
      $composableBuilder(column: $table.meterNo, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get installedAt => $composableBuilder(
    column: $table.installedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReadingDate => $composableBuilder(
    column: $table.lastReadingDate,
    builder: (column) => column,
  );

  $$SubscribersTableAnnotationComposer get subscriberId {
    final $$SubscribersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableAnnotationComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.meterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> meterReadingsRefs<T extends Object>(
    Expression<T> Function($$MeterReadingsTableAnnotationComposer a) f,
  ) {
    final $$MeterReadingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.meterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableAnnotationComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MetersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MetersTable,
          Meter,
          $$MetersTableFilterComposer,
          $$MetersTableOrderingComposer,
          $$MetersTableAnnotationComposer,
          $$MetersTableCreateCompanionBuilder,
          $$MetersTableUpdateCompanionBuilder,
          (Meter, $$MetersTableReferences),
          Meter,
          PrefetchHooks Function({
            bool subscriberId,
            bool invoicesRefs,
            bool meterReadingsRefs,
          })
        > {
  $$MetersTableTableManager(_$AppDatabase db, $MetersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> meterNo = const Value.absent(),
                Value<int?> subscriberId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> installedAt = const Value.absent(),
                Value<DateTime?> lastReadingDate = const Value.absent(),
              }) => MetersCompanion(
                id: id,
                meterNo: meterNo,
                subscriberId: subscriberId,
                status: status,
                installedAt: installedAt,
                lastReadingDate: lastReadingDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String meterNo,
                Value<int?> subscriberId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> installedAt = const Value.absent(),
                Value<DateTime?> lastReadingDate = const Value.absent(),
              }) => MetersCompanion.insert(
                id: id,
                meterNo: meterNo,
                subscriberId: subscriberId,
                status: status,
                installedAt: installedAt,
                lastReadingDate: lastReadingDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$MetersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                subscriberId = false,
                invoicesRefs = false,
                meterReadingsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoicesRefs) db.invoices,
                    if (meterReadingsRefs) db.meterReadings,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subscriberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subscriberId,
                                    referencedTable: $$MetersTableReferences
                                        ._subscriberIdTable(db),
                                    referencedColumn: $$MetersTableReferences
                                        ._subscriberIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoicesRefs)
                        await $_getPrefetchedData<Meter, $MetersTable, Invoice>(
                          currentTable: table,
                          referencedTable: $$MetersTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MetersTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.meterId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (meterReadingsRefs)
                        await $_getPrefetchedData<
                          Meter,
                          $MetersTable,
                          MeterReading
                        >(
                          currentTable: table,
                          referencedTable: $$MetersTableReferences
                              ._meterReadingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MetersTableReferences(
                                db,
                                table,
                                p0,
                              ).meterReadingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.meterId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MetersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MetersTable,
      Meter,
      $$MetersTableFilterComposer,
      $$MetersTableOrderingComposer,
      $$MetersTableAnnotationComposer,
      $$MetersTableCreateCompanionBuilder,
      $$MetersTableUpdateCompanionBuilder,
      (Meter, $$MetersTableReferences),
      Meter,
      PrefetchHooks Function({
        bool subscriberId,
        bool invoicesRefs,
        bool meterReadingsRefs,
      })
    >;
typedef $$TariffsTableCreateCompanionBuilder =
    TariffsCompanion Function({
      Value<int> id,
      required String name,
      Value<double> fixedFee,
      required DateTime effectiveFrom,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$TariffsTableUpdateCompanionBuilder =
    TariffsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> fixedFee,
      Value<DateTime> effectiveFrom,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$TariffsTableReferences
    extends BaseReferences<_$AppDatabase, $TariffsTable, Tariff> {
  $$TariffsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TariffSlabsTable, List<TariffSlab>>
  _tariffSlabsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.tariffSlabs,
    aliasName: $_aliasNameGenerator(db.tariffs.id, db.tariffSlabs.tariffId),
  );

  $$TariffSlabsTableProcessedTableManager get tariffSlabsRefs {
    final manager = $$TariffSlabsTableTableManager(
      $_db,
      $_db.tariffSlabs,
    ).filter((f) => f.tariffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tariffSlabsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: $_aliasNameGenerator(db.tariffs.id, db.invoices.tariffId),
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.tariffId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TariffsTableFilterComposer
    extends Composer<_$AppDatabase, $TariffsTable> {
  $$TariffsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fixedFee => $composableBuilder(
    column: $table.fixedFee,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
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

  Expression<bool> tariffSlabsRefs(
    Expression<bool> Function($$TariffSlabsTableFilterComposer f) f,
  ) {
    final $$TariffSlabsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tariffSlabs,
      getReferencedColumn: (t) => t.tariffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffSlabsTableFilterComposer(
            $db: $db,
            $table: $db.tariffSlabs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.tariffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TariffsTableOrderingComposer
    extends Composer<_$AppDatabase, $TariffsTable> {
  $$TariffsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fixedFee => $composableBuilder(
    column: $table.fixedFee,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
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
}

class $$TariffsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TariffsTable> {
  $$TariffsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get fixedFee =>
      $composableBuilder(column: $table.fixedFee, builder: (column) => column);

  GeneratedColumn<DateTime> get effectiveFrom => $composableBuilder(
    column: $table.effectiveFrom,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> tariffSlabsRefs<T extends Object>(
    Expression<T> Function($$TariffSlabsTableAnnotationComposer a) f,
  ) {
    final $$TariffSlabsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tariffSlabs,
      getReferencedColumn: (t) => t.tariffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffSlabsTableAnnotationComposer(
            $db: $db,
            $table: $db.tariffSlabs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.tariffId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TariffsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TariffsTable,
          Tariff,
          $$TariffsTableFilterComposer,
          $$TariffsTableOrderingComposer,
          $$TariffsTableAnnotationComposer,
          $$TariffsTableCreateCompanionBuilder,
          $$TariffsTableUpdateCompanionBuilder,
          (Tariff, $$TariffsTableReferences),
          Tariff,
          PrefetchHooks Function({bool tariffSlabsRefs, bool invoicesRefs})
        > {
  $$TariffsTableTableManager(_$AppDatabase db, $TariffsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TariffsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TariffsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TariffsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> fixedFee = const Value.absent(),
                Value<DateTime> effectiveFrom = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TariffsCompanion(
                id: id,
                name: name,
                fixedFee: fixedFee,
                effectiveFrom: effectiveFrom,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double> fixedFee = const Value.absent(),
                required DateTime effectiveFrom,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TariffsCompanion.insert(
                id: id,
                name: name,
                fixedFee: fixedFee,
                effectiveFrom: effectiveFrom,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TariffsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({tariffSlabsRefs = false, invoicesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (tariffSlabsRefs) db.tariffSlabs,
                    if (invoicesRefs) db.invoices,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (tariffSlabsRefs)
                        await $_getPrefetchedData<
                          Tariff,
                          $TariffsTable,
                          TariffSlab
                        >(
                          currentTable: table,
                          referencedTable: $$TariffsTableReferences
                              ._tariffSlabsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TariffsTableReferences(
                                db,
                                table,
                                p0,
                              ).tariffSlabsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tariffId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (invoicesRefs)
                        await $_getPrefetchedData<
                          Tariff,
                          $TariffsTable,
                          Invoice
                        >(
                          currentTable: table,
                          referencedTable: $$TariffsTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TariffsTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tariffId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TariffsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TariffsTable,
      Tariff,
      $$TariffsTableFilterComposer,
      $$TariffsTableOrderingComposer,
      $$TariffsTableAnnotationComposer,
      $$TariffsTableCreateCompanionBuilder,
      $$TariffsTableUpdateCompanionBuilder,
      (Tariff, $$TariffsTableReferences),
      Tariff,
      PrefetchHooks Function({bool tariffSlabsRefs, bool invoicesRefs})
    >;
typedef $$TariffSlabsTableCreateCompanionBuilder =
    TariffSlabsCompanion Function({
      Value<int> id,
      required int tariffId,
      required int startUnit,
      Value<int?> endUnit,
      required double unitPrice,
    });
typedef $$TariffSlabsTableUpdateCompanionBuilder =
    TariffSlabsCompanion Function({
      Value<int> id,
      Value<int> tariffId,
      Value<int> startUnit,
      Value<int?> endUnit,
      Value<double> unitPrice,
    });

final class $$TariffSlabsTableReferences
    extends BaseReferences<_$AppDatabase, $TariffSlabsTable, TariffSlab> {
  $$TariffSlabsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TariffsTable _tariffIdTable(_$AppDatabase db) =>
      db.tariffs.createAlias(
        $_aliasNameGenerator(db.tariffSlabs.tariffId, db.tariffs.id),
      );

  $$TariffsTableProcessedTableManager get tariffId {
    final $_column = $_itemColumn<int>('tariff_id')!;

    final manager = $$TariffsTableTableManager(
      $_db,
      $_db.tariffs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tariffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TariffSlabsTableFilterComposer
    extends Composer<_$AppDatabase, $TariffSlabsTable> {
  $$TariffSlabsTableFilterComposer({
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

  ColumnFilters<int> get startUnit => $composableBuilder(
    column: $table.startUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endUnit => $composableBuilder(
    column: $table.endUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  $$TariffsTableFilterComposer get tariffId {
    final $$TariffsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableFilterComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TariffSlabsTableOrderingComposer
    extends Composer<_$AppDatabase, $TariffSlabsTable> {
  $$TariffSlabsTableOrderingComposer({
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

  ColumnOrderings<int> get startUnit => $composableBuilder(
    column: $table.startUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endUnit => $composableBuilder(
    column: $table.endUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  $$TariffsTableOrderingComposer get tariffId {
    final $$TariffsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableOrderingComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TariffSlabsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TariffSlabsTable> {
  $$TariffSlabsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startUnit =>
      $composableBuilder(column: $table.startUnit, builder: (column) => column);

  GeneratedColumn<int> get endUnit =>
      $composableBuilder(column: $table.endUnit, builder: (column) => column);

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  $$TariffsTableAnnotationComposer get tariffId {
    final $$TariffsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableAnnotationComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TariffSlabsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TariffSlabsTable,
          TariffSlab,
          $$TariffSlabsTableFilterComposer,
          $$TariffSlabsTableOrderingComposer,
          $$TariffSlabsTableAnnotationComposer,
          $$TariffSlabsTableCreateCompanionBuilder,
          $$TariffSlabsTableUpdateCompanionBuilder,
          (TariffSlab, $$TariffSlabsTableReferences),
          TariffSlab,
          PrefetchHooks Function({bool tariffId})
        > {
  $$TariffSlabsTableTableManager(_$AppDatabase db, $TariffSlabsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TariffSlabsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TariffSlabsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TariffSlabsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tariffId = const Value.absent(),
                Value<int> startUnit = const Value.absent(),
                Value<int?> endUnit = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
              }) => TariffSlabsCompanion(
                id: id,
                tariffId: tariffId,
                startUnit: startUnit,
                endUnit: endUnit,
                unitPrice: unitPrice,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tariffId,
                required int startUnit,
                Value<int?> endUnit = const Value.absent(),
                required double unitPrice,
              }) => TariffSlabsCompanion.insert(
                id: id,
                tariffId: tariffId,
                startUnit: startUnit,
                endUnit: endUnit,
                unitPrice: unitPrice,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TariffSlabsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tariffId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (tariffId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tariffId,
                                referencedTable: $$TariffSlabsTableReferences
                                    ._tariffIdTable(db),
                                referencedColumn: $$TariffSlabsTableReferences
                                    ._tariffIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TariffSlabsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TariffSlabsTable,
      TariffSlab,
      $$TariffSlabsTableFilterComposer,
      $$TariffSlabsTableOrderingComposer,
      $$TariffSlabsTableAnnotationComposer,
      $$TariffSlabsTableCreateCompanionBuilder,
      $$TariffSlabsTableUpdateCompanionBuilder,
      (TariffSlab, $$TariffSlabsTableReferences),
      TariffSlab,
      PrefetchHooks Function({bool tariffId})
    >;
typedef $$BillingCyclesTableCreateCompanionBuilder =
    BillingCyclesCompanion Function({
      Value<int> id,
      required String name,
      required int year,
      required int month,
      Value<String> status,
      required DateTime startDate,
      required DateTime endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> closedAt,
    });
typedef $$BillingCyclesTableUpdateCompanionBuilder =
    BillingCyclesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> year,
      Value<int> month,
      Value<String> status,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> closedAt,
    });

final class $$BillingCyclesTableReferences
    extends BaseReferences<_$AppDatabase, $BillingCyclesTable, BillingCycle> {
  $$BillingCyclesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$InvoicesTable, List<Invoice>> _invoicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.invoices,
    aliasName: $_aliasNameGenerator(db.billingCycles.id, db.invoices.cycleId),
  );

  $$InvoicesTableProcessedTableManager get invoicesRefs {
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MeterReadingsTable, List<MeterReading>>
  _meterReadingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.meterReadings,
    aliasName: $_aliasNameGenerator(
      db.billingCycles.id,
      db.meterReadings.cycleId,
    ),
  );

  $$MeterReadingsTableProcessedTableManager get meterReadingsRefs {
    final manager = $$MeterReadingsTableTableManager(
      $_db,
      $_db.meterReadings,
    ).filter((f) => f.cycleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_meterReadingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BillingCyclesTableFilterComposer
    extends Composer<_$AppDatabase, $BillingCyclesTable> {
  $$BillingCyclesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> invoicesRefs(
    Expression<bool> Function($$InvoicesTableFilterComposer f) f,
  ) {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> meterReadingsRefs(
    Expression<bool> Function($$MeterReadingsTableFilterComposer f) f,
  ) {
    final $$MeterReadingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableFilterComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BillingCyclesTableOrderingComposer
    extends Composer<_$AppDatabase, $BillingCyclesTable> {
  $$BillingCyclesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get month => $composableBuilder(
    column: $table.month,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get closedAt => $composableBuilder(
    column: $table.closedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BillingCyclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BillingCyclesTable> {
  $$BillingCyclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get closedAt =>
      $composableBuilder(column: $table.closedAt, builder: (column) => column);

  Expression<T> invoicesRefs<T extends Object>(
    Expression<T> Function($$InvoicesTableAnnotationComposer a) f,
  ) {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> meterReadingsRefs<T extends Object>(
    Expression<T> Function($$MeterReadingsTableAnnotationComposer a) f,
  ) {
    final $$MeterReadingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.meterReadings,
      getReferencedColumn: (t) => t.cycleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MeterReadingsTableAnnotationComposer(
            $db: $db,
            $table: $db.meterReadings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BillingCyclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BillingCyclesTable,
          BillingCycle,
          $$BillingCyclesTableFilterComposer,
          $$BillingCyclesTableOrderingComposer,
          $$BillingCyclesTableAnnotationComposer,
          $$BillingCyclesTableCreateCompanionBuilder,
          $$BillingCyclesTableUpdateCompanionBuilder,
          (BillingCycle, $$BillingCyclesTableReferences),
          BillingCycle,
          PrefetchHooks Function({bool invoicesRefs, bool meterReadingsRefs})
        > {
  $$BillingCyclesTableTableManager(_$AppDatabase db, $BillingCyclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BillingCyclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BillingCyclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BillingCyclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<int> month = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
              }) => BillingCyclesCompanion(
                id: id,
                name: name,
                year: year,
                month: month,
                status: status,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                closedAt: closedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int year,
                required int month,
                Value<String> status = const Value.absent(),
                required DateTime startDate,
                required DateTime endDate,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> closedAt = const Value.absent(),
              }) => BillingCyclesCompanion.insert(
                id: id,
                name: name,
                year: year,
                month: month,
                status: status,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                closedAt: closedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BillingCyclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({invoicesRefs = false, meterReadingsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoicesRefs) db.invoices,
                    if (meterReadingsRefs) db.meterReadings,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoicesRefs)
                        await $_getPrefetchedData<
                          BillingCycle,
                          $BillingCyclesTable,
                          Invoice
                        >(
                          currentTable: table,
                          referencedTable: $$BillingCyclesTableReferences
                              ._invoicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BillingCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).invoicesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (meterReadingsRefs)
                        await $_getPrefetchedData<
                          BillingCycle,
                          $BillingCyclesTable,
                          MeterReading
                        >(
                          currentTable: table,
                          referencedTable: $$BillingCyclesTableReferences
                              ._meterReadingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BillingCyclesTableReferences(
                                db,
                                table,
                                p0,
                              ).meterReadingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.cycleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BillingCyclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BillingCyclesTable,
      BillingCycle,
      $$BillingCyclesTableFilterComposer,
      $$BillingCyclesTableOrderingComposer,
      $$BillingCyclesTableAnnotationComposer,
      $$BillingCyclesTableCreateCompanionBuilder,
      $$BillingCyclesTableUpdateCompanionBuilder,
      (BillingCycle, $$BillingCyclesTableReferences),
      BillingCycle,
      PrefetchHooks Function({bool invoicesRefs, bool meterReadingsRefs})
    >;
typedef $$InvoicesTableCreateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      required String invoiceNo,
      required int subscriberId,
      required int cycleId,
      required int tariffId,
      Value<int?> meterId,
      required int units,
      required double fixedFeeAmount,
      required double consumptionAmount,
      Value<double> adjustmentsAmount,
      Value<double> arrearsAmount,
      required double totalAmount,
      Value<double> paidAmount,
      Value<String> status,
      Value<DateTime> issuedAt,
    });
typedef $$InvoicesTableUpdateCompanionBuilder =
    InvoicesCompanion Function({
      Value<int> id,
      Value<String> invoiceNo,
      Value<int> subscriberId,
      Value<int> cycleId,
      Value<int> tariffId,
      Value<int?> meterId,
      Value<int> units,
      Value<double> fixedFeeAmount,
      Value<double> consumptionAmount,
      Value<double> adjustmentsAmount,
      Value<double> arrearsAmount,
      Value<double> totalAmount,
      Value<double> paidAmount,
      Value<String> status,
      Value<DateTime> issuedAt,
    });

final class $$InvoicesTableReferences
    extends BaseReferences<_$AppDatabase, $InvoicesTable, Invoice> {
  $$InvoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubscribersTable _subscriberIdTable(_$AppDatabase db) =>
      db.subscribers.createAlias(
        $_aliasNameGenerator(db.invoices.subscriberId, db.subscribers.id),
      );

  $$SubscribersTableProcessedTableManager get subscriberId {
    final $_column = $_itemColumn<int>('subscriber_id')!;

    final manager = $$SubscribersTableTableManager(
      $_db,
      $_db.subscribers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BillingCyclesTable _cycleIdTable(_$AppDatabase db) =>
      db.billingCycles.createAlias(
        $_aliasNameGenerator(db.invoices.cycleId, db.billingCycles.id),
      );

  $$BillingCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$BillingCyclesTableTableManager(
      $_db,
      $_db.billingCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TariffsTable _tariffIdTable(_$AppDatabase db) => db.tariffs
      .createAlias($_aliasNameGenerator(db.invoices.tariffId, db.tariffs.id));

  $$TariffsTableProcessedTableManager get tariffId {
    final $_column = $_itemColumn<int>('tariff_id')!;

    final manager = $$TariffsTableTableManager(
      $_db,
      $_db.tariffs,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tariffIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MetersTable _meterIdTable(_$AppDatabase db) => db.meters.createAlias(
    $_aliasNameGenerator(db.invoices.meterId, db.meters.id),
  );

  $$MetersTableProcessedTableManager? get meterId {
    final $_column = $_itemColumn<int>('meter_id');
    if ($_column == null) return null;
    final manager = $$MetersTableTableManager(
      $_db,
      $_db.meters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_meterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $InvoiceSlabBreakdownsTable,
    List<InvoiceSlabBreakdown>
  >
  _invoiceSlabBreakdownsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.invoiceSlabBreakdowns,
        aliasName: $_aliasNameGenerator(
          db.invoices.id,
          db.invoiceSlabBreakdowns.invoiceId,
        ),
      );

  $$InvoiceSlabBreakdownsTableProcessedTableManager
  get invoiceSlabBreakdownsRefs {
    final manager = $$InvoiceSlabBreakdownsTableTableManager(
      $_db,
      $_db.invoiceSlabBreakdowns,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _invoiceSlabBreakdownsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PaymentAllocationsTable, List<PaymentAllocation>>
  _paymentAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.paymentAllocations,
        aliasName: $_aliasNameGenerator(
          db.invoices.id,
          db.paymentAllocations.invoiceId,
        ),
      );

  $$PaymentAllocationsTableProcessedTableManager get paymentAllocationsRefs {
    final manager = $$PaymentAllocationsTableTableManager(
      $_db,
      $_db.paymentAllocations,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _paymentAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdjustmentsTable, List<Adjustment>>
  _adjustmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.adjustments,
    aliasName: $_aliasNameGenerator(db.invoices.id, db.adjustments.invoiceId),
  );

  $$AdjustmentsTableProcessedTableManager get adjustmentsRefs {
    final manager = $$AdjustmentsTableTableManager(
      $_db,
      $_db.adjustments,
    ).filter((f) => f.invoiceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_adjustmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoicesTableFilterComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableFilterComposer({
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

  ColumnFilters<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fixedFeeAmount => $composableBuilder(
    column: $table.fixedFeeAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get consumptionAmount => $composableBuilder(
    column: $table.consumptionAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get adjustmentsAmount => $composableBuilder(
    column: $table.adjustmentsAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get arrearsAmount => $composableBuilder(
    column: $table.arrearsAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get issuedAt => $composableBuilder(
    column: $table.issuedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscribersTableFilterComposer get subscriberId {
    final $$SubscribersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableFilterComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BillingCyclesTableFilterComposer get cycleId {
    final $$BillingCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableFilterComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TariffsTableFilterComposer get tariffId {
    final $$TariffsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableFilterComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableFilterComposer get meterId {
    final $$MetersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableFilterComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceSlabBreakdownsRefs(
    Expression<bool> Function($$InvoiceSlabBreakdownsTableFilterComposer f) f,
  ) {
    final $$InvoiceSlabBreakdownsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.invoiceSlabBreakdowns,
          getReferencedColumn: (t) => t.invoiceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InvoiceSlabBreakdownsTableFilterComposer(
                $db: $db,
                $table: $db.invoiceSlabBreakdowns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> paymentAllocationsRefs(
    Expression<bool> Function($$PaymentAllocationsTableFilterComposer f) f,
  ) {
    final $$PaymentAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentAllocations,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.paymentAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adjustmentsRefs(
    Expression<bool> Function($$AdjustmentsTableFilterComposer f) f,
  ) {
    final $$AdjustmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adjustments,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdjustmentsTableFilterComposer(
            $db: $db,
            $table: $db.adjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableOrderingComposer({
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

  ColumnOrderings<String> get invoiceNo => $composableBuilder(
    column: $table.invoiceNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fixedFeeAmount => $composableBuilder(
    column: $table.fixedFeeAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get consumptionAmount => $composableBuilder(
    column: $table.consumptionAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get adjustmentsAmount => $composableBuilder(
    column: $table.adjustmentsAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get arrearsAmount => $composableBuilder(
    column: $table.arrearsAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get issuedAt => $composableBuilder(
    column: $table.issuedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscribersTableOrderingComposer get subscriberId {
    final $$SubscribersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableOrderingComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BillingCyclesTableOrderingComposer get cycleId {
    final $$BillingCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TariffsTableOrderingComposer get tariffId {
    final $$TariffsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableOrderingComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableOrderingComposer get meterId {
    final $$MetersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableOrderingComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoicesTable> {
  $$InvoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get invoiceNo =>
      $composableBuilder(column: $table.invoiceNo, builder: (column) => column);

  GeneratedColumn<int> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<double> get fixedFeeAmount => $composableBuilder(
    column: $table.fixedFeeAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get consumptionAmount => $composableBuilder(
    column: $table.consumptionAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get adjustmentsAmount => $composableBuilder(
    column: $table.adjustmentsAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get arrearsAmount => $composableBuilder(
    column: $table.arrearsAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalAmount => $composableBuilder(
    column: $table.totalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get paidAmount => $composableBuilder(
    column: $table.paidAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get issuedAt =>
      $composableBuilder(column: $table.issuedAt, builder: (column) => column);

  $$SubscribersTableAnnotationComposer get subscriberId {
    final $$SubscribersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableAnnotationComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BillingCyclesTableAnnotationComposer get cycleId {
    final $$BillingCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TariffsTableAnnotationComposer get tariffId {
    final $$TariffsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tariffId,
      referencedTable: $db.tariffs,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TariffsTableAnnotationComposer(
            $db: $db,
            $table: $db.tariffs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableAnnotationComposer get meterId {
    final $$MetersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableAnnotationComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceSlabBreakdownsRefs<T extends Object>(
    Expression<T> Function($$InvoiceSlabBreakdownsTableAnnotationComposer a) f,
  ) {
    final $$InvoiceSlabBreakdownsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.invoiceSlabBreakdowns,
          getReferencedColumn: (t) => t.invoiceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InvoiceSlabBreakdownsTableAnnotationComposer(
                $db: $db,
                $table: $db.invoiceSlabBreakdowns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> paymentAllocationsRefs<T extends Object>(
    Expression<T> Function($$PaymentAllocationsTableAnnotationComposer a) f,
  ) {
    final $$PaymentAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.paymentAllocations,
          getReferencedColumn: (t) => t.invoiceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PaymentAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.paymentAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> adjustmentsRefs<T extends Object>(
    Expression<T> Function($$AdjustmentsTableAnnotationComposer a) f,
  ) {
    final $$AdjustmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.adjustments,
      getReferencedColumn: (t) => t.invoiceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdjustmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.adjustments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoicesTable,
          Invoice,
          $$InvoicesTableFilterComposer,
          $$InvoicesTableOrderingComposer,
          $$InvoicesTableAnnotationComposer,
          $$InvoicesTableCreateCompanionBuilder,
          $$InvoicesTableUpdateCompanionBuilder,
          (Invoice, $$InvoicesTableReferences),
          Invoice,
          PrefetchHooks Function({
            bool subscriberId,
            bool cycleId,
            bool tariffId,
            bool meterId,
            bool invoiceSlabBreakdownsRefs,
            bool paymentAllocationsRefs,
            bool adjustmentsRefs,
          })
        > {
  $$InvoicesTableTableManager(_$AppDatabase db, $InvoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> invoiceNo = const Value.absent(),
                Value<int> subscriberId = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<int> tariffId = const Value.absent(),
                Value<int?> meterId = const Value.absent(),
                Value<int> units = const Value.absent(),
                Value<double> fixedFeeAmount = const Value.absent(),
                Value<double> consumptionAmount = const Value.absent(),
                Value<double> adjustmentsAmount = const Value.absent(),
                Value<double> arrearsAmount = const Value.absent(),
                Value<double> totalAmount = const Value.absent(),
                Value<double> paidAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> issuedAt = const Value.absent(),
              }) => InvoicesCompanion(
                id: id,
                invoiceNo: invoiceNo,
                subscriberId: subscriberId,
                cycleId: cycleId,
                tariffId: tariffId,
                meterId: meterId,
                units: units,
                fixedFeeAmount: fixedFeeAmount,
                consumptionAmount: consumptionAmount,
                adjustmentsAmount: adjustmentsAmount,
                arrearsAmount: arrearsAmount,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                status: status,
                issuedAt: issuedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String invoiceNo,
                required int subscriberId,
                required int cycleId,
                required int tariffId,
                Value<int?> meterId = const Value.absent(),
                required int units,
                required double fixedFeeAmount,
                required double consumptionAmount,
                Value<double> adjustmentsAmount = const Value.absent(),
                Value<double> arrearsAmount = const Value.absent(),
                required double totalAmount,
                Value<double> paidAmount = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> issuedAt = const Value.absent(),
              }) => InvoicesCompanion.insert(
                id: id,
                invoiceNo: invoiceNo,
                subscriberId: subscriberId,
                cycleId: cycleId,
                tariffId: tariffId,
                meterId: meterId,
                units: units,
                fixedFeeAmount: fixedFeeAmount,
                consumptionAmount: consumptionAmount,
                adjustmentsAmount: adjustmentsAmount,
                arrearsAmount: arrearsAmount,
                totalAmount: totalAmount,
                paidAmount: paidAmount,
                status: status,
                issuedAt: issuedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                subscriberId = false,
                cycleId = false,
                tariffId = false,
                meterId = false,
                invoiceSlabBreakdownsRefs = false,
                paymentAllocationsRefs = false,
                adjustmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceSlabBreakdownsRefs) db.invoiceSlabBreakdowns,
                    if (paymentAllocationsRefs) db.paymentAllocations,
                    if (adjustmentsRefs) db.adjustments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subscriberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subscriberId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._subscriberIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._subscriberIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (cycleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cycleId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._cycleIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._cycleIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (tariffId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tariffId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._tariffIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._tariffIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (meterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.meterId,
                                    referencedTable: $$InvoicesTableReferences
                                        ._meterIdTable(db),
                                    referencedColumn: $$InvoicesTableReferences
                                        ._meterIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceSlabBreakdownsRefs)
                        await $_getPrefetchedData<
                          Invoice,
                          $InvoicesTable,
                          InvoiceSlabBreakdown
                        >(
                          currentTable: table,
                          referencedTable: $$InvoicesTableReferences
                              ._invoiceSlabBreakdownsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceSlabBreakdownsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (paymentAllocationsRefs)
                        await $_getPrefetchedData<
                          Invoice,
                          $InvoicesTable,
                          PaymentAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$InvoicesTableReferences
                              ._paymentAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (adjustmentsRefs)
                        await $_getPrefetchedData<
                          Invoice,
                          $InvoicesTable,
                          Adjustment
                        >(
                          currentTable: table,
                          referencedTable: $$InvoicesTableReferences
                              ._adjustmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoicesTableReferences(
                                db,
                                table,
                                p0,
                              ).adjustmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoiceId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InvoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoicesTable,
      Invoice,
      $$InvoicesTableFilterComposer,
      $$InvoicesTableOrderingComposer,
      $$InvoicesTableAnnotationComposer,
      $$InvoicesTableCreateCompanionBuilder,
      $$InvoicesTableUpdateCompanionBuilder,
      (Invoice, $$InvoicesTableReferences),
      Invoice,
      PrefetchHooks Function({
        bool subscriberId,
        bool cycleId,
        bool tariffId,
        bool meterId,
        bool invoiceSlabBreakdownsRefs,
        bool paymentAllocationsRefs,
        bool adjustmentsRefs,
      })
    >;
typedef $$InvoiceSlabBreakdownsTableCreateCompanionBuilder =
    InvoiceSlabBreakdownsCompanion Function({
      Value<int> id,
      required int invoiceId,
      required int slabStartUnit,
      Value<int?> slabEndUnit,
      required double unitPrice,
      required int unitsInSlab,
      required double amount,
    });
typedef $$InvoiceSlabBreakdownsTableUpdateCompanionBuilder =
    InvoiceSlabBreakdownsCompanion Function({
      Value<int> id,
      Value<int> invoiceId,
      Value<int> slabStartUnit,
      Value<int?> slabEndUnit,
      Value<double> unitPrice,
      Value<int> unitsInSlab,
      Value<double> amount,
    });

final class $$InvoiceSlabBreakdownsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $InvoiceSlabBreakdownsTable,
          InvoiceSlabBreakdown
        > {
  $$InvoiceSlabBreakdownsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias(
        $_aliasNameGenerator(
          db.invoiceSlabBreakdowns.invoiceId,
          db.invoices.id,
        ),
      );

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceSlabBreakdownsTableFilterComposer
    extends Composer<_$AppDatabase, $InvoiceSlabBreakdownsTable> {
  $$InvoiceSlabBreakdownsTableFilterComposer({
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

  ColumnFilters<int> get slabStartUnit => $composableBuilder(
    column: $table.slabStartUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get slabEndUnit => $composableBuilder(
    column: $table.slabEndUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitsInSlab => $composableBuilder(
    column: $table.unitsInSlab,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceSlabBreakdownsTableOrderingComposer
    extends Composer<_$AppDatabase, $InvoiceSlabBreakdownsTable> {
  $$InvoiceSlabBreakdownsTableOrderingComposer({
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

  ColumnOrderings<int> get slabStartUnit => $composableBuilder(
    column: $table.slabStartUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get slabEndUnit => $composableBuilder(
    column: $table.slabEndUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitsInSlab => $composableBuilder(
    column: $table.unitsInSlab,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceSlabBreakdownsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InvoiceSlabBreakdownsTable> {
  $$InvoiceSlabBreakdownsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get slabStartUnit => $composableBuilder(
    column: $table.slabStartUnit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get slabEndUnit => $composableBuilder(
    column: $table.slabEndUnit,
    builder: (column) => column,
  );

  GeneratedColumn<double> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<int> get unitsInSlab => $composableBuilder(
    column: $table.unitsInSlab,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceSlabBreakdownsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InvoiceSlabBreakdownsTable,
          InvoiceSlabBreakdown,
          $$InvoiceSlabBreakdownsTableFilterComposer,
          $$InvoiceSlabBreakdownsTableOrderingComposer,
          $$InvoiceSlabBreakdownsTableAnnotationComposer,
          $$InvoiceSlabBreakdownsTableCreateCompanionBuilder,
          $$InvoiceSlabBreakdownsTableUpdateCompanionBuilder,
          (InvoiceSlabBreakdown, $$InvoiceSlabBreakdownsTableReferences),
          InvoiceSlabBreakdown,
          PrefetchHooks Function({bool invoiceId})
        > {
  $$InvoiceSlabBreakdownsTableTableManager(
    _$AppDatabase db,
    $InvoiceSlabBreakdownsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceSlabBreakdownsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InvoiceSlabBreakdownsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InvoiceSlabBreakdownsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<int> slabStartUnit = const Value.absent(),
                Value<int?> slabEndUnit = const Value.absent(),
                Value<double> unitPrice = const Value.absent(),
                Value<int> unitsInSlab = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => InvoiceSlabBreakdownsCompanion(
                id: id,
                invoiceId: invoiceId,
                slabStartUnit: slabStartUnit,
                slabEndUnit: slabEndUnit,
                unitPrice: unitPrice,
                unitsInSlab: unitsInSlab,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoiceId,
                required int slabStartUnit,
                Value<int?> slabEndUnit = const Value.absent(),
                required double unitPrice,
                required int unitsInSlab,
                required double amount,
              }) => InvoiceSlabBreakdownsCompanion.insert(
                id: id,
                invoiceId: invoiceId,
                slabStartUnit: slabStartUnit,
                slabEndUnit: slabEndUnit,
                unitPrice: unitPrice,
                unitsInSlab: unitsInSlab,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceSlabBreakdownsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable:
                                    $$InvoiceSlabBreakdownsTableReferences
                                        ._invoiceIdTable(db),
                                referencedColumn:
                                    $$InvoiceSlabBreakdownsTableReferences
                                        ._invoiceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceSlabBreakdownsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InvoiceSlabBreakdownsTable,
      InvoiceSlabBreakdown,
      $$InvoiceSlabBreakdownsTableFilterComposer,
      $$InvoiceSlabBreakdownsTableOrderingComposer,
      $$InvoiceSlabBreakdownsTableAnnotationComposer,
      $$InvoiceSlabBreakdownsTableCreateCompanionBuilder,
      $$InvoiceSlabBreakdownsTableUpdateCompanionBuilder,
      (InvoiceSlabBreakdown, $$InvoiceSlabBreakdownsTableReferences),
      InvoiceSlabBreakdown,
      PrefetchHooks Function({bool invoiceId})
    >;
typedef $$MeterReadingsTableCreateCompanionBuilder =
    MeterReadingsCompanion Function({
      Value<int> id,
      required int cycleId,
      required int meterId,
      Value<int> previousReading,
      required int currentReading,
      required int units,
      Value<String> status,
      Value<String?> note,
      Value<DateTime> recordedAt,
    });
typedef $$MeterReadingsTableUpdateCompanionBuilder =
    MeterReadingsCompanion Function({
      Value<int> id,
      Value<int> cycleId,
      Value<int> meterId,
      Value<int> previousReading,
      Value<int> currentReading,
      Value<int> units,
      Value<String> status,
      Value<String?> note,
      Value<DateTime> recordedAt,
    });

final class $$MeterReadingsTableReferences
    extends BaseReferences<_$AppDatabase, $MeterReadingsTable, MeterReading> {
  $$MeterReadingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BillingCyclesTable _cycleIdTable(_$AppDatabase db) =>
      db.billingCycles.createAlias(
        $_aliasNameGenerator(db.meterReadings.cycleId, db.billingCycles.id),
      );

  $$BillingCyclesTableProcessedTableManager get cycleId {
    final $_column = $_itemColumn<int>('cycle_id')!;

    final manager = $$BillingCyclesTableTableManager(
      $_db,
      $_db.billingCycles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cycleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MetersTable _meterIdTable(_$AppDatabase db) => db.meters.createAlias(
    $_aliasNameGenerator(db.meterReadings.meterId, db.meters.id),
  );

  $$MetersTableProcessedTableManager get meterId {
    final $_column = $_itemColumn<int>('meter_id')!;

    final manager = $$MetersTableTableManager(
      $_db,
      $_db.meters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_meterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MeterReadingsTableFilterComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableFilterComposer({
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

  ColumnFilters<int> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BillingCyclesTableFilterComposer get cycleId {
    final $$BillingCyclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableFilterComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableFilterComposer get meterId {
    final $$MetersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableFilterComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableOrderingComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableOrderingComposer({
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

  ColumnOrderings<int> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get units => $composableBuilder(
    column: $table.units,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BillingCyclesTableOrderingComposer get cycleId {
    final $$BillingCyclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableOrderingComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableOrderingComposer get meterId {
    final $$MetersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableOrderingComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MeterReadingsTable> {
  $$MeterReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get previousReading => $composableBuilder(
    column: $table.previousReading,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentReading => $composableBuilder(
    column: $table.currentReading,
    builder: (column) => column,
  );

  GeneratedColumn<int> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  $$BillingCyclesTableAnnotationComposer get cycleId {
    final $$BillingCyclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cycleId,
      referencedTable: $db.billingCycles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BillingCyclesTableAnnotationComposer(
            $db: $db,
            $table: $db.billingCycles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MetersTableAnnotationComposer get meterId {
    final $$MetersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.meterId,
      referencedTable: $db.meters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MetersTableAnnotationComposer(
            $db: $db,
            $table: $db.meters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MeterReadingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MeterReadingsTable,
          MeterReading,
          $$MeterReadingsTableFilterComposer,
          $$MeterReadingsTableOrderingComposer,
          $$MeterReadingsTableAnnotationComposer,
          $$MeterReadingsTableCreateCompanionBuilder,
          $$MeterReadingsTableUpdateCompanionBuilder,
          (MeterReading, $$MeterReadingsTableReferences),
          MeterReading,
          PrefetchHooks Function({bool cycleId, bool meterId})
        > {
  $$MeterReadingsTableTableManager(_$AppDatabase db, $MeterReadingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MeterReadingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MeterReadingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MeterReadingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cycleId = const Value.absent(),
                Value<int> meterId = const Value.absent(),
                Value<int> previousReading = const Value.absent(),
                Value<int> currentReading = const Value.absent(),
                Value<int> units = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => MeterReadingsCompanion(
                id: id,
                cycleId: cycleId,
                meterId: meterId,
                previousReading: previousReading,
                currentReading: currentReading,
                units: units,
                status: status,
                note: note,
                recordedAt: recordedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cycleId,
                required int meterId,
                Value<int> previousReading = const Value.absent(),
                required int currentReading,
                required int units,
                Value<String> status = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
              }) => MeterReadingsCompanion.insert(
                id: id,
                cycleId: cycleId,
                meterId: meterId,
                previousReading: previousReading,
                currentReading: currentReading,
                units: units,
                status: status,
                note: note,
                recordedAt: recordedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MeterReadingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cycleId = false, meterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (cycleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.cycleId,
                                referencedTable: $$MeterReadingsTableReferences
                                    ._cycleIdTable(db),
                                referencedColumn: $$MeterReadingsTableReferences
                                    ._cycleIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (meterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.meterId,
                                referencedTable: $$MeterReadingsTableReferences
                                    ._meterIdTable(db),
                                referencedColumn: $$MeterReadingsTableReferences
                                    ._meterIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MeterReadingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MeterReadingsTable,
      MeterReading,
      $$MeterReadingsTableFilterComposer,
      $$MeterReadingsTableOrderingComposer,
      $$MeterReadingsTableAnnotationComposer,
      $$MeterReadingsTableCreateCompanionBuilder,
      $$MeterReadingsTableUpdateCompanionBuilder,
      (MeterReading, $$MeterReadingsTableReferences),
      MeterReading,
      PrefetchHooks Function({bool cycleId, bool meterId})
    >;
typedef $$PaymentsTableCreateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      required String receiptNo,
      required int subscriberId,
      required double amount,
      Value<DateTime> paidAt,
      Value<String> paymentMethod,
      Value<String?> notes,
      Value<bool> isLocked,
      Value<DateTime> createdAt,
    });
typedef $$PaymentsTableUpdateCompanionBuilder =
    PaymentsCompanion Function({
      Value<int> id,
      Value<String> receiptNo,
      Value<int> subscriberId,
      Value<double> amount,
      Value<DateTime> paidAt,
      Value<String> paymentMethod,
      Value<String?> notes,
      Value<bool> isLocked,
      Value<DateTime> createdAt,
    });

final class $$PaymentsTableReferences
    extends BaseReferences<_$AppDatabase, $PaymentsTable, Payment> {
  $$PaymentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubscribersTable _subscriberIdTable(_$AppDatabase db) =>
      db.subscribers.createAlias(
        $_aliasNameGenerator(db.payments.subscriberId, db.subscribers.id),
      );

  $$SubscribersTableProcessedTableManager get subscriberId {
    final $_column = $_itemColumn<int>('subscriber_id')!;

    final manager = $$SubscribersTableTableManager(
      $_db,
      $_db.subscribers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PaymentAllocationsTable, List<PaymentAllocation>>
  _paymentAllocationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.paymentAllocations,
        aliasName: $_aliasNameGenerator(
          db.payments.id,
          db.paymentAllocations.paymentId,
        ),
      );

  $$PaymentAllocationsTableProcessedTableManager get paymentAllocationsRefs {
    final manager = $$PaymentAllocationsTableTableManager(
      $_db,
      $_db.paymentAllocations,
    ).filter((f) => f.paymentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _paymentAllocationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PaymentsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableFilterComposer({
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

  ColumnFilters<String> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscribersTableFilterComposer get subscriberId {
    final $$SubscribersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableFilterComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> paymentAllocationsRefs(
    Expression<bool> Function($$PaymentAllocationsTableFilterComposer f) f,
  ) {
    final $$PaymentAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paymentAllocations,
      getReferencedColumn: (t) => t.paymentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.paymentAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PaymentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableOrderingComposer({
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

  ColumnOrderings<String> get receiptNo => $composableBuilder(
    column: $table.receiptNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get paidAt => $composableBuilder(
    column: $table.paidAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscribersTableOrderingComposer get subscriberId {
    final $$SubscribersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableOrderingComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentsTable> {
  $$PaymentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get receiptNo =>
      $composableBuilder(column: $table.receiptNo, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get paidAt =>
      $composableBuilder(column: $table.paidAt, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
    column: $table.paymentMethod,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SubscribersTableAnnotationComposer get subscriberId {
    final $$SubscribersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableAnnotationComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> paymentAllocationsRefs<T extends Object>(
    Expression<T> Function($$PaymentAllocationsTableAnnotationComposer a) f,
  ) {
    final $$PaymentAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.paymentAllocations,
          getReferencedColumn: (t) => t.paymentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PaymentAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.paymentAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PaymentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentsTable,
          Payment,
          $$PaymentsTableFilterComposer,
          $$PaymentsTableOrderingComposer,
          $$PaymentsTableAnnotationComposer,
          $$PaymentsTableCreateCompanionBuilder,
          $$PaymentsTableUpdateCompanionBuilder,
          (Payment, $$PaymentsTableReferences),
          Payment,
          PrefetchHooks Function({
            bool subscriberId,
            bool paymentAllocationsRefs,
          })
        > {
  $$PaymentsTableTableManager(_$AppDatabase db, $PaymentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> receiptNo = const Value.absent(),
                Value<int> subscriberId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> paidAt = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion(
                id: id,
                receiptNo: receiptNo,
                subscriberId: subscriberId,
                amount: amount,
                paidAt: paidAt,
                paymentMethod: paymentMethod,
                notes: notes,
                isLocked: isLocked,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String receiptNo,
                required int subscriberId,
                required double amount,
                Value<DateTime> paidAt = const Value.absent(),
                Value<String> paymentMethod = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PaymentsCompanion.insert(
                id: id,
                receiptNo: receiptNo,
                subscriberId: subscriberId,
                amount: amount,
                paidAt: paidAt,
                paymentMethod: paymentMethod,
                notes: notes,
                isLocked: isLocked,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({subscriberId = false, paymentAllocationsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paymentAllocationsRefs) db.paymentAllocations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subscriberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subscriberId,
                                    referencedTable: $$PaymentsTableReferences
                                        ._subscriberIdTable(db),
                                    referencedColumn: $$PaymentsTableReferences
                                        ._subscriberIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paymentAllocationsRefs)
                        await $_getPrefetchedData<
                          Payment,
                          $PaymentsTable,
                          PaymentAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$PaymentsTableReferences
                              ._paymentAllocationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PaymentsTableReferences(
                                db,
                                table,
                                p0,
                              ).paymentAllocationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.paymentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PaymentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentsTable,
      Payment,
      $$PaymentsTableFilterComposer,
      $$PaymentsTableOrderingComposer,
      $$PaymentsTableAnnotationComposer,
      $$PaymentsTableCreateCompanionBuilder,
      $$PaymentsTableUpdateCompanionBuilder,
      (Payment, $$PaymentsTableReferences),
      Payment,
      PrefetchHooks Function({bool subscriberId, bool paymentAllocationsRefs})
    >;
typedef $$PaymentAllocationsTableCreateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      required int paymentId,
      required int invoiceId,
      required double amount,
    });
typedef $$PaymentAllocationsTableUpdateCompanionBuilder =
    PaymentAllocationsCompanion Function({
      Value<int> id,
      Value<int> paymentId,
      Value<int> invoiceId,
      Value<double> amount,
    });

final class $$PaymentAllocationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation
        > {
  $$PaymentAllocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PaymentsTable _paymentIdTable(_$AppDatabase db) =>
      db.payments.createAlias(
        $_aliasNameGenerator(db.paymentAllocations.paymentId, db.payments.id),
      );

  $$PaymentsTableProcessedTableManager get paymentId {
    final $_column = $_itemColumn<int>('payment_id')!;

    final manager = $$PaymentsTableTableManager(
      $_db,
      $_db.payments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_paymentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias(
        $_aliasNameGenerator(db.paymentAllocations.invoiceId, db.invoices.id),
      );

  $$InvoicesTableProcessedTableManager get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id')!;

    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PaymentAllocationsTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$PaymentsTableFilterComposer get paymentId {
    final $$PaymentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableFilterComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$PaymentsTableOrderingComposer get paymentId {
    final $$PaymentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableOrderingComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentAllocationsTable> {
  $$PaymentAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$PaymentsTableAnnotationComposer get paymentId {
    final $$PaymentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.paymentId,
      referencedTable: $db.payments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PaymentsTableAnnotationComposer(
            $db: $db,
            $table: $db.payments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PaymentAllocationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PaymentAllocationsTable,
          PaymentAllocation,
          $$PaymentAllocationsTableFilterComposer,
          $$PaymentAllocationsTableOrderingComposer,
          $$PaymentAllocationsTableAnnotationComposer,
          $$PaymentAllocationsTableCreateCompanionBuilder,
          $$PaymentAllocationsTableUpdateCompanionBuilder,
          (PaymentAllocation, $$PaymentAllocationsTableReferences),
          PaymentAllocation,
          PrefetchHooks Function({bool paymentId, bool invoiceId})
        > {
  $$PaymentAllocationsTableTableManager(
    _$AppDatabase db,
    $PaymentAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentAllocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> paymentId = const Value.absent(),
                Value<int> invoiceId = const Value.absent(),
                Value<double> amount = const Value.absent(),
              }) => PaymentAllocationsCompanion(
                id: id,
                paymentId: paymentId,
                invoiceId: invoiceId,
                amount: amount,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int paymentId,
                required int invoiceId,
                required double amount,
              }) => PaymentAllocationsCompanion.insert(
                id: id,
                paymentId: paymentId,
                invoiceId: invoiceId,
                amount: amount,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PaymentAllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({paymentId = false, invoiceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (paymentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.paymentId,
                                referencedTable:
                                    $$PaymentAllocationsTableReferences
                                        ._paymentIdTable(db),
                                referencedColumn:
                                    $$PaymentAllocationsTableReferences
                                        ._paymentIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (invoiceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoiceId,
                                referencedTable:
                                    $$PaymentAllocationsTableReferences
                                        ._invoiceIdTable(db),
                                referencedColumn:
                                    $$PaymentAllocationsTableReferences
                                        ._invoiceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PaymentAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PaymentAllocationsTable,
      PaymentAllocation,
      $$PaymentAllocationsTableFilterComposer,
      $$PaymentAllocationsTableOrderingComposer,
      $$PaymentAllocationsTableAnnotationComposer,
      $$PaymentAllocationsTableCreateCompanionBuilder,
      $$PaymentAllocationsTableUpdateCompanionBuilder,
      (PaymentAllocation, $$PaymentAllocationsTableReferences),
      PaymentAllocation,
      PrefetchHooks Function({bool paymentId, bool invoiceId})
    >;
typedef $$AdjustmentsTableCreateCompanionBuilder =
    AdjustmentsCompanion Function({
      Value<int> id,
      required int subscriberId,
      Value<int?> invoiceId,
      required String type,
      required double amount,
      required String reason,
      Value<String> status,
      required int requestedBy,
      Value<int?> approvedBy,
      Value<DateTime?> approvedAt,
      Value<DateTime> createdAt,
    });
typedef $$AdjustmentsTableUpdateCompanionBuilder =
    AdjustmentsCompanion Function({
      Value<int> id,
      Value<int> subscriberId,
      Value<int?> invoiceId,
      Value<String> type,
      Value<double> amount,
      Value<String> reason,
      Value<String> status,
      Value<int> requestedBy,
      Value<int?> approvedBy,
      Value<DateTime?> approvedAt,
      Value<DateTime> createdAt,
    });

final class $$AdjustmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AdjustmentsTable, Adjustment> {
  $$AdjustmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubscribersTable _subscriberIdTable(_$AppDatabase db) =>
      db.subscribers.createAlias(
        $_aliasNameGenerator(db.adjustments.subscriberId, db.subscribers.id),
      );

  $$SubscribersTableProcessedTableManager get subscriberId {
    final $_column = $_itemColumn<int>('subscriber_id')!;

    final manager = $$SubscribersTableTableManager(
      $_db,
      $_db.subscribers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subscriberIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InvoicesTable _invoiceIdTable(_$AppDatabase db) =>
      db.invoices.createAlias(
        $_aliasNameGenerator(db.adjustments.invoiceId, db.invoices.id),
      );

  $$InvoicesTableProcessedTableManager? get invoiceId {
    final $_column = $_itemColumn<int>('invoice_id');
    if ($_column == null) return null;
    final manager = $$InvoicesTableTableManager(
      $_db,
      $_db.invoices,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _requestedByTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.adjustments.requestedBy, db.users.id),
      );

  $$UsersTableProcessedTableManager get requestedBy {
    final $_column = $_itemColumn<int>('requested_by')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_requestedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _approvedByTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.adjustments.approvedBy, db.users.id),
  );

  $$UsersTableProcessedTableManager? get approvedBy {
    final $_column = $_itemColumn<int>('approved_by');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_approvedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdjustmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AdjustmentsTable> {
  $$AdjustmentsTableFilterComposer({
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

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SubscribersTableFilterComposer get subscriberId {
    final $$SubscribersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableFilterComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableFilterComposer get invoiceId {
    final $$InvoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableFilterComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get requestedBy {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get approvedBy {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.approvedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdjustmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdjustmentsTable> {
  $$AdjustmentsTableOrderingComposer({
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

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubscribersTableOrderingComposer get subscriberId {
    final $$SubscribersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableOrderingComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableOrderingComposer get invoiceId {
    final $$InvoicesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableOrderingComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get requestedBy {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get approvedBy {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.approvedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdjustmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdjustmentsTable> {
  $$AdjustmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get approvedAt => $composableBuilder(
    column: $table.approvedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SubscribersTableAnnotationComposer get subscriberId {
    final $$SubscribersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subscriberId,
      referencedTable: $db.subscribers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubscribersTableAnnotationComposer(
            $db: $db,
            $table: $db.subscribers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InvoicesTableAnnotationComposer get invoiceId {
    final $$InvoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoiceId,
      referencedTable: $db.invoices,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.invoices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get requestedBy {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.requestedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get approvedBy {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.approvedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdjustmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdjustmentsTable,
          Adjustment,
          $$AdjustmentsTableFilterComposer,
          $$AdjustmentsTableOrderingComposer,
          $$AdjustmentsTableAnnotationComposer,
          $$AdjustmentsTableCreateCompanionBuilder,
          $$AdjustmentsTableUpdateCompanionBuilder,
          (Adjustment, $$AdjustmentsTableReferences),
          Adjustment,
          PrefetchHooks Function({
            bool subscriberId,
            bool invoiceId,
            bool requestedBy,
            bool approvedBy,
          })
        > {
  $$AdjustmentsTableTableManager(_$AppDatabase db, $AdjustmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdjustmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdjustmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdjustmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> subscriberId = const Value.absent(),
                Value<int?> invoiceId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> requestedBy = const Value.absent(),
                Value<int?> approvedBy = const Value.absent(),
                Value<DateTime?> approvedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AdjustmentsCompanion(
                id: id,
                subscriberId: subscriberId,
                invoiceId: invoiceId,
                type: type,
                amount: amount,
                reason: reason,
                status: status,
                requestedBy: requestedBy,
                approvedBy: approvedBy,
                approvedAt: approvedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subscriberId,
                Value<int?> invoiceId = const Value.absent(),
                required String type,
                required double amount,
                required String reason,
                Value<String> status = const Value.absent(),
                required int requestedBy,
                Value<int?> approvedBy = const Value.absent(),
                Value<DateTime?> approvedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AdjustmentsCompanion.insert(
                id: id,
                subscriberId: subscriberId,
                invoiceId: invoiceId,
                type: type,
                amount: amount,
                reason: reason,
                status: status,
                requestedBy: requestedBy,
                approvedBy: approvedBy,
                approvedAt: approvedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AdjustmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                subscriberId = false,
                invoiceId = false,
                requestedBy = false,
                approvedBy = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (subscriberId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.subscriberId,
                                    referencedTable:
                                        $$AdjustmentsTableReferences
                                            ._subscriberIdTable(db),
                                    referencedColumn:
                                        $$AdjustmentsTableReferences
                                            ._subscriberIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (invoiceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.invoiceId,
                                    referencedTable:
                                        $$AdjustmentsTableReferences
                                            ._invoiceIdTable(db),
                                    referencedColumn:
                                        $$AdjustmentsTableReferences
                                            ._invoiceIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (requestedBy) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.requestedBy,
                                    referencedTable:
                                        $$AdjustmentsTableReferences
                                            ._requestedByTable(db),
                                    referencedColumn:
                                        $$AdjustmentsTableReferences
                                            ._requestedByTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (approvedBy) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.approvedBy,
                                    referencedTable:
                                        $$AdjustmentsTableReferences
                                            ._approvedByTable(db),
                                    referencedColumn:
                                        $$AdjustmentsTableReferences
                                            ._approvedByTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$AdjustmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdjustmentsTable,
      Adjustment,
      $$AdjustmentsTableFilterComposer,
      $$AdjustmentsTableOrderingComposer,
      $$AdjustmentsTableAnnotationComposer,
      $$AdjustmentsTableCreateCompanionBuilder,
      $$AdjustmentsTableUpdateCompanionBuilder,
      (Adjustment, $$AdjustmentsTableReferences),
      Adjustment,
      PrefetchHooks Function({
        bool subscriberId,
        bool invoiceId,
        bool requestedBy,
        bool approvedBy,
      })
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      required String action,
      required String entityType,
      Value<int?> entityId,
      Value<String?> details,
      Value<DateTime> createdAt,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<int?> userId,
      Value<String> action,
      Value<String> entityType,
      Value<int?> entityId,
      Value<String?> details,
      Value<DateTime> createdAt,
    });

final class $$AuditLogsTableReferences
    extends BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog> {
  $$AuditLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.auditLogs.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager? get userId {
    final $_column = $_itemColumn<int>('user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
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

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
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

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, $$AuditLogsTableReferences),
          AuditLog,
          PrefetchHooks Function({bool userId})
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String> entityType = const Value.absent(),
                Value<int?> entityId = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                details: details,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> userId = const Value.absent(),
                required String action,
                required String entityType,
                Value<int?> entityId = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                userId: userId,
                action: action,
                entityType: entityType,
                entityId: entityId,
                details: details,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AuditLogsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AuditLogsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, $$AuditLogsTableReferences),
      AuditLog,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AreasTableTableManager get areas =>
      $$AreasTableTableManager(_db, _db.areas);
  $$SubscribersTableTableManager get subscribers =>
      $$SubscribersTableTableManager(_db, _db.subscribers);
  $$MetersTableTableManager get meters =>
      $$MetersTableTableManager(_db, _db.meters);
  $$TariffsTableTableManager get tariffs =>
      $$TariffsTableTableManager(_db, _db.tariffs);
  $$TariffSlabsTableTableManager get tariffSlabs =>
      $$TariffSlabsTableTableManager(_db, _db.tariffSlabs);
  $$BillingCyclesTableTableManager get billingCycles =>
      $$BillingCyclesTableTableManager(_db, _db.billingCycles);
  $$InvoicesTableTableManager get invoices =>
      $$InvoicesTableTableManager(_db, _db.invoices);
  $$InvoiceSlabBreakdownsTableTableManager get invoiceSlabBreakdowns =>
      $$InvoiceSlabBreakdownsTableTableManager(_db, _db.invoiceSlabBreakdowns);
  $$MeterReadingsTableTableManager get meterReadings =>
      $$MeterReadingsTableTableManager(_db, _db.meterReadings);
  $$PaymentsTableTableManager get payments =>
      $$PaymentsTableTableManager(_db, _db.payments);
  $$PaymentAllocationsTableTableManager get paymentAllocations =>
      $$PaymentAllocationsTableTableManager(_db, _db.paymentAllocations);
  $$AdjustmentsTableTableManager get adjustments =>
      $$AdjustmentsTableTableManager(_db, _db.adjustments);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'a8adac753ec093503f5d6a0ee6a62ee048a98be4';
