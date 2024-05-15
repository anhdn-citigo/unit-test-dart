import 'package:geolocator/geolocator.dart';

// class GeoLocatorService {
//   // Asynchronously gets the current position of the device. Returns a `Future<Position?>`.
//   Future<Position?> getCurrentPosition() async {
//     return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }
// }

abstract class IGeoLocatorService {
  Future<Position?> getCurrentPosition();
}

class GeoLocatorService implements IGeoLocatorService {
  @override
  Future<Position?> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
}



