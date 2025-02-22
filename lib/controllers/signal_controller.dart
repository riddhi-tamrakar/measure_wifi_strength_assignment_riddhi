import 'dart:async';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pet_adoption/helpers/database_helper.dart';
import 'package:wifi_iot/wifi_iot.dart';

class SignalController extends GetxController {
  Rxn<LatLng> currentLocation = Rxn<LatLng>();
  RxInt wifiSignalStrength = 0.obs;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxList<Map<String, dynamic>> measurements = <Map<String, dynamic>>[].obs;

  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final Location _location = Location();
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _initLocation();
  }

  Future<void> _initLocation() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }
    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }
    final locData = await _location.getLocation();
    final loc = LatLng(locData.latitude!, locData.longitude!);
    currentLocation.value = loc;
    latitude.value = locData.latitude!;
    longitude.value = locData.longitude!;
  }

  void startMeasuring() {
    _getWifiAndLocation();
    timer = Timer.periodic(Duration(seconds: 5), (_) => _getWifiAndLocation());
  }

  void stopMeasuring() {
    timer?.cancel();
  }

  Future<void> _getWifiAndLocation() async {
    try {
      int? strength = await WiFiForIoTPlugin.getCurrentSignalStrength();
      final locData = await _location.getLocation();
      if (locData.latitude != null && locData.longitude != null) {
        final loc = LatLng(locData.latitude!, locData.longitude!);
        currentLocation.value = loc;
        latitude.value = locData.latitude!;
        longitude.value = locData.longitude!;
      }
      if (strength != null) {
        wifiSignalStrength.value = strength;
        await _dbHelper.insertData(strength, latitude.value, longitude.value);
        print("WIFI signal measurement stored to local db.");
      }
    } catch (e) {
      print("Error measuring Wi-Fi and location: $e");
    }
  }

  Future<void> fetchMeasurements() async {
    print("--------------------- ---------------------");

    var data = await _dbHelper.getAllData();
    print("data ---------------------");

    print(data);
    measurements.assignAll(data);
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
