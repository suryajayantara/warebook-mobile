import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'thesis_document.g.dart';

@JsonSerializable()
class ThesisDocument {
  int? id;
  String? documentName;
  String? url;
  ThesisDocument({
    this.id,
    this.documentName,
    this.url,
  });

  ThesisDocument copyWith({
    int? id,
    String? documentName,
    String? url,
  }) {
    return ThesisDocument(
      id: id ?? this.id,
      documentName: documentName ?? this.documentName,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'documentName': documentName,
      'url': url,
    };
  }

  factory ThesisDocument.fromMap(Map<String, dynamic> map) {
    return ThesisDocument(
      id: map['id']?.toInt(),
      documentName: map['documentName'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThesisDocument.fromJson(String source) =>
      ThesisDocument.fromMap(json.decode(source));

  @override
  String toString() =>
      'ThesisDocument(id: $id, documentName: $documentName, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThesisDocument &&
        other.id == id &&
        other.documentName == documentName &&
        other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ documentName.hashCode ^ url.hashCode;
}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
