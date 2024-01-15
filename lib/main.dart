import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/pages/add_recipe.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/loginuser.dart';
import 'package:recipe_wizard/pages/signupuser.dart';

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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.green[400],
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[400],
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
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
      home: Login(),
    );
  }
}
