import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/user/userupdate/cubit/user_update_state.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_email/update_email_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/model/update_password/update_password_model.dart';
import 'package:recipe_wizard/bloc/user/userupdate/service/user_update_service.dart';

class UserUpdateCubit extends Cubit<UserUpdateState> {
 UserUpdateCubit(IUserUpdateService userUpdateService) : _userUpdateService = userUpdateService, super(UserUpdateState());

  final IUserUpdateService _userUpdateService;
 Future<void> updateEmail(UpdateEmailModel emailModel) async {
    emit(state.copyWith(isLoading: true,emailModel: UpdateEmailModel(emailModel.currentEmail, emailModel.newEmail)));
    final response = await _userUpdateService.updateEmailAsync(state.emailModel!);
    emit(state.copyWith(isLoading: false, isCompleted: response.data != null, responseModel: response.data));
  }
  Future<void> updatePassword(UpdatePasswordModel passwordModel) async {
    emit(state.copyWith(isLoading: true,passwordModel : UpdatePasswordModel(passwordModel.userNameorEmail, passwordModel.newPassword, passwordModel.newPasswordConfirm)));
    final response = await _userUpdateService.updatePasswordAsync(state.passwordModel!);
    emit(state.copyWith(isLoading: false, isCompleted: response.data != null, responseModel: response.data));
  }
  Future<void> updateuserName(UpdateEmailModel emailModel) async {
    emit(state.copyWith(isLoading: true,emailModel: UpdateEmailModel(emailModel.currentEmail, emailModel.newEmail)));
    final response = await _userUpdateService.updateUserNameAsync(state.emailModel!);
    emit(state.copyWith(isLoading: false, isCompleted: response.data != null, responseModel: response.data));
  }
 

}


