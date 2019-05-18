//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/mosque_model.dart';
import '../blocs/mosque_bloc.dart';


class MasjidListView extends StatefulWidget {
  MasjidListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MasjidListViewState createState() => _MasjidListViewState();
}

class _MasjidListViewState extends State<MasjidListView> {

  //MosqueBloc _mosqueBloc;
   
  @override
  void initState() {
    super.initState();
    //_mosqueBloc = MosqueBloc();


  }


  @override
  Widget build(BuildContext context) {
   // mosqueBloc.fetchNearestMosques();
    //print(_mosqueBloc.mosqueModel.toString());
    return new Scaffold(
      body: FutureBuilder(
        future: mosqueBloc.fetchNearestMosques(),
        builder: (context, AsyncSnapshot<MosqueModel> snapshot) {
          if (snapshot.hasData) {
            return buildListView(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }


  Widget buildListView(AsyncSnapshot<MosqueModel> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.star),
              title: Text('${snapshot.data.results[index].name}'),
              subtitle: Text('${snapshot.data.results[index].distanceFromUserLocation} Kilometers away'),
              onTap: () { /* react to the tile being tapped */ }
            );
        });
  }

}