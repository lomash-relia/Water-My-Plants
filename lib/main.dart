import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/models/HomePlantModel.dart';
import 'package:watermyplants/features/splash_screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HomePlantModelAdapter());
  Box<HomePlantModel> box = await Hive.openBox('plants');
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
