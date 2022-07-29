// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      uniqueId: json['uniqueId'] as String?,
      study: json['study'] == null
          ? null
          : Study.fromJson(json['study'] as Map<String, dynamic>),
      departement: json['departement'] == null
          ? null
          : Departement.fromJson(json['departement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersToJson(Users instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', toNull(instance.name));
  val['email'] = instance.email;
  val['password'] = instance.password;
  writeNotNull('token', toNull(instance.token));
  writeNotNull('uniqueId', toNull(instance.uniqueId));
  writeNotNull('study', toNull(instance.study));
  writeNotNull('departement', toNull(instance.departement));
  return val;
}
