import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool is24Hour = false;

  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      is24Hour = prefs.getBool('is24Hour') ?? false;
    });
  }

  Future<void> updateFormat(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is24Hour', value);
    setState(() {
      is24Hour = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SwitchListTile(
        title: const Text("Use 24-Hour Format"),
        value: is24Hour,
        onChanged: updateFormat,
      ),
    );
  }
}
