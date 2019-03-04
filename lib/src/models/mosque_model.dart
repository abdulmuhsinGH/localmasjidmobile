class MosqueModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  MosqueModel.fromJson(Map<String, dynamic> parsedJson) {
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
}

class _Result {
  
  int _id;
  String _name;
 // String _description;
  String _location;
  String _prayer_times;
  bool _verified;
  String _created_at;
  

  _Result(result) {
   
    _id = result['_id'];
    _name = result['name'];
   // _description = result['description'];
    _location = result['location'];
    _prayer_times = result['prayer_times'];
    _verified = result['verified'];
    _created_at = result['created_at'];
    
  }

  int get id => _id;

  String get name => _name;

  //String get description => _description;

  String get location => _location;
  bool get verified => _verified;
  String get created_at  => _created_at;


  
}