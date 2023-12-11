import 'package:flutter/cupertino.dart';

class NavigationController {
  static Route _buildRoute(Widget route) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => route,
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation.drive(
              Tween(begin: 0.5, end: 1.0),
            ),
            child: child,
          );
        });
  }

  static navigateTo(BuildContext context, Widget route, {bool removePrevious =false}) {
    if(removePrevious){
      Navigator.pushReplacement(context, _buildRoute(route));
      return;
    }
    Navigator.push(context, _buildRoute(route));
  }
}
