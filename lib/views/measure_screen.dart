import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/signal_controller.dart';

class MeasureScreen extends StatefulWidget {
  const MeasureScreen({Key? key}) : super(key: key);

  @override
  _MeasureScreenState createState() => _MeasureScreenState();
}

class _MeasureScreenState extends State<MeasureScreen> {
  final SignalController controller = Get.put(SignalController());

  @override
  void initState() {
    super.initState();
    controller.startMeasuring();
  }

  @override
  void dispose() {
    controller.stopMeasuring();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Measure Wi-Fi Signal Strength'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.currentLocation.value == null) {
            return CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wi-Fi Signal Strength: ${controller.wifiSignalStrength.value}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                'Location: (${controller.latitude.value}, ${controller.longitude.value})',
                style: TextStyle(fontSize: 20),
              ),
            ],
          );
        }),
      ),
    );
  }
}
