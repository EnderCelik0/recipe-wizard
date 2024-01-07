import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/signupuser.dart';


class Login extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            image: const AssetImage('assets/bg2.jpg'), // Arka plan resmini değiştirebilirsiniz
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    filled: true,
                    
                    border: OutlineInputBorder(),
                  ),
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
                  onPressed: () {
                    // Kayıt ol butonuna tıklama işlemleri buraya gelecek
                    _handleSignUp();
                  },
                  child: const Text('Kayıt Ol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSignUp() {
    // Kayıt işlemleri burada yapılacak
    // Kullanıcı adı ve şifre gibi bilgileri kullanarak backend'e kayıt yapabilirsiniz
    // Ardından giriş ekranına yönlendirebilirsiniz
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
