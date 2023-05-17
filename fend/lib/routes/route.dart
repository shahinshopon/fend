import 'package:allwellbuy/ui/views/login_page.dart';
import 'package:allwellbuy/ui/views/register_page.dart';
import 'package:allwellbuy/ui/views/sign_up_page.dart';
import 'package:allwellbuy/ui/views/welcome_page.dart';
import 'package:allwellbuy/ui/bottom_nav_controller.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String welcomePage = '/';
  static const String logindPage = '/loginPage';
  static const String signUpPage = '/signUpPage';
  static const String buttonNviBar = '/buttonNviBar';
  static const String registerPage = '/registerNviBar';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePage:
        return MaterialPageRoute(
          builder: (context) => WelcomePage(),
        );

      case logindPage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );

      case buttonNviBar:
        return MaterialPageRoute(
          builder: (context) => BottomNavController(),
        );

      case registerPage:
        return MaterialPageRoute(
          builder: (context) => RegisterPage(),
        );

      case signUpPage:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );

      default:
        throw FormatException("Route not found! Cheak routes again!");
    }
  }
}
