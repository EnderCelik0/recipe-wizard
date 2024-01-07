// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllergyModel _$AllergyModelFromJson(Map<String, dynamic> json) => AllergyModel(
      name: json['name'] as String,
      id: json['id'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$AllergyModelToJson(AllergyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
    };
