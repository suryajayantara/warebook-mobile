// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Roles _$RolesFromJson(Map<String, dynamic> json) => Roles(
      id: json['id'] as int?,
      roleName: json['role_name'] as String?,
      guardName: json['guard_name'] as String?,
    );

Map<String, dynamic> _$RolesToJson(Roles instance) => <String, dynamic>{
      'id': instance.id,
      'role_name': instance.roleName,
      'guard_name': instance.guardName,
    };
