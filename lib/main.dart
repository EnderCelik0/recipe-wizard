import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/SignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amberAccent,
          unselectedLabelColor: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[400],
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[400],
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(145, 100, 0, 1),
        ),
      ),
      home: SignUp(),
    );
  }
}
