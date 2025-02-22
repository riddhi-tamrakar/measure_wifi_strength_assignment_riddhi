import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'views/home_screen.dart';

const String wifiFetchTask = "wifiFetchTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == wifiFetchTask) {
      try {
        int? strength = await WiFiForIoTPlugin.getCurrentSignalStrength();
        print("Background Wi-Fi Signal Strength: $strength");
      } catch (e) {
        print("Error fetching Wi-Fi strength in background: $e");
      }
    }
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Workmanager().registerPeriodicTask(
    "1",
    wifiFetchTask,
    frequency: Duration(minutes: 15),
    initialDelay: Duration(seconds: 10),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
