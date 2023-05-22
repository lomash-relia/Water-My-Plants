import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:watermyplants/features/home_page/UI/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
        splash:
            'assets/images/plant-tree-inscription-colorful-leaves-removebg-preview.png',
        splashIconSize: MediaQuery.of(context).size.height * 0.4,
        backgroundColor: Colors.black12,
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}
