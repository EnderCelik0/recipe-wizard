import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/category/model/category_model.dart';

class CategoryState extends Equatable{
 final bool isLoading;
 final CategoryModel? model;
 final List<CategoryModel>? models;
 final bool isCompleted;

   CategoryState({
    this.isLoading = false,
    this.isCompleted = false,
    this.model,
    this.models
  });

  // TODO: implement props
    CategoryState copyWith({
    bool? isLoading,
    CategoryModel? model,
    List<CategoryModel>? models,
    bool? isCompleted    
  }) {
    return CategoryState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      models: models ?? this.models,
      isCompleted: isCompleted ?? false
    );
 }
 
  @override
  // TODO: implement props
   List<Object?> get props => [isLoading,model,models,isCompleted];
}