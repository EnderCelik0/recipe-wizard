import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:recipe_wizard/pages/Login.dart';
import 'package:recipe_wizard/pages/loginuser.dart';
//import 'package:recipe_wizard/pages/add_recipe.dart';
//import 'package:recipe_wizard/pages/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amberAccent,
          unselectedLabelColor: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.deepPurple[900],
          selectedItemColor: Colors.deepPurple[700],
          unselectedItemColor: Colors.white,
        ),
      ),
      home:Login(),
    );
  }
}
