// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecipeModel _$UserRecipeModelFromJson(Map<String, dynamic> json) =>
    UserRecipeModel(
      json['id'] as String,
      DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$UserRecipeModelToJson(UserRecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
    };
