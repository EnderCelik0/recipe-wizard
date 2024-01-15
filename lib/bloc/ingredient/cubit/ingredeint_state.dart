import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';
import 'package:recipe_wizard/bloc/ingredient/model/ingredient_model.dart';

class IngredientState extends Equatable {
  final bool isLoading;
  final IngredientModel? model;
  final List<IngredientModel>? models;
  final bool isCompleted;

  IngredientState({
    this.isLoading = false,
    this.isCompleted = false,
    this.model,
    this.models,
  });

  IngredientState copyWith({
    bool? isLoading,
    IngredientModel? model,
    List<IngredientModel>? models,
    bool? isCompleted,
  }) {
    return IngredientState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      models: models ?? this.models,
      isCompleted: isCompleted ?? false,
    );
  }

  @override
  List<Object?> get props => [isLoading, model, models, isCompleted];
}
