//import '../resources/user/user_repository.dart';
import 'package:geolocator/geolocator.dart';

import 'package:rxdart/rxdart.dart';
import '../models/user_model.dart';

class UserBloc {
  final _userFetcher = PublishSubject<UserModel>();

  //final _repository = Repository();
  /* final _mosquesFetcher = PublishSubject<MosqueModel>();

  Observable<MosqueModel> get allNearestMosques => _mosquesFetcher.stream;

  fetchNearestMosques() async {
    //MosqueModel mosqueModel = await _repository.fetchNearestMosquesList();
    _mosquesFetcher.sink.add(mosqueModel);
  }

  dispose() {
    _mosquesFetcher.close();
  } */
  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((location) {
      if (location != null) {
        print("Location: ${location.latitude},${location.longitude}");
        //locationRepository.store(location);
      }
      
      return location;
    });
  }
  
}

final bloc = UserBloc();