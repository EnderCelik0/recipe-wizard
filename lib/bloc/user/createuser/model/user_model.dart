import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';
import 'package:recipe_wizard/bloc/category/model/category_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String nameSurname;
  final String email;
  final String userName;
  final String password;
  final String passwordConfirm;
  final List<AllergyModel> addAllergy;
  final List<CategoryModel> addFavoriteCategories;

  UserModel({
    required this.nameSurname,
    required this.email,
    required this.userName,
    required this.password,
    required this.passwordConfirm,
    required this.addAllergy,
    required this.addFavoriteCategories,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
