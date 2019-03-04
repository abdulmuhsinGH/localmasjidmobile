import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/mosque_model.dart';

class MosqueApiProvider {
  Client client = Client();
  //final _apiKey = 'your_api_key';

  Future<MosqueModel> fetchNearestMosquesList() async {
    print("entered");
    final response = await client
        .get("http://192.168.1.3:3000/api/v1/user/find-mosques?latitude=5.5746203&longitude=-0.234551");
    print(response.body.toString());
    if (response.statusCode == 200) {
      print(json.decode(response.body));

      // If the call to the server was successful, parse the JSON
      return MosqueModel.fromJson(json.decode(response.body)["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}