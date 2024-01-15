import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/allergy/model/allergy_model.dart';

class AllergyState extends Equatable{
 final bool isLoading;
 final AllergyModel? model;
 final List<AllergyModel>? models;
 final bool isCompleted;

   AllergyState({
    this.isLoading = false,
    this.isCompleted = false,
    this.model,
    this.models
  });

  // TODO: implement props
    AllergyState copyWith({
    bool? isLoading,
    AllergyModel? model,
    List<AllergyModel>? models,
    bool? isCompleted    
  }) {
    return AllergyState(
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