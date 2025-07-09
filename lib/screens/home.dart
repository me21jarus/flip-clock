import 'dart:async';
import 'package:flutter/material.dart';
import 'sleep_clock.dart';
import 'settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? idleTimer;

  void resetTimer() {
    idleTimer?.cancel();
    idleTimer = Timer(const Duration(seconds: 10), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SleepClockScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  @override
  void dispose() {
    idleTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: resetTimer,
      onPanDown: (_) => resetTimer(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Flip Clock Home"), actions: [
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
              })
        ]),
        body: const Center(child: Text("App is running...
Wait for idle mode (10s)", style: TextStyle(fontSize: 18))),
      ),
    );
  }
}
