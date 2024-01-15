import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel{

 final String usernameOrEmail;
 final String password;

 LoginModel( this.usernameOrEmail,this.password, );

 factory LoginModel.fromJson(Map<String,dynamic>  json) =>
  _$LoginModelFromJson(json);

Map<String,dynamic> toJson()=> _$LoginModelToJson(this); 

}