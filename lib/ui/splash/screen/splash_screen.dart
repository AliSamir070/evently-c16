import 'package:evently_c16/core/resources/AssetsManager.dart';
import 'package:evently_c16/core/resources/ColorsManager.dart';
import 'package:evently_c16/core/resources/RoutesManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetsManager.logo))
          .animate(
        onComplete: (controller) {
          Navigator.pushReplacementNamed(context, RoutesManager.start);
        },
      )
          .slideX(duration: Duration(seconds: 1))
          .then()
          .scale(duration: Duration(seconds: 2),
          begin: Offset(0.5, 0.5)),
    );
  }
}
