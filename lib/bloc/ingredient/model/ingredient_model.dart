import 'package:json_annotation/json_annotation.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  
  final String ingredientId;
  final String ingredientName;

  IngredientModel(this.ingredientId, this.ingredientName);

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
