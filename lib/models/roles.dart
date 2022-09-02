import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'roles.g.dart';

@JsonSerializable()
class Roles {
  int? id;
  @JsonKey(name: 'role')
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

  Map<String, dynamic> toJson() => _$RolesToJson(this);

  factory Roles.fromJson(Map<String, dynamic> map) => _$RolesFromJson(map);

 

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
