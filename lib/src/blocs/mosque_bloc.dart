import 'dart:collection';

import '../resources/mosque/mosque_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/mosque_model.dart';
import '../helpers/utils.dart';



class MosqueBloc {
  final _repository = Repository();
  final _mosquesFetcher = PublishSubject<MosqueModel>();
  MosqueModel _mosqueModel;

  MosqueBloc() {
    _cachedMosqueList = HashMap<int,MosqueModel>();

    //fetchNearestMosques();
    
  }

  MosqueModel get mosqueModel => _mosqueModel;
  
  HashMap<int,MosqueModel> _cachedMosqueList;

  Observable<MosqueModel> get allNearestMosques => _mosquesFetcher.stream;

  Future<MosqueModel> fetchNearestMosques() async {
    print("cache");
    print(_cachedMosqueList.toString());
    if(_cachedMosqueList.isNotEmpty){
      print("sending cached data");
      return _cachedMosqueList[0];
    }
    
    MosqueModel mosqueModel = await _repository.fetchNearestMosquesList();
    
    for (var i = 0; i < mosqueModel.results.length; i++) {
      var mosque = mosqueModel.results[i];
      final currentLocation = await Utils.locateUser();
      final distance = await Utils.getDistanceBetween(currentLocation.latitude, currentLocation.longitude, mosque.location[1], mosque.location[0]);
      mosque.setDistanceFromUserLocation(distance);

      mosqueModel.results[i] = mosque;
      
      
    }
    _cachedMosqueList[0] = mosqueModel;
    _mosqueModel = mosqueModel;
    
    return mosqueModel;
    //_mosquesFetcher.sink.add(mosqueModel);
  }

  dispose() {
    _mosquesFetcher.close();
  }


}

final mosqueBloc = MosqueBloc();