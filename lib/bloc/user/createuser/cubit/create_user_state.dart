import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/user/createuser/model/user_model.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

class CreateUserState extends Equatable {
  final bool isLoading;
  final bool isCompleted;
  final ResponseModel? responsModel;
  final UserModel? userModel;


  CreateUserState({
    this.isLoading = false,
    this.isCompleted = false,
    this.responsModel,
    this.userModel
  });

  CreateUserState copyWith({
    bool? isLoading,
    bool? isCompleted,
    ResponseModel? responseModel,
    UserModel? userModel,
  }) {
    return CreateUserState(
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
      responsModel: responsModel ?? this.responsModel,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, isCompleted, responsModel,userModel];
}
