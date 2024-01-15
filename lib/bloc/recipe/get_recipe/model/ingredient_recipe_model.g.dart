// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientRecipeModel _$IngredientRecipeModelFromJson(
        Map<String, dynamic> json) =>
    IngredientRecipeModel(
      json['ingredientId'] as String,
      json['id'] as String,
      json['amount'] as String,
      json['ingredientName'] as String,
    );

Map<String, dynamic> _$IngredientRecipeModelToJson(
        IngredientRecipeModel instance) =>
    <String, dynamic>{
      'ingredientId': instance.ingredientId,
      'ingredientName': instance.ingredientName,
      'id': instance.id,
      'amount': instance.amount,
    };
