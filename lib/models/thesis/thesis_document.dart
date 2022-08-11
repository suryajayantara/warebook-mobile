import 'package:json_annotation/json_annotation.dart';
part 'thesis_document.g.dart';

@JsonSerializable()
class ThesisDocument {
  int? id;
  @JsonKey(name: 'document_name')
  String? documentName;
  @JsonKey(name: 'document_url')
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

  Map<String, dynamic> toJson() => _$ThesisDocumentToJson(this);

  factory ThesisDocument.fromJson(Map<String, dynamic> map) =>
      _$ThesisDocumentFromJson(map);


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
