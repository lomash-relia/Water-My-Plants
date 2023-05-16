import 'package:flutter/material.dart';
import 'package:watermyplants/features/splash_screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water My Plants',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const SplashScreen(),
    );
  }
}
