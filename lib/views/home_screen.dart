import 'package:flutter/material.dart';

import 'map_screen.dart';
import 'measure_screen.dart';
import 'signal_map_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wi-Fi Signal Mapper')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
              child: Text('View 3D Map'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MeasureScreen()),
                );
              },
              child: Text('Measure Wi-Fi Strength'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignalMapScreen()),
                );
              },
              child: Text('View Signal Strength'),
            ),
          ],
        ),
      ),
    );
  }
}