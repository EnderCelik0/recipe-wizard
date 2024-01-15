import 'package:json_annotation/json_annotation.dart';

part 'user_recipe_model.g.dart';

@JsonSerializable()
class UserRecipeModel {

  final String id;
  final DateTime createdDate;

  UserRecipeModel(this.id, this.createdDate);

  factory UserRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$UserRecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRecipeModelToJson(this);
}