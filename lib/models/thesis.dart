import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/users.dart';

part 'thesis.g.dart';

@JsonSerializable()
class Thesis {
  @JsonKey(includeIfNull: false, toJson: toNull)
  Users? users;
  String? thesis_type;
  String? title;
  String? abstract;
  String? created_year;
  String? thumbnail_url;
  String? tags;
  Thesis({
    this.users,
    this.thesis_type,
    this.title,
    this.abstract,
    this.created_year,
    this.thumbnail_url,
    this.tags,
  });

  Thesis copyWith({
    Users? users,
    String? thesis_type,
    String? title,
    String? abstract,
    String? created_year,
    String? thumbnail_url,
    String? tags,
  }) {
    return Thesis(
      users: users ?? this.users,
      thesis_type: thesis_type ?? this.thesis_type,
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
    return 'Thesis(users: $users, thesis_type: $thesis_type, title: $title, abstract: $abstract, created_year: $created_year, thumbnail_url: $thumbnail_url, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thesis &&
        other.users == users &&
        other.thesis_type == thesis_type &&
        other.title == title &&
        other.abstract == abstract &&
        other.created_year == created_year &&
        other.thumbnail_url == thumbnail_url &&
        other.tags == tags;
  }

  @override
  int get hashCode {
    return users.hashCode ^
        thesis_type.hashCode ^
        title.hashCode ^
        abstract.hashCode ^
        created_year.hashCode ^
        thumbnail_url.hashCode ^
        tags.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'users': users?.toJson(),
      'thesis_type': thesis_type,
      'title': title,
      'abstract': abstract,
      'created_year': created_year,
      'thumbnail_url': thumbnail_url,
      'tags': tags,
    };
  }

  factory Thesis.fromMap(Map<String, dynamic> map) {
    return Thesis(
      users: map['users'] != null ? Users.fromJson(map['users']) : null,
      thesis_type: map['thesis_type'],
      title: map['title'],
      abstract: map['abstract'],
      created_year: map['created_year'],
      thumbnail_url: map['thumbnail_url'],
      tags: map['tags'],
    );
  }
}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
