
import 'package:recipe_wizard/pages/bottom_navigation.dart';
import 'package:recipe_wizard/pages/loginuser.dart';
import 'package:recipe_wizard/pages/signupuser.dart';

class NavigatorRoutes {
  static const paragfh = "/";
  final items = {
    paragfh: (context) => Login(),
    NavigateRoutes.home.withParaf: (context) => BottomNavigation(),
    NavigateRoutes.signup.withParaf: (context) => SignUp(),
  };
}

enum NavigateRoutes { init, home, signup }

extension NavigateRoutesExtension on NavigateRoutes {
  String get withParaf => "/$name";
}