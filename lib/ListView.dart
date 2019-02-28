//import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';


class MasjidListView extends StatefulWidget {
  MasjidListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MasjidListViewState createState() => _MasjidListViewState();
}

class _MasjidListViewState extends State<MasjidListView> {
   
  @override
  void initState() {
    super.initState();
    //_tabController = TabController(vsync: this, length: 2);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Mosque 1'),
              subtitle: const Text('0.1 miles away'),
              onTap: () { /* react to the tile being tapped */ }
            ),
          ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Mosque 2'),
              subtitle: const Text('0.5 miles away'),
              onTap: () { /* react to the tile being tapped */ }
            )
        ],),
    );
  }

}