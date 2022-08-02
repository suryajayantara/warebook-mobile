import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/users.dart';

part 'thesis.g.dart';

@JsonSerializable()
class Thesis {
  @JsonKey(includeIfNull: false, toJson: toNull)
  Users? users;
  String? thesisType;
  @JsonKey(name: 'thesis_type')
  String? title;
  String? abstract;
  String? created_year;
  String? thumbnail_url;
  String? tags;
  Thesis({
    this.users,
    this.thesisType,
    this.title,
    this.abstract,
    this.created_year,
    this.thumbnail_url,
    this.tags,
  });

  Thesis copyWith({
    Users? users,
    String? thesisType,
    String? title,
    String? abstract,
    String? created_year,
    String? thumbnail_url,
    String? tags,
  }) {
    return Thesis(
      users: users ?? this.users,
      thesisType: thesisType ?? this.thesisType,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      created_year: created_year ?? this.created_year,
      thumbnail_url: thumbnail_url ?? this.thumbnail_url,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() => _$ThesisToJson(this);

  factory Thesis.fromJson(Map<String, dynamic> map) => _$ThesisFromJson(map);

  @override
  String toString() {
    return 'Thesis(users: $users, thesisType: $thesisType, title: $title, abstract: $abstract, created_year: $created_year, thumbnail_url: $thumbnail_url, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Thesis &&
        other.users == users &&
        other.thesisType == thesisType &&
        other.title == title &&
        other.abstract == abstract &&
        other.created_year == created_year &&
        other.thumbnail_url == thumbnail_url &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return users.hashCode ^
        thesisType.hashCode ^
        title.hashCode ^
        abstract.hashCode ^
        created_year.hashCode ^
        thumbnail_url.hashCode ^
        tags.hashCode;
  }

}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
