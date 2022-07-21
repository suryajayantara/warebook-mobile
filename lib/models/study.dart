import 'package:json_annotation/json_annotation.dart';
part 'study.g.dart';

@JsonSerializable()
class Study {
  final String? studyName;
  final String? desc;

  Study({this.studyName, this.desc});

  Study copyWith({
    String? studyName,
    String? desc,
  }) {
    return Study(
      studyName: studyName ?? this.studyName,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toJson() => _$StudyToJson(this);

  factory Study.fromJson(Map<String, dynamic> map) => _$StudyFromJson(map);

  @override
  String toString() => 'Study(studyName: $studyName, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Study && other.studyName == studyName && other.desc == desc;
  }

  @override
  int get hashCode => studyName.hashCode ^ desc.hashCode;
}
