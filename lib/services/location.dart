import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitudes;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitudes = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
