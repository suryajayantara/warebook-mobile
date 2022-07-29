// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Departement _$DepartementFromJson(Map<String, dynamic> json) => Departement(
      departemenName: json['departement_name'] as String?,
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$DepartementToJson(Departement instance) =>
    <String, dynamic>{
      'departement_name': instance.departemenName,
      'desc': instance.desc,
    };
