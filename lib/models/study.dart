import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'study.g.dart';

@JsonSerializable()
class Study {
  
  int id;
  @JsonKey(
    name: 'studies_name',
  )
  String? studyName;
  String? desc;

  Study({
    required this.id,
    this.studyName,
    this.desc,
  });

  Study copyWith({
    int? id,
    String? studyName,
    String? desc,
  }) {
    return Study(
      id: id ?? this.id,
      studyName: studyName ?? this.studyName,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toJson() => _$StudyToJson(this);

  factory Study.fromJson(Map<String, dynamic> map) => _$StudyFromJson(map);

  @override
  String toString() => 'Study(id: $id, studyName: $studyName, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Study &&
        other.id == id &&
        other.studyName == studyName &&
        other.desc == desc;
  }

  @override
  int get hashCode => id.hashCode ^ studyName.hashCode ^ desc.hashCode;

}
