import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/ingredient/service/ingredient_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';

void main(){
late IIngredeintService ingredeintService;

 setUp(() {
  ingredeintService = IngredeintService(ProjectNetworkManager.instance.service);
 });

test('Ingredeint Get All Test', () async {
  final response = await  ingredeintService.getAllIngredient();
  expect(response, isNotNull); 
  for (var item in response!) {
     print(item.toString());
  } 
  print(response.length);
});
test('Ingredient search letter Get', () async {
  final response = await ingredeintService.getSearchIngredient("ch");
  expect(response, isNotNull); 
  for (var item in response!) {
     print(item.toString());
  } 
  print(response.length);
});
}