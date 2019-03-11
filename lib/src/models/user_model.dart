class UserModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];
   _CurrentLocation _currentLocation;

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;

  _CurrentLocation get currentLocation => _currentLocation;
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