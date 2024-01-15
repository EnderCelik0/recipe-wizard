import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/allergy/cubit/allergy_state.dart';
import 'package:recipe_wizard/bloc/allergy/service/allergy_service.dart';


class AllergyCubit extends Cubit<AllergyState> {
  AllergyCubit(IAllergyService allergyService) : _allergyService=allergyService, super(AllergyState());
 
 final IAllergyService _allergyService;
  
 Future<void> getAllAllergy() async {
  emit(state.copyWith(isLoading: true));
  final response = await _allergyService.getAllAllergy();
  emit(state.copyWith(isLoading: false , models: response,  isCompleted: response != null ));
 }
 
 Future<void> getByIdAllergy(String id) async {
  emit(state.copyWith(isLoading: true));
  final response = await _allergyService.getByIdAllergy(id);
  emit(state.copyWith(isLoading: false , model: response,  isCompleted: response != null ));
 }
}