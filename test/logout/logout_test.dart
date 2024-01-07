import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/user/logout/service/logout_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

void main(){
late ILogoutService logoutService;

 setUp(() {
  logoutService = LogoutService(ProjectNetworkManager.instance.service);
 });
test('Logout Test', () async {
  final response = await logoutService.logout();
  expect(response, isNotNull);
  print(response);
   // Response içindeki JSON verilerini ResponseModel'e dönüştür
 print(response.data);
 ResponseModel model = ResponseModel.fromJson(response.data!);
 print(model.succeded);
});
}