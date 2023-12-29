import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/add_recipe.dart';

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

              ;
            },
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context);
              // Ayarlar sayfasına yönlendirme işlemleri buraya eklenir
            },
          ),
          Divider(),
          Spacer(), // Spacer ekledik
          ListTile(
            leading:
                Icon(CupertinoIcons.clear_circled_solid, color: Colors.red),
            title: Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
              // Log out işlemleri buraya eklenir
            },
          ),
        ],
      ),
    );
  }
}

void _navigateToAddRecipe(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => AddRecipe()), // AddRecipe sayfasına geçiş
  );
}
