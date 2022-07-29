import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/departement.dart';
import 'package:warebook_mobile/models/study.dart';

part 'users.g.dart';

@JsonSerializable(explicitToJson: true)
class Users {
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? name;
  String? email;
  String? password;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? token;
  @JsonKey(toJson: toNull, includeIfNull: false)
  String? uniqueId;
  @JsonKey(toJson: toNull, includeIfNull: false)
  Study? study;
  @JsonKey(toJson: toNull, includeIfNull: false)
  Departement? departement;

  Users(
      {this.name,
      this.email,
      this.password,
      this.token,
      this.uniqueId,
      this.study,
      this.departement});

  Users copyWith({
    String? name,
    String? email,
    String? password,
    String? token,
    String? uniqueId,
    Study? study,
    Departement? departement,
  }) {
    return Users(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      uniqueId: uniqueId ?? this.uniqueId,
      study: study ?? this.study,
      departement: departement ?? this.departement,
    );
  }

  Map<String, dynamic> toJson() => _$UsersToJson(this);

  factory Users.fromJson(Map<String, dynamic> map) => _$UsersFromJson(map);

  @override
  String toString() {
    return 'Users(name: $name, email: $email, password: $password, token: $token, uniqueId: $uniqueId, study: $study, departement: $departement)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Users &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.token == token &&
        other.uniqueId == uniqueId &&
        other.study == study &&
        other.departement == departement;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode ^
        uniqueId.hashCode ^
        study.hashCode ^
        departement.hashCode;
  }
}

toNull(_) => null;

toString(_) {
  return _.toString();
}
