import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/ingredient/cubit/ingredeint_state.dart';
import 'package:recipe_wizard/bloc/ingredient/service/ingredient_service.dart';



class IngredientCubit extends Cubit<IngredientState> { 
IngredientCubit(IIngredeintService ingredientService) : _ingredientService = ingredientService,super(IngredientState());

  final IIngredeintService _ingredientService; 

  Future<void> getAllIngredients() async { 
    emit(state.copyWith(isLoading: true));
    final response = await _ingredientService.getAllIngredient();
    emit(state.copyWith(isLoading: false, models: response, isCompleted: response != null));
  }

  Future<void> getSearchIngredient(String letter) async { // Updated method name
    emit(state.copyWith(isLoading: true));
    final response = await _ingredientService.getSearchIngredient(letter); // Updated method call
    emit(state.copyWith(isLoading: false, models: response, isCompleted: response != null));
  }
}
