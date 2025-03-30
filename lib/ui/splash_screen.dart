import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cineverse/theme/app_images.dart';
import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen.withScreenRouteFunction(
          animationDuration: const Duration(milliseconds: 1000),
          screenRouteFunction: () async {
            return AppRoutes.login;
          },
          splash: Image.asset(AppImage.logo, fit: BoxFit.cover),
          splashIconSize: 200,
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
