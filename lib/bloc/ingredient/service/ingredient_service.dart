import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/ingredient/model/ingredient_model.dart';

abstract class IIngredeintService{
 IIngredeintService(this.dio);
   final Dio   dio ;
   final _path = "api/Ingredeint";
   Future<List<IngredientModel>?> getAllIngredient();
   Future<List<IngredientModel>?> getSearchIngredient(String letter);
   Future<IngredientModel?> getByIdIngredeint(String id);
}


class IngredeintService extends IIngredeintService{
  IngredeintService(Dio dio) : super(dio);

  @override
  Future<List<IngredientModel>?> getAllIngredient() async {
    try {
      final response = await dio.get('$_path/GetAllIngredeint');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic>? ingredientList = responseData['ingredeints'];
        if (ingredientList != null) {
          // Create a list of AllergyModel objects from the allergyList
          final List<IngredientModel> ingredients = ingredientList.map((json) => IngredientModel.fromJson(json as Map<String, dynamic>)).toList();
          // Return the list of AllergyModel objects
          return ingredients;
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
  Future<IngredientModel?> getByIdIngredeint(String id) async {
   try {
    final response = await dio.get('$_path/GetByIdIngredient', queryParameters: {'id': id});
    if (response.statusCode == 200) {
      final responseData = response.data;
      if (responseData != null && responseData is Map<String, dynamic>) {
        return IngredientModel.fromJson(responseData);
      } else {
        throw Exception('Invalid data format for IngredienModel');
      }
    } else {
      throw Exception('Failed to load ingredient with id: $id');
    }
  } catch (e) {
    print('Error in getByIdIngredeint: $e');
    return null; 
  }
  }

  @override
  Future<List<IngredientModel>?> getSearchIngredient(String letter) async {
    try {
      final response = await dio.get('$_path/GetSearchIngredients', queryParameters: {letter:letter});
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic>? ingredientList = responseData['ingredeints'];
        if (ingredientList != null) {
          // Create a list of AllergyModel objects from the allergyList
          final List<IngredientModel> ingredients = ingredientList.map((json) => IngredientModel.fromJson(json as Map<String, dynamic>)).toList();
          // Return the list of AllergyModel objects
          return ingredients;
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
}