import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/category/model/category_model.dart';

abstract class ICategoryService{
 ICategoryService(this.dio);
   final Dio   dio ;
   final _path = "api/Category";
   Future<List<CategoryModel>?> getAllCategory();
   Future<CategoryModel?> getByIdCategory(String id);
}


class CategoryService extends ICategoryService{
  CategoryService(Dio dio) : super(dio);
  
  @override
  Future<List<CategoryModel>?> getAllCategory() async {
   try {
  final response = await dio.get('$_path/GetAllCategory');
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = response.data;
    final List<dynamic>? allergyList = responseData['categories'];
    if (allergyList != null) {
      // Create a list of AllergyModel objects from the allergyList
      final List<CategoryModel> categories = allergyList.map((json) => CategoryModel.fromJson(json as Map<String, dynamic>)).toList();
      // Return the list of AllergyModel objects
      return categories;
    } else {
      return null; // Return null if allergyList is not present in the response
    }
  } else {
    throw Exception('Failed to load allergies');
  }
} catch (e) {
  print(e);
  rethrow; // Optional: You can handle the error here or rethrow it to be handled elsewhere
}
  }
  
  @override
  Future<CategoryModel?> getByIdCategory(String id) async {
    try {
    final response = await dio.get('$_path/GetCategory', queryParameters: {'id': id});
    if (response.statusCode == 200) {
      final responseData = response.data;
      if (responseData != null && responseData is Map<String, dynamic>) {
        return CategoryModel.fromJson(responseData);
      } else {
        throw Exception('Invalid data format for CategoryModel');
      }
    } else {
      throw Exception('Failed to load category with id: $id');
    }
  } catch (e) {
    print('Error in getByIdCategory: $e');
    return null; // veya isteğin başarısız olduğunu belirten başka bir değer döndürebilirsiniz
  }
  }

}