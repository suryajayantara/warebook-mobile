// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      roles: json['roles'] == null
          ? null
          : Roles.fromJson(json['roles'] as Map<String, dynamic>),
      token: json['token'] as String?,
      uniqueId: json['uniqueId'] as String?,
      study: json['studies'] == null
          ? null
          : Study.fromJson(json['studies'] as Map<String, dynamic>),
      departement: json['departement'] == null
          ? null
          : Departement.fromJson(json['departement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersToJson(Users instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', toNull(instance.name));
  val['email'] = instance.email;
  val['password'] = instance.password;
  val['roles'] = toNull(instance.roles);
  writeNotNull('token', toNull(instance.token));
  writeNotNull('uniqueId', toNull(instance.uniqueId));
  writeNotNull('studies', toNull(instance.study));
  writeNotNull('departement', toNull(instance.departement));
  return val;
}
