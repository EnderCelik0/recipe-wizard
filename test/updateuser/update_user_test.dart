import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_email/update_email_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_password/update_password_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/service/user_update_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

void main(){
late IUserUpdateService updateService;

 setUp(() {
  updateService = UserUpdateService(ProjectNetworkManager.instance.service);
 });
test('Update Email Test', () async {
 final response = await updateService.updateEmailAsync(UpdateEmailModel("deneme123@gmail.com", "deneme456@gmail.com"));
  expect(response, isNotNull);
  print(response);
   // Response içindeki JSON verilerini ResponseModel'e dönüştür
 print(response.data);
 ResponseModel model = ResponseModel.fromJson(response.data!);
 print(model.succeded);
});

test('Update Password Test', () async {
 final response = await updateService.updatePasswordAsync(UpdatePasswordModel("zehir123", "deneme123","deneme123"));
  expect(response, isNotNull);
  print(response);
   // Response içindeki JSON verilerini ResponseModel'e dönüştür
 print(response.data);
 ResponseModel model = ResponseModel.fromJson(response.data!);
 print(model.succeded);
});
test('Update UserName Test', () async {
 final response = await updateService.updateUserNameAsync(UpdateEmailModel("zehir123", "hicran123"));
  expect(response, isNotNull);
  print(response);
   // Response içindeki JSON verilerini ResponseModel'e dönüştür
 print(response.data);
 ResponseModel model = ResponseModel.fromJson(response.data!);
 print(model.succeded);
});
}