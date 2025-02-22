import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pet_adoption/controllers/signal_controller.dart';

class SignalMapScreen extends StatefulWidget {
  const SignalMapScreen({Key? key}) : super(key: key);

  @override
  _SignalMapScreenState createState() => _SignalMapScreenState();
}

class _SignalMapScreenState extends State<SignalMapScreen> {
  final SignalController controller = Get.put(SignalController());
  final String mapboxAccessToken =
      "sk.eyJ1IjoicmlkZGhpLXRhbXJha2FyIiwiYSI6ImNtN2dlOTV1bjBydzIyanF6ZTdjeG94ZWMifQ.tn20UdHcQ6FHrmzvY5Tu5A";

  void _onMapCreated(MapboxMapController mapController) {
    mapController.onStyleLoadedCallback = () {
      _addMarkers(mapController);
    };
  }

  @override
  void initState() {
    super.initState();
    controller.fetchMeasurements();
  }

  Future<void> _addMarkers(MapboxMapController mapController) async {
    for (var record in controller.measurements) {
      double lat = record['latitude'];
      double lon = record['longitude'];
      int signal = record['signal_strength'];
      await mapController.addSymbol(
        SymbolOptions(
          geometry: LatLng(lat, lon),
          iconImage: "marker-15",
          textField: "$signal dBm",
          textOffset: Offset(0, 1.5),
          textSize: 12,
          iconSize: 1.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.measurements.isEmpty) {
        return Scaffold(
          appBar: AppBar(title: Text("Map with WiFi Signal Strength")),
          body: Center(child: Text("No measurements available")),
        );
      }
      double initLat = controller.measurements[0]['latitude'];
      double initLon = controller.measurements[0]['longitude'];
      return Scaffold(
        appBar: AppBar(title: Text("Map with WiFi Signal Strength")),
        body: MapboxMap(
          accessToken: mapboxAccessToken,
          styleString: "mapbox://styles/mapbox/streets-v11",
          initialCameraPosition: CameraPosition(
            target: LatLng(initLat, initLon),
            zoom: 20,
            tilt: 50,
          ),
          onMapCreated: _onMapCreated,
        ),
      );
    });
  }
}
