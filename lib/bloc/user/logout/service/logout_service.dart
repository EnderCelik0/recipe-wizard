import 'package:dio/dio.dart';

abstract class ILogoutService{
  ILogoutService(this.dio);
   final Dio   dio ;
   final _path = "api/Users/Logout";
  Future<Response> logout();
}
class LogoutService extends ILogoutService{
  LogoutService(Dio dio) : super(dio);
  
@override
Future<Response> logout() async {
  try {
    // Dio kullanarak logout isteği yap
    final response = await dio.post(_path,data : "{}");
    // Yanıtı geri döndür
    return response;
  } catch (e) {
    // Hata durumunda hata mesajı içeren bir ResponseModel döndür
    return Response(data: {'succeeded': false, 'message': e.toString()},requestOptions: RequestOptions(path: _path));
  }
}

}
