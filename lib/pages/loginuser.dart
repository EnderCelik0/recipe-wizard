import 'package:flutter/material.dart';
import 'package:recipe_wizard/components/text_field.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/signupuser.dart';
import 'package:recipe_wizard/components/custom_alert_dialog.dart'; 

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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,

              // Karıştırma modu
            ),
            image: const AssetImage(
                'assets/bg2.jpg'), // Arka plan resmini değiştirebilirsiniz
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
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Şifre',
                  controller: _passwordController,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Şifre',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.brown[400]!,
                  )),
                  onPressed: () {
                    // Örnek kontrol, gerçek giriş doğrulama mantığınızı burada uygulayın
                    bool loginSuccess = _usernameController.text == 'demo' &&
                        _passwordController.text == 'password';

                    _showAlertDialog(loginSuccess);
                  },
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
