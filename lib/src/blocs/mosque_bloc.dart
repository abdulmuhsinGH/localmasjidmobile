import '../resources/mosque/mosque_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/mosque_model.dart';

class MosqueBloc {
  final _repository = Repository();
  final _mosquesFetcher = PublishSubject<MosqueModel>();

  Observable<MosqueModel> get allNearestMosques => _mosquesFetcher.stream;

  fetchNearestMosques() async {
    MosqueModel mosqueModel = await _repository.fetchNearestMosquesList();
    _mosquesFetcher.sink.add(mosqueModel);
  }

  dispose() {
    _mosquesFetcher.close();
  }

  
}

final bloc = MosqueBloc();