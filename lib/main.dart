import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/loginuser.dart';
import 'package:recipe_wizard/product/navigator/navigator_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amberAccent,
          unselectedLabelColor: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(145, 100, 0, 1),
        ),
      ),
      routes: NavigatorRoutes().items,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        );
      },
    );
  }
}
