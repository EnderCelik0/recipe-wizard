import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

class LogoutState extends Equatable {
  final bool isLoading;
  final bool isCompleted;
  final ResponseModel? model;

  LogoutState( {
    this.isLoading = false,
    this.isCompleted = false,
    this.model
  });

  LogoutState copyWith({
    bool? isLoading = false,
    bool? isCompleted= false,
    ResponseModel? model,
  }) {
    return LogoutState(
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
      model: model ?? this.model,
    );
  }

  @override
  List<Object?> get props => [isLoading, isCompleted,model];
}
