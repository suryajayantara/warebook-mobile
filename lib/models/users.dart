import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/departement.dart';
import 'package:warebook_mobile/models/study.dart';

part 'users.g.dart';

@JsonSerializable(explicitToJson: true)
class Users {
  int? id;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? name;
  String? email;
  String? password;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? token;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? role;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? uniqueId;
  @JsonKey(toJson: toNull, includeIfNull: false, name: 'studies')
  Study? study;
  @JsonKey(toJson: toNull, includeIfNull: false)
  Departement? departement;

  Users(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.token,
      this.role,
      this.uniqueId,
      this.study,
      this.departement});

  Users copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? token,
    String? role,
    String? uniqueId,
    Study? study,
    Departement? departement,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      role: role ?? this.role,
      uniqueId: uniqueId ?? this.uniqueId,
      study: study ?? this.study,
      departement: departement ?? this.departement,
    );
  }

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  factory Users.fromJson(Map<String, dynamic> map) => _$UsersFromJson(map);

  @override
  String toString() {
    return 'Users(id: $id, name: $name, email: $email, password: $password, token: $token, role: $role, uniqueId: $uniqueId, study: $study, departement: $departement)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Users &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.token == token &&
        other.role == role &&
        other.uniqueId == uniqueId &&
        other.study == study &&
        other.departement == departement;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode ^
        role.hashCode ^
        uniqueId.hashCode ^
        study.hashCode ^
        departement.hashCode;
  }

 
}

toNull(_) => null;

toString(_) {
  return _.toString();
}
