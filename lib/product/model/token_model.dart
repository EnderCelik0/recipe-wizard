import 'package:json_annotation/json_annotation.dart';
part'token_model.g.dart';

@JsonSerializable()
class TokenModel{
 final String? token;
final String? userId;

 TokenModel(this.token, this.userId);
 factory TokenModel.fromJson(Map<String,dynamic>  json) =>
  _$TokenModelFromJson(json);
  Map<String,dynamic> toJson()=> _$TokenModelToJson(this); 
}