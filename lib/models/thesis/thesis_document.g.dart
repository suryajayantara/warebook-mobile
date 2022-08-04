// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thesis_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThesisDocument _$ThesisDocumentFromJson(Map<String, dynamic> json) =>
    ThesisDocument(
      id: json['id'] as int?,
      documentName: json['documentName'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ThesisDocumentToJson(ThesisDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentName': instance.documentName,
      'url': instance.url,
    };
