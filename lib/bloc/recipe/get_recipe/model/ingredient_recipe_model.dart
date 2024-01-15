import 'package:json_annotation/json_annotation.dart';

part 'ingredient_recipe_model.g.dart';

@JsonSerializable()
class IngredientRecipeModel {
  
  final String ingredientId;
  final String ingredientName;
  final String id;
  final String amount;

  IngredientRecipeModel(this.ingredientId, this.id, this.amount, this.ingredientName);

  factory IngredientRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientRecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientRecipeModelToJson(this);
}
