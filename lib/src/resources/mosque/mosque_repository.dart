import 'dart:async';
import 'mosque_api_provider.dart';
import '../../models/mosque_model.dart';

class Repository {
  final mosqueApiProvider = MosqueApiProvider();

  Future<MosqueModel> fetchNearestMosquesList() => mosqueApiProvider.fetchNearestMosquesList();
}