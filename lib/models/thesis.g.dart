// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Thesis _$ThesisFromJson(Map<String, dynamic> json) => Thesis(
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
      thesisType: json['thesisType'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      created_year: json['created_year'] as String?,
      thumbnail_url: json['thumbnail_url'] as String?,
      tags: json['tags'] as String?,
    );

Map<String, dynamic> _$ThesisToJson(Thesis instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', toNull(instance.users));
  val['thesisType'] = instance.thesisType;
  val['title'] = instance.title;
  val['abstract'] = instance.abstract;
  val['created_year'] = instance.created_year;
  val['thumbnail_url'] = instance.thumbnail_url;
  val['tags'] = instance.tags;
  return val;
}
