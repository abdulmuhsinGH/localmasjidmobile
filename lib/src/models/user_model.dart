import 'package:geolocator/geolocator.dart';

class UserModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];
  static _CurrentLocation _currentLocation;

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  //UserModel.

  List<_Result> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;

  static _CurrentLocation get currentLocation => _currentLocation;

  static void setCurrentLocation(Position coordinates) {
    _CurrentLocation currentLocation =_CurrentLocation(coordinates);
    _currentLocation = currentLocation;
  }
}


class _Result {
  
  int _id;
  String _name;
  String _username;
  String _email;
  

  _Result(result) {
   
    _id = result['id'];
    _name = result['name'];
    _username = result['username'];
    _email = result['email'];
  }

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get username => _username;

  
}

class _CurrentLocation {

  int _longitude;
  int _latitude;
  

  _CurrentLocation(coordinates) {
   
    _longitude = coordinates['longitude'];
    _latitude = coordinates['latitude'];

  }

  int get longitude => _longitude;

  int get latitude => _latitude;
  
}