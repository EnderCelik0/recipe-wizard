import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_email/update_email_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_password/update_password_model.dart';
abstract class IUserUpdateService{
  IUserUpdateService(this.dio);
   final Dio   dio ;
   final _path = "api/Users";
  Future<Response> updateEmailAsync(UpdateEmailModel model);
  Future<Response> updatePasswordAsync(UpdatePasswordModel model);
  Future<Response> updateUserNameAsync(UpdateEmailModel model);
}


class UserUpdateService extends IUserUpdateService{
  UserUpdateService(Dio dio) : super(dio);
  
  @override
  Future<Response> updateEmailAsync(UpdateEmailModel model) async {
  try {
    final response = await dio.post("$_path/UpdateEmail",data : model.toJson());
    return response;
  } catch (e) {
    // Hata durumunda hata mesajı içeren bir ResponseModel döndür
    return Response(data: {'succeeded': false, 'message': e.toString()},requestOptions: RequestOptions(path: _path));
  }
  }
  
  @override
  Future<Response> updatePasswordAsync(UpdatePasswordModel model) async {
   try {
    final response = await dio.post("$_path/UpdatePassword",data : model.toJson());
    return response;
  } catch (e) {
    // Hata durumunda hata mesajı içeren bir ResponseModel döndür
    return Response(data: {'succeeded': false, 'message': e.toString()},requestOptions: RequestOptions(path: _path));
  }
  }
  
  @override
  Future<Response> updateUserNameAsync(UpdateEmailModel model) async {
  try {
    final response = await dio.post("$_path/UpdateUserName",data : model.toJson());
    return response;
  } catch (e) {
    // Hata durumunda hata mesajı içeren bir ResponseModel döndür
    return Response(data: {'succeeded': false, 'message': e.toString()},requestOptions: RequestOptions(path: _path));
  }
  }
}