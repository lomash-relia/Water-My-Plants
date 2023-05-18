import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: triggerNotification,
            child: const Text('Push Notification'),
          )),
    );
  }

  void triggerNotification() {

  }
}
