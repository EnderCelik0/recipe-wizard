// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_get_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
      json['id'] as String,
      DateTime.parse(json['createdDate'] as String),
      json['recipeText'] as String,
      json['cookingTime'] as int,
      json['preparationTime'] as int,
      json['userId'] as String,
      json['allergyId'] as String,
      AllergyModel.fromJson(json['allergy'] as Map<String, dynamic>),
      UserRecipeModel.fromJson(json['writer'] as Map<String, dynamic>),
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['ingredients'] as List<dynamic>)
          .map((e) => IngredientRecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecipeModelToJson(RecipeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
      'recipeText': instance.recipeText,
      'cookingTime': instance.cookingTime,
      'preparationTime': instance.preparationTime,
      'userId': instance.userId,
      'allergyId': instance.allergyId,
      'allergy': instance.allergy,
      'writer': instance.writer,
      'categories': instance.categories,
      'ingredients': instance.ingredients,
    };
