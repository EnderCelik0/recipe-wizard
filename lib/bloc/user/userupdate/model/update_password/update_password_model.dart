import 'package:json_annotation/json_annotation.dart';
part 'update_password_model.g.dart';

@JsonSerializable()
class UpdatePasswordModel{

 final String userNameorEmail;
 final String newPassword;
 final String newPasswordConfirm;
UpdatePasswordModel(this.userNameorEmail, this.newPassword, this.newPasswordConfirm );

 factory UpdatePasswordModel.fromJson(Map<String,dynamic>  json) =>
  _$UpdatePasswordModelFromJson(json);

Map<String,dynamic> toJson()=> _$UpdatePasswordModelToJson(this); 

}