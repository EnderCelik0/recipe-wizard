// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePasswordModel _$UpdatePasswordModelFromJson(Map<String, dynamic> json) =>
    UpdatePasswordModel(
      json['userNameorEmail'] as String,
      json['newPassword'] as String,
      json['newPasswordConfirm'] as String,
    );

Map<String, dynamic> _$UpdatePasswordModelToJson(
        UpdatePasswordModel instance) =>
    <String, dynamic>{
      'userNameorEmail': instance.userNameorEmail,
      'newPassword': instance.newPassword,
      'newPasswordConfirm': instance.newPasswordConfirm,
    };
