import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watermyplants/features/home_page/UI/HomePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/plant_splashscreen.png',
          ),
          const SizedBox(
            width: double.maxFinite,
          ),
          const Text(
            'Plant a Tree',
            style: TextStyle(fontSize: 34, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
