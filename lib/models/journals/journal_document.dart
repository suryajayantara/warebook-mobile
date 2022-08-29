import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/journals/journal_topic.dart';

part 'journal_document.g.dart';

@JsonSerializable()
class JournalDocument {
  @JsonKey(includeIfNull: false)
  int? id;
  String? title;
  String? author;
  String? abstract;
  @JsonKey(name: 'document_url')
  String? documentUrl;
  @JsonKey(name: 'original_url')
  String? originalUrl;
  String? year;
  String? tags;
  String? doi;
  JournalTopic? journalTopic;
  JournalDocument({
    this.id,
    this.title,
    this.author,
    this.abstract,
    this.documentUrl,
    this.originalUrl,
    this.year,
    this.tags,
    this.doi,
    this.journalTopic,
  });

  JournalDocument copyWith({
    int? id,
    String? title,
    String? author,
    String? abstract,
    String? documentUrl,
    String? originalUrl,
    String? year,
    String? tags,
    String? doi,
    JournalTopic? journalTopic,
  }) {
    return JournalDocument(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      abstract: abstract ?? this.abstract,
      documentUrl: documentUrl ?? this.documentUrl,
      originalUrl: originalUrl ?? this.originalUrl,
      year: year ?? this.year,
      tags: tags ?? this.tags,
      doi: doi ?? this.doi,
      journalTopic: journalTopic ?? this.journalTopic,
    );
  }

  Map<String, dynamic> toJson() => _$JournalDocumentToJson(this);

  factory JournalDocument.fromJson(Map<String, dynamic> map) =>
      _$JournalDocumentFromJson(map);

  @override
  String toString() {
    return 'JournalDocument(id: $id, title: $title, author: $author, abstract: $abstract, documentUrl: $documentUrl, originalUrl: $originalUrl, year: $year, tags: $tags, doi: $doi, journalTopic: $journalTopic)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is JournalDocument &&
        other.id == id &&
        other.title == title &&
        other.author == author &&
        other.abstract == abstract &&
        other.documentUrl == documentUrl &&
        other.originalUrl == originalUrl &&
        other.year == year &&
        other.tags == tags &&
        other.doi == doi &&
        other.journalTopic == journalTopic;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        abstract.hashCode ^
        documentUrl.hashCode ^
        originalUrl.hashCode ^
        year.hashCode ^
        tags.hashCode ^
        doi.hashCode ^
        journalTopic.hashCode;
  }
}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
