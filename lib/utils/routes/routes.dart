import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routesName.dart';
import 'package:mvvm/view/home_Screen.dart';
import 'package:mvvm/view/login_View.dart';
import 'package:mvvm/view/signUp.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginView(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) => SignUp(),
        );
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('hello'),
            ),
          );
        });
    }
  }
}
