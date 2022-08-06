// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalTopic _$JournalTopicFromJson(Map<String, dynamic> json) => JournalTopic(
      id: json['id'] as int?,
      subject: json['subject'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JournalTopicToJson(JournalTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'title': instance.title,
      'description': instance.description,
      'users': instance.users,
    };
