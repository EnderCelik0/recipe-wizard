import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/user/createuser/cubit/create_user_state.dart';
import 'package:recipe_wizard/bloc/user/createuser/model/user_model.dart';
import 'package:recipe_wizard/bloc/user/createuser/service/create_user_service.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
 CreateUserCubit(ICreateSUserService createUserService) :_createUserService=createUserService ,super(CreateUserState());

  final ICreateSUserService _createUserService;

  Future<void> createUser(UserModel userModel) async {
    emit(state.copyWith(isLoading: true,userModel: UserModel(nameSurname: userModel.nameSurname, email: userModel.email, userName: userModel.userName, password: userModel.password, passwordConfirm: userModel.passwordConfirm, addAllergy: userModel.addAllergy, addFavoriteCategories: userModel.addFavoriteCategories)));
    final response = await _createUserService.signUp(state.userModel!);
    emit(state.copyWith(isLoading: false, isCompleted: response.data != null, responseModel: response.data));
      
    }
  }

