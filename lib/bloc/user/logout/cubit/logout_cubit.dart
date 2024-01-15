import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/user/logout/cubit/logout_state.dart';
import 'package:recipe_wizard/bloc/user/logout/service/logout_service.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(ILogoutService logoutService)
      : _logoutService = logoutService,
        super(LogoutState());

  final ILogoutService _logoutService;

  Future<void> logoutUser() async {
    emit(state.copyWith(isLoading: true));
    final response = await _logoutService.logout();
    emit(state.copyWith(isLoading: false,model: response.data, isCompleted: response.data != null));
  }
}
