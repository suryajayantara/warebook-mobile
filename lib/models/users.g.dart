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

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'token': instance.token,
      'uniqueId': instance.uniqueId,
      'study': instance.study,
      'departement': instance.departement,
    };
