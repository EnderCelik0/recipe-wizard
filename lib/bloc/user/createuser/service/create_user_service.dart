import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/user/createuser/model/user_model.dart';

abstract class ICreateSUserService{
  ICreateSUserService(this.dio);
   final Dio   dio ;
   final _path = "api/Users/CreateUser";
  Future<Response> signUp(UserModel model);
}


class CreateUserService extends ICreateSUserService{
  CreateUserService(Dio dio) : super(dio);
  
  @override
  Future<Response> signUp(UserModel model) async {
   try {
    final response = await dio.post(_path,data : model.toJson());
    return response;
  } catch (e) {
    // Hata durumunda hata mesajı içeren bir ResponseModel döndür
    return Response(data: {'succeeded': false, 'message': e.toString()},requestOptions: RequestOptions(path: _path));
  }
  }
}