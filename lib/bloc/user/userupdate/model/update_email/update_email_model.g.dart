// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_email_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateEmailModel _$UpdateEmailModelFromJson(Map<String, dynamic> json) =>
    UpdateEmailModel(
      json['currentEmail'] as String,
      json['newEmail'] as String,
    );

Map<String, dynamic> _$UpdateEmailModelToJson(UpdateEmailModel instance) =>
    <String, dynamic>{
      'currentEmail': instance.currentEmail,
      'newEmail': instance.newEmail,
    };
