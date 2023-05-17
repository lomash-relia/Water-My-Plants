import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:watermyplants/features/home_page/UI/HomePage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/plant-tree-inscription-colorful-leaves.png',
      splashIconSize: MediaQuery.of(context).size.height,
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
