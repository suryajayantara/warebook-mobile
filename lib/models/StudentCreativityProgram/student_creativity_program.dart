import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:warebook_mobile/models/users.dart';
part 'student_creativity_program.g.dart';

@JsonSerializable()
class StudentCreativityProgram {
  int? id;
  String? title;
  String? abstract;
  String? year;
  String? supervisor;
  String? documentUrl;
  Users? users;
  StudentCreativityProgram({
    this.id,
    this.title,
    this.abstract,
    this.year,
    this.supervisor,
    this.documentUrl,
    this.users,
  });

  StudentCreativityProgram copyWith({
    int? id,
    String? title,
    String? abstract,
    String? year,
    String? supervisor,
    String? documentUrl,
    Users? users,
  }) {
    return StudentCreativityProgram(
      id: id ?? this.id,
      title: title ?? this.title,
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
    return 'StudentCreativityProgramType(id: $id, title: $title, abstract: $abstract, year: $year, supervisor: $supervisor, documentUrl: $documentUrl, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentCreativityProgram &&
        other.id == id &&
        other.title == title &&
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
        abstract.hashCode ^
        year.hashCode ^
        supervisor.hashCode ^
        documentUrl.hashCode ^
        users.hashCode;
  }
}