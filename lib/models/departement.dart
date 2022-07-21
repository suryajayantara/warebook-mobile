import 'package:json_annotation/json_annotation.dart';
part 'departement.g.dart';

@JsonSerializable()
class Departement {
  final String? departemenName;
  final String? desc;

  Departement({
    this.departemenName,
    this.desc,
  });

  Departement copyWith({
    String? departemenName,
    String? desc,
  }) {
    return Departement(
      departemenName: departemenName ?? this.departemenName,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() => _$DepartementToJson(this);

  factory Departement.fromJson(Map<String, dynamic> map) =>
      _$DepartementFromJson(map);
  @override
  String toString() =>
      'Departement(departemenName: $departemenName, desc: $desc)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Departement &&
        other.departemenName == departemenName &&
        other.desc == desc;
  }

  @override
  int get hashCode => departemenName.hashCode ^ desc.hashCode;
}
