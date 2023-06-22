import 'package:flutter/material.dart';
import '/pages/login_page.dart';
import '/pages/users_page.dart';
import '/pages/weights_entrance.dart';
import '/pages/weights_exit.dart';
import 'pages/settings.dart';

class Router {
  // MenuPage menuPage = const MenuPage();MaterialPageRoute(builder: (_) => HomePage());
  //MenuPage.
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return FadeRoute(page: const LoginPage());
      case '/gateEnt':
        return FadeRoute(page: const WightsEntPage());
      case '/gateExit':
        return FadeRoute(page: const WeightsExitPage());
      case '/allWeights':
        return FadeRoute(page: const WeightsExitPage());
      case '/setting':
        return FadeRoute(page: const SettingPage());
      case '/users':
        return FadeRoute(page: const UserPage());
    }
    return null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget? page;

  FadeRoute({this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page ?? Container(),
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(opacity: animation, child: child),
        );
}
