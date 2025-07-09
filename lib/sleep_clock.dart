import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import '../services/notification_service.dart';
import 'package:geolocator/geolocator.dart';

class SleepClockScreen extends StatefulWidget {
  const SleepClockScreen({super.key});

  @override
  State<SleepClockScreen> createState() => _SleepClockScreenState();
}

class _SleepClockScreenState extends State<SleepClockScreen> {
  String time = '';
  String date = '';
  String day = '';
  String weatherInfo = 'Fetching weather...';

  @override
  void initState() {
    super.initState();
    updateTime();
    fetchWeather();
  }

  void updateTime() {
    final now = DateTime.now();
    setState(() {
      time = DateFormat('hh:mm a').format(now);
      date = DateFormat('dd MMM yyyy').format(now);
      day = DateFormat('EEEE').format(now);
    });
  }

  Future<void> fetchWeather() async {
    try {
      Position position = await LocationService().getCurrentLocation();
      var weather = await WeatherService().getWeather(position.latitude, position.longitude);
      setState(() {
        weatherInfo = '${weather['main']['temp']}°C, ${weather['weather'][0]['description']}';
      });
      NotificationService.showNotification("Weather Update", weatherInfo);
    } catch (e) {
      setState(() {
        weatherInfo = 'Failed to fetch weather';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time, style: const TextStyle(fontSize: 64, color: Colors.white)),
            const SizedBox(height: 16),
            Text('$day, $date', style: const TextStyle(fontSize: 24, color: Colors.white70)),
            const SizedBox(height: 20),
            Text(weatherInfo, style: const TextStyle(fontSize: 20, color: Colors.tealAccent)),
          ],
        ),
      ),
    );
  }
}
