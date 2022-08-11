// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThesisDocument _$ThesisDocumentFromJson(Map<String, dynamic> json) =>
    ThesisDocument(
      id: json['id'] as int?,
      documentName: json['document_name'] as String?,
      url: json['document_url'] as String?,
    );

Map<String, dynamic> _$ThesisDocumentToJson(ThesisDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_name': instance.documentName,
      'document_url': instance.url,
    };
