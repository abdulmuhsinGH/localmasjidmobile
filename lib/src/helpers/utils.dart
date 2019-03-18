import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  
  static Future<Position> locateUser() async {
    ServiceStatus serviceStatus = await PermissionHandler().checkServiceStatus(PermissionGroup.location);
    
    print(serviceStatus);
    return  Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      if (location != null) {
        print("Location: ${location.latitude},${location.longitude}");
        //locationRepository.store(location);
      }
      //myUserLocation = location;
      return location;
    });
  }

  static Future<String> getDistanceBetween(double startingLatitude, double startingLongtide, double endingLatitude, double endingLogitude) async {
    double distanceInMeters = await Geolocator().distanceBetween(startingLatitude, startingLongtide, endingLatitude, endingLogitude);

    double distanceInKilometers = distanceInMeters/1000;

    return distanceInKilometers.toStringAsFixed(2);
  }
  
}