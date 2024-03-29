import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_wizard/bloc/user/login/cubit/login_cubit.dart';
import 'package:recipe_wizard/bloc/user/login/cubit/login_cubit_state.dart';
import 'package:recipe_wizard/bloc/user/login/service/login_service.dart';
import 'package:recipe_wizard/components/text_field.dart';
import 'package:recipe_wizard/core/service/project_dio_manager.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/components/custom_alert_dialog.dart';
import 'package:recipe_wizard/product/navigator/navigator_routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAlertDialog(bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          success: success,
          content: success
              ? 'Giriş başarılı. Yönlendiriliyorsunuz.'
              : 'Kullanıcı adı veya şifre hatalı. Lütfen tekrar deneyin.',
          redirectTo: success ? BottomNavigation() : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) =>
          LoginCubit(LoginService(ProjectNetworkManager.instance.service)),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? CircularProgressIndicator(
                      color: Theme.of(context).secondaryHeaderColor)
                  : const SizedBox();
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,

                // Karıştırma modu
              ),
              image: const AssetImage(
                  'assets/backgrounds/bg2.jpg'), // Arka plan resmini değiştirebilirsiniz
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Kullanıcı Adı',
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    label: 'Şifre',
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state.isCompleted) {
                        _showAlertDialog(state.isLoading);
                        
                      }
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.brown[400]!,
                          ),
                        ),
                        onPressed: () {
                          context.read<LoginCubit>().checkUser(
                            _usernameController.text,
                            _passwordController.text,
                          );
                            if (state.tokenModel != null) {
                          Navigator.of(context).pushNamed(
                            NavigateRoutes.home.withParaf,
                            arguments: state.tokenModel,
                          );
                         }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(onPressed: (){
                   Navigator.of(context).pushNamed(NavigateRoutes.signup.withParaf);
                  }
                  , child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
