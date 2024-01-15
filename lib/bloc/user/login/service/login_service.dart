import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/user/login/model/login_model.dart';

abstract class ILoginService{
  ILoginService(this.dio);
   final Dio   dio ;
   final _path = "api/Users/Login";
  Future<Response> login(LoginModel model);
}


class LoginService extends ILoginService{
  LoginService(Dio dio) : super(dio);
 
 @override 
 Future<Response> login(LoginModel model) async {
   final response  = await dio.post(_path,data : model.toJson());

   return response;
 }
}