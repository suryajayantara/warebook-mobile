// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thesis _$ThesisFromJson(Map<String, dynamic> json) => Thesis(
      id: json['id'] as int?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
      thesisType: json['thesis_type'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      createdYear: json['created_year'] as int?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tags: json['tags'] as String?,
    );

Map<String, dynamic> _$ThesisToJson(Thesis instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', toNull(instance.id));
  writeNotNull('users', toNull(instance.users));
  val['thesis_type'] = instance.thesisType;
  val['title'] = instance.title;
  val['abstract'] = instance.abstract;
  val['created_year'] = instance.createdYear;
  val['thumbnail_url'] = instance.thumbnailUrl;
  val['tags'] = instance.tags;
  return val;
}
