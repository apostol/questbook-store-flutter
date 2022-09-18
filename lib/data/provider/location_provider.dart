import 'dart:async';
import 'package:location/location.dart';

class UserLocation {
  final double? latitude;
  final double? longitude;
  UserLocation({this.latitude, this.longitude});
}

class LocationProvider {
  late UserLocation _currentLocation;
  var location = Location();

  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>();
  Stream<UserLocation> get locationStream => _locationController.stream;


  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
    return _currentLocation;
  }

  LocationProvider() {
    // Request permission to use location
    location.requestPermission().then((granted) {
      location.onLocationChanged.listen((locationData) {
        _locationController.add(UserLocation(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
        ));
      });
    });
  }

}