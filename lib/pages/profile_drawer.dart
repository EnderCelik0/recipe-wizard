import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/add_recipe.dart';
import 'package:recipe_wizard/pages/change_email.dart';
import 'package:recipe_wizard/pages/change_password.dart';
import 'package:recipe_wizard/pages/loginuser.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Kullanıcı Adı'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.jpg'),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.add),
            title: Text('Tarif Ekle'),
            onTap: () {
              Navigator.pop(context); // Drawer'ı kapat
              _navigateToAddRecipe(context);
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context);

              // Ayarlar sayfasına yönlendirme işlemleri buraya eklenir
              _navigateToSettings(context);
            },
          ),
          Divider(),
          Spacer(), // Spacer ekledik
          ListTile(
            leading: Icon(Icons.logout_rounded, color: Colors.red),
            title: Text('Çıkış Yap', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              _navigateToLogin(context);
            },
          ),
        ],
      ),
    );
  }
}

void _navigateToLogin(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Login(),
    ),
  );
}

void _navigateToAddRecipe(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddRecipe(), // AddRecipe sayfasına geçiş
    ),
  );
}

void _navigateToSettings(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SettingsPage(), // SettingsPage sayfasına geçiş
    ),
  );
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Column(
        children: [
          ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Şifre Değiştir'),
              onTap: () {
                Navigator.pop(context); // SettingsPage sayfasını kapat
                _navigateToChangePassword(context);
              }),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('E-posta Değiştir'),
            onTap: () {
              Navigator.pop(context);
              _navigateToChangeEmail(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.extension),
            title: Text('Seçenek 1'),
            onTap: () {
              // Seçenek 1 işlemleri buraya eklenir
            },
          ),
          ListTile(
            leading: Icon(Icons.extension),
            title: Text('Seçenek 2'),
            onTap: () {
              // Seçenek 2 işlemleri buraya eklenir
            },
          ),
        ],
      ),
    );
  }

  void _navigateToChangePassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ChangePasswordPage(), // ChangePasswordPage sayfasına geçiş
      ),
    );
  }

  void _navigateToChangeEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ChangeEmailPage(), // ChangePasswordPage sayfasına geçiş
      ),
    );
  }
}
