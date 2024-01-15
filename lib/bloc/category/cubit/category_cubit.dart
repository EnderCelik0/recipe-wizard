import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/category/cubit/category_state.dart';
import 'package:recipe_wizard/bloc/category/service/category_service.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(ICategoryService categoryService) : _categoryService=categoryService, super(CategoryState());
 
 final ICategoryService _categoryService;
  
 Future<void> getAllCategory() async {
  emit(state.copyWith(isLoading: true));
  final response = await _categoryService.getAllCategory();
  emit(state.copyWith(isLoading: false , models: response,  isCompleted: response != null ));
 }
 
 Future<void> getByIdCategory(String id) async {
  emit(state.copyWith(isLoading: true));
  final response = await _categoryService.getByIdCategory(id);
  emit(state.copyWith(isLoading: false , model: response,  isCompleted: response != null ));
 }
}