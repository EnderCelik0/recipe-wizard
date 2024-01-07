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
  Future<List<AllergyModel>?> getAllAllergy() {
    // TODO: implement getAllAllergy
    throw UnimplementedError();
  }
  
  @override
  Future<AllergyModel?> getByIdAllergy(String id) {
    // TODO: implement getByIdAllergy
    throw UnimplementedError();
  }
 

}