import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'departement.g.dart';

@JsonSerializable()
class Departement {
  int id;
  @JsonKey(name: 'departement_name')
  final String? departemenName;
  final String? desc;

  Departement({
    required this.id,
    this.departemenName,
    this.desc,
  });

  Departement copyWith({
    int? id,
    String? departemenName,
    String? desc,
  }) {
    return Departement(
      id: id ?? this.id,
      departemenName: departemenName ?? this.departemenName,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toJson() => _$DepartementToJson(this);

  factory Departement.fromJson(Map<String, dynamic> map) =>
      _$DepartementFromJson(map);


  @override
  String toString() =>
      'Departement(id: $id, departemenName: $departemenName, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Departement &&
        other.id == id &&
        other.departemenName == departemenName &&
        other.desc == desc;
  }

  @override
  int get hashCode => id.hashCode ^ departemenName.hashCode ^ desc.hashCode;

  factory Departement.fromMap(Map<String, dynamic> map) {
    return Departement(
      id: map['id']?.toInt() ?? 0,
      departemenName: map['departemenName'],
      desc: map['desc'],
    );
  }
}
