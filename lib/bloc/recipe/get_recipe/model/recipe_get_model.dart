import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';
import 'package:recipe_wizard/bloc/category/model/category_model.dart';
import 'package:recipe_wizard/bloc/recipe/get_recipe/model/ingredient_recipe_model.dart';
import 'package:recipe_wizard/bloc/recipe/get_recipe/model/user_recipe_model.dart';

part 'recipe_get_model.g.dart';

@JsonSerializable()
class RecipeModel {

  final String id;
  final DateTime createdDate;
  final String recipeText;
  final int cookingTime;
  final int preparationTime;
  final String userId;
  final String allergyId;
  final AllergyModel allergy;
  final UserRecipeModel writer;
  final List<CategoryModel> categories;
  final List<IngredientRecipeModel> ingredients;
  

  RecipeModel(this.id, this.createdDate, this.recipeText, this.cookingTime, this.preparationTime, this.userId, this.allergyId, this.allergy, this.writer, this.categories, this.ingredients);

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}