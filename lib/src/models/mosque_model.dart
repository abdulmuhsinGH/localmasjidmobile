class MosqueModel {
  int _page;
  int _total_results;
  int _total_pages;
  List<_Result> _results = [];

  MosqueModel.fromJson(List<dynamic> parsedJson) {
   /*  print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages']; */
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      _Result result = _Result(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages = 0;

  int get total_results => _total_results = 0;

  int get page => _page = 1 ;
}

class _Result {
  
  String _id;
  String _name;
 // String _description;
  List<dynamic> _location;
  List<dynamic> _prayer_times;
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

  String get id => _id;

  String get name => _name;

  //String get description => _description;

  List<dynamic> get location => _location;
  bool get verified => _verified;
  String get created_at  => _created_at;


  
}