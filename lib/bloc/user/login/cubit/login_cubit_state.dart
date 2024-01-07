import 'package:equatable/equatable.dart';
import 'package:recipe_wizard/bloc/user/login/model/login_model.dart';
import 'package:recipe_wizard/product/model/token_model.dart';

class LoginState extends Equatable{
 final bool isLoading;
 final LoginModel? model;
 final TokenModel? tokenModel;
 final bool isCompleted;

   LoginState({
    this.isLoading = false,
    this.isCompleted = false,
    this.model,
    this.tokenModel
  });

  // TODO: implement props
    LoginState copyWith({
    bool? isLoading,
    LoginModel? model,
    TokenModel? tokenModel,
    bool? isCompleted    
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      model: model ?? this.model,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false
    );
 }
 
  @override
  // TODO: implement props
   List<Object?> get props => [isLoading,model,tokenModel,isCompleted];
}