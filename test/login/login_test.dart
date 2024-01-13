import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/user/login/model/login_model.dart';
import 'package:recipe_wizard/bloc/user/login/service/login_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';

void main(){
late ILoginService loginService;

 setUp(() {
  loginService = LoginService(ProjectNetworkManager.instance.service);
 });
//LoginModel('eve.holt@reqres.in', 'cityslicka')
 test('Login Test', () async{
  final response = await loginService.login(LoginModel('kubi02@gmail.com', 'hello123'));
  final responseData = response.data as Map<String, dynamic>?; // Cast response.data to Map<String, dynamic>
  final userId = responseData?['userId'] as String?; // Access userId from responseData
  expect(userId, isNotNull); // Check if userId is not null in the response
  print('User ID: $userId'); // Print the userId from the response
 });
}