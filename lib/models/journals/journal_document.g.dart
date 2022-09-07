// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalDocument _$JournalDocumentFromJson(Map<String, dynamic> json) =>
    JournalDocument(
      id: json['id'] as int?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      abstract: json['abstract'] as String?,
      documentUrl: json['document_url'] as String?,
      originalUrl: json['original_url'] as String?,
      year: json['year'] as String?,
      tags: json['tags'] as String?,
      doi: json['doi'] as String?,
      journalTopicId: json['journal_topics_id'] as int?,
    );

Map<String, dynamic> _$JournalDocumentToJson(JournalDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['author'] = instance.author;
  val['abstract'] = instance.abstract;
  val['document_url'] = instance.documentUrl;
  val['original_url'] = instance.originalUrl;
  val['year'] = instance.year;
  val['tags'] = instance.tags;
  val['doi'] = instance.doi;
  val['journal_topics_id'] = instance.journalTopicId;
  return val;
}
