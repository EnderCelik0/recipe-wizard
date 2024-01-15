import 'package:json_annotation/json_annotation.dart';
part 'update_email_model.g.dart';

@JsonSerializable()
class UpdateEmailModel{

 final String currentEmail;
 final String newEmail;

UpdateEmailModel(this.currentEmail, this.newEmail );

 factory UpdateEmailModel.fromJson(Map<String,dynamic>  json) =>
  _$UpdateEmailModelFromJson(json);

Map<String,dynamic> toJson()=> _$UpdateEmailModelToJson(this); 

}