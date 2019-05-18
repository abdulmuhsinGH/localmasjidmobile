import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../../models/mosque_model.dart';
import '../../helpers/utils.dart';
class MosqueApiProvider {
  Client client = Client();
  //final _apiKey = 'your_api_key';

  Future<MosqueModel> fetchNearestMosquesList() async {
    print("entered");

    final location = await Utils.locateUser();
    final response = await client
        .get("http://192.168.1.3:3000/api/v1/user/find-mosques?latitude=${location.latitude}&longitude=${location.longitude}");
    //print(response.body.toString());
    if (response.statusCode == 200) {
      //print(json.decode(response.body));

      // If the call to the server was successful, parse the JSON
      //print("Lists of mosques from server");
      //print(json.decode(response.body)["data"]);
      return MosqueModel.fromJson(json.decode(response.body)["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}