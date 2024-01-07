import 'package:flutter/material.dart';
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/loginuser.dart';
import 'package:recipe_wizard/product/navigator/navigator_routes.dart';

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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(145, 100, 0, 1),
        ),
      ),
         onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        );
      },
    //  routes: NavigatorRoutes().items,
    home : BottomNavigation()
    );
  }
}
