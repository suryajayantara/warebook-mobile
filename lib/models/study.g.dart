// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Study _$StudyFromJson(Map<String, dynamic> json) => Study(
      studyName: json['studies_name'] as String?,
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$StudyToJson(Study instance) => <String, dynamic>{
      'studies_name': instance.studyName,
      'desc': instance.desc,
    };
