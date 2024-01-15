import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_email/update_email_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_password/update_password_model.dart';
import 'package:recipe_wizard/product/model/response_model.dart';

class UserUpdateState extends Equatable {
  final bool isLoading;
  final bool isCompleted;
  final ResponseModel? responseModel;
  final UpdateEmailModel? emailModel;
  final UpdatePasswordModel? passwordModel;

  UserUpdateState({
    this.isLoading = false,
    this.isCompleted = false,
    this.responseModel,
    this.emailModel,
    this.passwordModel
  });

  UserUpdateState copyWith({
    bool? isLoading,
    bool? isCompleted,
    ResponseModel? responseModel,
    UpdatePasswordModel? passwordModel,
    UpdateEmailModel? emailModel
  }) {
    return UserUpdateState(
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
      responseModel: responseModel ?? this.responseModel,
      emailModel: emailModel ?? this.emailModel,
      passwordModel: passwordModel ?? this.passwordModel
    );
  }

  @override
  List<Object?> get props => [isLoading, isCompleted, responseModel,passwordModel,emailModel];
}
