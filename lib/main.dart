import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'screens/sleep_clock.dart';
import 'services/notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initialize();
  runApp(const FlipClockApp());
}

class FlipClockApp extends StatelessWidget {
  const FlipClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flip Clock Sleep App',
      theme: ThemeData.dark(),
      home: const SleepClockScreen(),
    );
  }
}
