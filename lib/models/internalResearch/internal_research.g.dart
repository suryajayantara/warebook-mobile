// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internal_research.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternalResearch _$InternalResearchFromJson(Map<String, dynamic> json) =>
    InternalResearch(
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      budgetType: json['budgetType'] as String?,
      budget: json['budget'] as int?,
      projectStartedAt: json['projectStartedAt'] == null
          ? null
          : DateTime.parse(json['projectStartedAt'] as String),
      projectFinishAt: json['projectFinishAt'] == null
          ? null
          : DateTime.parse(json['projectFinishAt'] as String),
      contractNumber: json['contractNumber'] as String?,
      teamMember: json['teamMember'] as String?,
      contractUrl: json['contractUrl'] as String?,
      proposalUrl: json['proposalUrl'] as String?,
      documentUrl: json['documentUrl'] as String?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InternalResearchToJson(InternalResearch instance) =>
    <String, dynamic>{
      'title': instance.title,
      'abstract': instance.abstract,
      'budgetType': instance.budgetType,
      'budget': instance.budget,
      'projectStartedAt': instance.projectStartedAt?.toIso8601String(),
      'projectFinishAt': instance.projectFinishAt?.toIso8601String(),
      'contractNumber': instance.contractNumber,
      'teamMember': instance.teamMember,
      'contractUrl': instance.contractUrl,
      'proposalUrl': instance.proposalUrl,
      'documentUrl': instance.documentUrl,
      'users': instance.users,
    };
