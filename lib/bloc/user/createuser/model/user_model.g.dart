// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      nameSurname: json['nameSurname'] as String,
      email: json['email'] as String,
      userName: json['userName'] as String,
      password: json['password'] as String,
      passwordConfirm: json['passwordConfirm'] as String,
      addAllergy: (json['addAllergy'] as List<dynamic>)
          .map((e) => AllergyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      addFavoriteCategories: (json['addFavoriteCategories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'nameSurname': instance.nameSurname,
      'email': instance.email,
      'userName': instance.userName,
      'password': instance.password,
      'passwordConfirm': instance.passwordConfirm,
      'addAllergy': instance.addAllergy,
      'addFavoriteCategories': instance.addFavoriteCategories,
    };
