// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalDocument _$JournalDocumentFromJson(Map<String, dynamic> json) =>
    JournalDocument(
      title: json['title'] as String?,
      author: json['author'] as String?,
      abstract: json['abstract'] as String?,
      documentUrl: json['document_url'] as String?,
      originalUrl: json['original_url'] as String?,
      year: json['year'] as String?,
      tags: json['tags'] as String?,
      doi: json['doi'] as String?,
      journalTopic: json['journalTopic'] == null
          ? null
          : JournalTopic.fromJson(json['journalTopic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JournalDocumentToJson(JournalDocument instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'abstract': instance.abstract,
      'document_url': instance.documentUrl,
      'original_url': instance.originalUrl,
      'year': instance.year,
      'tags': instance.tags,
      'doi': instance.doi,
      'journalTopic': instance.journalTopic,
    };
