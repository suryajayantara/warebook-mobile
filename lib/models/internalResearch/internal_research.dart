import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:warebook_mobile/models/users.dart';

part 'internal_research.g.dart';

@JsonSerializable()
class InternalResearch {
  String? title;
  String? abstract;
  @JsonKey(name: 'budget_type')
  String? budgetType;
  @JsonKey(toJson: toInt)
  int? budget;
  @JsonKey(name: 'project_started_at')
  DateTime? projectStartedAt;
  @JsonKey(name: 'project_finish_at')
  DateTime? projectFinishAt;
  @JsonKey(name: 'contract_number')
  String? contractNumber;
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
    String? title,
    String? abstract,
    String? budgetType,
    int? budget,
    DateTime? projectStartedAt,
    DateTime? projectFinishAt,
    String? contractNumber,
    String? teamMember,
    String? contractUrl,
    String? proposalUrl,
    String? documentUrl,
    Users? users,
  }) {
    return InternalResearch(
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
    return 'InternalResearch(title: $title, abstract: $abstract, budgetType: $budgetType, budget: $budget, projectStartedAt: $projectStartedAt, projectFinishAt: $projectFinishAt, contractNumber: $contractNumber, teamMember: $teamMember, contractUrl: $contractUrl, proposalUrl: $proposalUrl, documentUrl: $documentUrl, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is InternalResearch &&
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
    return title.hashCode ^
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

toString(_) {
  return _.toString();
}


toInt(_) {
  return int.parse(_);
}

toNull(_) {
  return null;
}
