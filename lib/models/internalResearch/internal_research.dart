import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:warebook_mobile/models/users.dart';

part 'internal_research.g.dart';

@JsonSerializable()
class InternalResearch {
  int? id;
  String? title;
  String? abstract;
  @JsonKey(name: 'budget_type')
  String? budgetType;
  int? budget;
  @JsonKey(name: 'project_started_at')
  DateTime? projectStartedAt;
  @JsonKey(name: 'project_finish_at')
  DateTime? projectFinishAt;
  @JsonKey(name: 'contract_number', fromJson: toInt)
  int? contractNumber;
  @JsonKey(name: 'team_member')
  String? teamMember;
  @JsonKey(name: 'contract_url')
  String? contractUrl;  
  @JsonKey(name: 'proposal_url')
  String? proposalUrl;
  @JsonKey(name: 'document_url')
  String? documentUrl;
  @JsonKey(includeIfNull: false, toJson: toNull)
  Users? users;
  InternalResearch({
    this.id,
    this.title,
    this.abstract,
    this.budgetType,
    this.budget,
    this.projectStartedAt,
    this.projectFinishAt,
    this.contractNumber,
    this.teamMember,
    this.contractUrl,
    this.proposalUrl,
    this.documentUrl,
    this.users,
  });

  InternalResearch copyWith({
    int? id,
    String? title,
    String? abstract,
    String? budgetType,
    int? budget,
    DateTime? projectStartedAt,
    DateTime? projectFinishAt,
    int? contractNumber,
    String? teamMember,
    String? contractUrl,
    String? proposalUrl,
    String? documentUrl,
    Users? users,
  }) {
    return InternalResearch(
      id: id ?? this.id,
      title: title ?? this.title,
      abstract: abstract ?? this.abstract,
      budgetType: budgetType ?? this.budgetType,
      budget: budget ?? this.budget,
      projectStartedAt: projectStartedAt ?? this.projectStartedAt,
      projectFinishAt: projectFinishAt ?? this.projectFinishAt,
      contractNumber: contractNumber ?? this.contractNumber,
      teamMember: teamMember ?? this.teamMember,
      contractUrl: contractUrl ?? this.contractUrl,
      proposalUrl: proposalUrl ?? this.proposalUrl,
      documentUrl: documentUrl ?? this.documentUrl,
      users: users ?? this.users,
    );
  }

  Map<String, dynamic> toJson() => _$InternalResearchToJson(this);

  factory InternalResearch.fromJson(Map<String, dynamic> map) =>
      _$InternalResearchFromJson(map);

  @override
  String toString() {
    return 'InternalResearch(id: $id, title: $title, abstract: $abstract, budgetType: $budgetType, budget: $budget, projectStartedAt: $projectStartedAt, projectFinishAt: $projectFinishAt, contractNumber: $contractNumber, teamMember: $teamMember, contractUrl: $contractUrl, proposalUrl: $proposalUrl, documentUrl: $documentUrl, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is InternalResearch &&
        other.id == id &&
        other.title == title &&
        other.abstract == abstract &&
        other.budgetType == budgetType &&
        other.budget == budget &&
        other.projectStartedAt == projectStartedAt &&
        other.projectFinishAt == projectFinishAt &&
        other.contractNumber == contractNumber &&
        other.teamMember == teamMember &&
        other.contractUrl == contractUrl &&
        other.proposalUrl == proposalUrl &&
        other.documentUrl == documentUrl &&
        other.users == users;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        abstract.hashCode ^
        budgetType.hashCode ^
        budget.hashCode ^
        projectStartedAt.hashCode ^
        projectFinishAt.hashCode ^
        contractNumber.hashCode ^
        teamMember.hashCode ^
        contractUrl.hashCode ^
        proposalUrl.hashCode ^
        documentUrl.hashCode ^
        users.hashCode;
  }
}



toInt(_) {
  return int.parse(_.toString());
}

toNull(_) {
  return null;
}

toString(_) {
  return _.toString();
}
