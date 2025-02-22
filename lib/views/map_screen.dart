import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:pet_adoption/controllers/signal_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  final SignalController controller = Get.put(SignalController());
  final String mapboxAccessToken =
      "sk.eyJ1IjoicmlkZGhpLXRhbXJha2FyIiwiYSI6ImNtN2dlOTV1bjBydzIyanF6ZTdjeG94ZWMifQ.tn20UdHcQ6FHrmzvY5Tu5A";
  
  void _onMapCreated(MapboxMapController mapController) {
    mapController.onStyleLoadedCallback = () {
      _addRoomOverlay(mapController);
    };
  }
  
  Future<void> _addRoomOverlay(MapboxMapController mapController) async {
    LatLng center = controller.currentLocation.value ?? LatLng(37.7749, -122.4194);
    double offset = 0.0001;
    List<List<List<double>>> polygonCoordinates = [
      [
        [center.longitude - offset, center.latitude - offset],
        [center.longitude - offset, center.latitude + offset],
        [center.longitude + offset, center.latitude + offset],
        [center.longitude + offset, center.latitude - offset],
        [center.longitude - offset, center.latitude - offset],
      ]
    ];
    
    Map<String, dynamic> roomGeoJson = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "properties": {"height": 5},
          "geometry": {"type": "Polygon", "coordinates": polygonCoordinates}
        }
      ]
    };
    
    await mapController.addSource("room_source", {
      "type": "geojson",
      "data": roomGeoJson,
    } as SourceProperties);
    
    await mapController.addLayer("room_layer", "room_source", {
      "id": "room_layer",
      "type": "fill-extrusion",
      "source": "room_source",
      "paint": {
        "fill-extrusion-color": "#FF0000",
        "fill-extrusion-height": ["get", "height"],
        "fill-extrusion-base": 0,
        "fill-extrusion-opacity": 0.5,
      }
    } as LayerProperties);
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.currentLocation.value == null) {
        return Scaffold(
          appBar: AppBar(title: Text("3D Room Map")),
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        appBar: AppBar(title: Text("3D Room Map")),
        body: MapboxMap(
          accessToken: mapboxAccessToken,
          styleString: "mapbox://styles/mapbox/streets-v11",
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: controller.currentLocation.value!,
            zoom: 20,
            tilt: 60,
          ),
        ),
      );
    });
  }
}
