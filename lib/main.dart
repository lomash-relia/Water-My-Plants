import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watermyplants/features/home_page/models/home_plant_model.dart';
import 'package:watermyplants/features/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HomePlantModelAdapter());
  final Box<HomePlantModel> box = await Hive.openBox('plants');
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Reminder Notification',
            channelDescription:
                'This notification will make sure you don\'t miss out water your plants')
      ],
      debug: true);
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
