import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/allergy/service/allergy_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';

void main(){
late IAllergyService allergyService;

 setUp(() {
  allergyService = AllergyService(ProjectNetworkManager.instance.service);
 });

test('Allergy Get All Test', () async {
  final response = await allergyService.getAllAllergy();
  expect(response, isNotNull); 
  for (var item in response!) {
     print(item.toString());
  } 
  print(response.length);
});
test('Allergy Get By Id Test', () async {
  final response = await allergyService.getByIdAllergy("749717d6-5f02-4028-bc97-49f5ce8ae36b");
  expect(response, isNotNull); 

 print(response.toString());

  
});
}