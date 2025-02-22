# Wi-Fi Signal Mapper

This project is an assignment that demonstrates the collection, storage, and visualization of Wi-Fi signal strength data combined with location information. The app uses Mapbox to render 3D maps and overlays and GetX for state management.

# Demo APK

https://drive.google.com/file/d/1y7rm7tgcY2CGhsi9yGk9SArQ_WT0ityk/view?usp=sharing

## Features

### 1. Wi-Fi Signal Data Collection
- **Measurement Screen (Screen 2):**  
  The app captures the current Wi-Fi signal strength (using the [wifi_iot](https://pub.dev/packages/wifi_iot) package) along with the device's location (using the [location](https://pub.dev/packages/location) package).  
- **Local Storage:**  
  Measurements (signal strength, latitude, and longitude) are stored in a local SQLite database using [sqflite](https://pub.dev/packages/sqflite) and [path](https://pub.dev/packages/path).

### 2. 3D Room Map (Screen 1)
- **3D Visualization:**  
  Displays a Mapbox map (using [mapbox_gl](https://pub.dev/packages/mapbox_gl)) with a high zoom level and a tilted camera to create a 3D perspective.
- **Room Overlay:**  
  A simple 3D overlay (an extruded rectangular polygon) represents the room layout, centered on the device's current location.

### 3. Signal Map (Screen 3)
- **Marker Overlay:**  
  Retrieves stored measurements and displays them on a Mapbox map as markers. Each marker shows the Wi-Fi signal strength in dBm.
  
### 4. State Management with GetX
- **SignalController:**  
  A GetX controller manages:
  - Fetching and updating the current location.
  - Periodic measurement of Wi-Fi signal strength (only when the Measurement Screen is active).
  - Storing and retrieving measurements from the local database.
  - Providing reactive state to update the UI automatically.


## Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- An Android device (this project targets Android)

## Dependencies

This project uses the following packages:

- [get](https://pub.dev/packages/get) – For state management.
- [mapbox_gl](https://pub.dev/packages/mapbox_gl) – For rendering Mapbox maps.
- [location](https://pub.dev/packages/location) – For obtaining the device's current location.
- [wifi_iot](https://pub.dev/packages/wifi_iot) – For retrieving Wi-Fi signal strength.
- [sqflite](https://pub.dev/packages/sqflite) & [path](https://pub.dev/packages/path) – For local SQLite database operations.

Make sure these dependencies are declared in your `pubspec.yaml`.

## Installation & Running the App

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/riddhi-tamrakar/measure_wifi_strength_assignment_riddhi
   cd measure_wifi_strength_assignment_riddhi

2. **Get the dependencies:**

   ```bash
   flutter pub get

3. **Run the app:**

   ```bash
   flutter run


