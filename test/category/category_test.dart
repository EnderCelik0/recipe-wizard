import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_wizard/bloc/category/service/category_service.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';

void main(){
late ICategoryService categoryService;

 setUp(() {
  categoryService = CategoryService(ProjectNetworkManager.instance.service);
 });

test('CategoryGet All Test', () async {
  final response = await categoryService.getAllCategory();
  expect(response, isNotNull); 
  for (var item in response!) {
     print(item.toString());
  } 
  print(response.length);
});
test('Category Get By Id Test', () async {
  final response = await categoryService.getByIdCategory("039e247c-07b9-4b66-9373-60928b27e335");
  expect(response, isNotNull); 

 print(response.toString());
});
}