// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_creativity_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentCreativityProgram _$StudentCreativityProgramFromJson(
        Map<String, dynamic> json) =>
    StudentCreativityProgram(
      id: json['id'] as int?,
      title: json['title'] as String?,
      creativityType: json['creativity_type'] as String?,
      aliases: json['aliases'] as String?,
      abstract: json['abstract'] as String?,
      year: json['year'] as String?,
      supervisor: json['supervisor'] as String?,
      documentUrl: json['document_url'] as String?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentCreativityProgramToJson(
        StudentCreativityProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creativity_type': instance.creativityType,
      'aliases': instance.aliases,
      'abstract': instance.abstract,
      'year': instance.year,
      'supervisor': instance.supervisor,
      'document_url': instance.documentUrl,
      'users': instance.users,
    };
