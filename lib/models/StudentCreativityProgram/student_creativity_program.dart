import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/users.dart';

part 'student_creativity_program.g.dart';

@JsonSerializable()
class StudentCreativityProgram {
  int? id;
  String? title;
  @JsonKey(name: 'creativity_type')
  String? creativityType;
  String? aliases;
  String? abstract;
  String? year;
  String? supervisor;
  @JsonKey(name: 'document_url')
  String? documentUrl;
  Users? users;
  StudentCreativityProgram({
    this.id,
    this.title,
    this.creativityType,
    this.aliases,
    this.abstract,
    this.year,
    this.supervisor,
    this.documentUrl,
    this.users,
  });

  StudentCreativityProgram copyWith({
    int? id,
    String? title,
    String? creativityType,
    String? aliases,
    String? abstract,
    String? year,
    String? supervisor,
    String? documentUrl,
    Users? users,
  }) {
    return StudentCreativityProgram(
      id: id ?? this.id,
      title: title ?? this.title,
      creativityType: creativityType ?? this.creativityType,
      aliases: aliases ?? this.aliases,
      abstract: abstract ?? this.abstract,
      year: year ?? this.year,
      supervisor: supervisor ?? this.supervisor,
      documentUrl: documentUrl ?? this.documentUrl,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toJson() => _$StudentCreativityProgramToJson(this);

  factory StudentCreativityProgram.fromJson(Map<String, dynamic> map) =>
      _$StudentCreativityProgramFromJson(map);

  @override
  String toString() {
    return 'StudentCreativityProgram(id: $id, title: $title, creativityType: $creativityType, aliases: $aliases, abstract: $abstract, year: $year, supervisor: $supervisor, documentUrl: $documentUrl, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StudentCreativityProgram &&
        other.id == id &&
        other.title == title &&
        other.creativityType == creativityType &&
        other.aliases == aliases &&
        other.abstract == abstract &&
        other.year == year &&
        other.supervisor == supervisor &&
        other.documentUrl == documentUrl &&
        other.users == users;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        creativityType.hashCode ^
        aliases.hashCode ^
        abstract.hashCode ^
        year.hashCode ^
        supervisor.hashCode ^
        documentUrl.hashCode ^
        users.hashCode;
  }

}
