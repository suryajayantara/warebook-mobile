import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'roles.g.dart';

@JsonSerializable()
class Roles {
  int? id;
  @JsonKey(name: 'role_name')
  String? roleName;
  @JsonKey(name: 'guard_name')
  String? guardName;
  Roles({
    this.id,
    this.roleName,
    this.guardName,
  });

  Roles copyWith({
    int? id,
    String? roleName,
    String? guardName,
  }) {
    return Roles(
      id: id ?? this.id,
      roleName: roleName ?? this.roleName,
      guardName: guardName ?? this.guardName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'roleName': roleName,
      'guardName': guardName,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      id: map['id']?.toInt(),
      roleName: map['roleName'],
      guardName: map['guardName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) => Roles.fromMap(json.decode(source));

  @override
  String toString() =>
      'Roles(id: $id, roleName: $roleName, guardName: $guardName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Roles &&
        other.id == id &&
        other.roleName == roleName &&
        other.guardName == guardName;
  }

  @override
  int get hashCode => id.hashCode ^ roleName.hashCode ^ guardName.hashCode;
}
