// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_research.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalResearch _$InternalResearchFromJson(Map<String, dynamic> json) =>
    InternalResearch(
      id: json['id'] as int?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      budgetType: json['budget_type'] as String?,
      budget: json['budget'] as int?,
      projectStartedAt: toNull(json['project_started_at']),
      projectFinishAt: toNull(json['project_finish_at']),
      contractNumber: json['contract_number'] as String?,
      teamMember: json['team_member'] as String?,
      contractUrl: json['contract_url'] as String?,
      proposalUrl: json['proposal_url'] as String?,
      documentUrl: json['document_url'] as String?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InternalResearchToJson(InternalResearch instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'abstract': instance.abstract,
    'budget_type': instance.budgetType,
    'budget': instance.budget,
    'project_started_at': instance.projectStartedAt?.toIso8601String(),
    'project_finish_at': instance.projectFinishAt?.toIso8601String(),
    'contract_number': instance.contractNumber,
    'team_member': instance.teamMember,
    'contract_url': instance.contractUrl,
    'proposal_url': instance.proposalUrl,
    'document_url': instance.documentUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('users', toNull(instance.users));
  return val;
}
