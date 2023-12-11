import 'package:flutter/material.dart';
import 'package:register_screen_task_2/controllers/navigation_controller.dart';
import 'package:register_screen_task_2/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ecommerce.png",
                width: 150.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Ecommerce UI Theme",
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.purple,
                  fontFamily: "Fuzzy",
                ),
              ),
              _startAppButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _startAppButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        NavigationController.navigateTo(context, LoginScreen(),
            removePrevious: true);
      },
      child: const Card(
        color: Colors.purple,
        child: SizedBox(
          height: 50.0,
          width: double.infinity,
          child: Center(
            child: Text(
              "Start App Yalla",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route _buildRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
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
}
