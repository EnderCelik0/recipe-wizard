import 'package:dio/dio.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';

abstract class IAllergyService{
 IAllergyService(this.dio);
   final Dio   dio ;
   final _path = "api/Allergy";
   Future<List<AllergyModel>?> getAllAllergy();
   Future<AllergyModel?> getByIdAllergy(String id);
}


class AllergyService extends IAllergyService{
  AllergyService(Dio dio) : super(dio);
  
  @override
  Future<List<AllergyModel>?> getAllAllergy() async {
try {
  final response = await dio.get('$_path');
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = response.data;
    final List<dynamic>? allergyList = responseData['allergyList'];
    if (allergyList != null) {
      // Create a list of AllergyModel objects from the allergyList
      final List<AllergyModel> allergies = allergyList.map((json) => AllergyModel.fromJson(json as Map<String, dynamic>)).toList();
      // Return the list of AllergyModel objects
      return allergies;
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
  Future<AllergyModel?> getByIdAllergy(String id) async {
     try {
    final response = await dio.get('$_path/GetByIdAllergy', queryParameters: {'id': id},);
    if (response.statusCode == 200) {
      final responseData = response.data;
      return AllergyModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load allergy with id: $id');
    }
  } catch (e) {
    print(e);
    return null; // veya isteğin başarısız olduğunu belirten başka bir değer döndürebilirsiniz
  }
  }
 

}