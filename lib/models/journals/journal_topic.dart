import 'package:json_annotation/json_annotation.dart';
import 'package:warebook_mobile/models/users.dart';
part 'journal_topic.g.dart';

@JsonSerializable()
class JournalTopic {
  int? id;
  String? subject;
  String? title;
  String? description;
  Users? users;

  JournalTopic({
    this.id,
    this.subject,
    this.title,
    this.description,
    this.users,
  });

  JournalTopic copyWith({
    int? id,
    String? subject,
    String? title,
    String? description,
    Users? users,
  }) {
    return JournalTopic(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      title: title ?? this.title,
      description: description ?? this.description,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toJson() => _$JournalTopicToJson(this);

  factory JournalTopic.fromJson(Map<String, dynamic> map) =>
      _$JournalTopicFromJson(map);

  @override
  String toString() {
    return 'JournalTopic(id: $id, subject: $subject, title: $title, description: $description, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is JournalTopic &&
        other.id == id &&
        other.subject == subject &&
        other.title == title &&
        other.description == description &&
        other.users == users;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        subject.hashCode ^
        title.hashCode ^
        description.hashCode ^
        users.hashCode;
  }
}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
