import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/users.dart';

part 'thesis.g.dart';

@JsonSerializable()
class Thesis {
  @JsonKey(includeIfNull: false, toJson: toNull)
  int? id;
  @JsonKey(includeIfNull: false, toJson: toNull)
  Users? users;
  @JsonKey(name: 'thesis_type')
  String? thesisType;
  String? title;
  String? abstract;
  @JsonKey(name: 'created_year')
  int? createdYear;
  @JsonKey(name: 'thumbnail_url')
  String? thumbnailUrl;
  String? tags;
  Thesis({
    this.id,
    this.users,
    this.thesisType,
    this.title,
    this.abstract,
    this.createdYear,
    this.thumbnailUrl,
    this.tags,
  });

  Thesis copyWith({
    int? id,
    Users? users,
    String? thesisType,
    String? title,
    String? abstract,
    int? createdYear,
    String? thumbnailUrl,
    String? tags,
  }) {
    return Thesis(
      id: id ?? this.id,
      users: users ?? this.users,
      thesisType: thesisType ?? this.thesisType,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      createdYear: createdYear ?? this.createdYear,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() => _$ThesisToJson(this);
  factory Thesis.fromJson(Map<String, dynamic> map) => _$ThesisFromJson(map);

  @override
  String toString() {
    return 'Thesis(id: $id, users: $users, thesisType: $thesisType, title: $title, abstract: $abstract, createdYear: $createdYear, thumbnailUrl: $thumbnailUrl, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Thesis &&
        other.id == id &&
        other.users == users &&
        other.thesisType == thesisType &&
        other.title == title &&
        other.abstract == abstract &&
        other.createdYear == createdYear &&
        other.thumbnailUrl == thumbnailUrl &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        users.hashCode ^
        thesisType.hashCode ^
        title.hashCode ^
        abstract.hashCode ^
        createdYear.hashCode ^
        thumbnailUrl.hashCode ^
        tags.hashCode;
  }


}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
