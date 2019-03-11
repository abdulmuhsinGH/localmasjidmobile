import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/mosque_model.dart';
import '../blocs/mosque_bloc.dart';

class MapView extends StatefulWidget {
  MapView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
   Completer<GoogleMapController> _controller = Completer();

   //Location myUserLocation;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.080664, 34.9563837),
    zoom:11
  );
  
  @override
  void initState() {
    super.initState();
    
    //_tabController = TabController(vsync: this, length: 2);
  }

  
  
  @override
  Widget build(BuildContext context) {
    //bloc.fetchNearestMosques();
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        //gestureRecognizers: Set()..add(Factory<OneSequenceGestureRecognizer>(() => PanGestureRecognizer())),
        onMapCreated: (GoogleMapController controller) async {
          bloc.fetchNearestMosques();
          var sub = await bloc.allNearestMosques.first;
          _controller.complete(controller);
          print("map data 0");

          sub.results.forEach((result)=>{
            controller.addMarker(
              MarkerOptions(
                position: LatLng(result.location[1], result.location[0]),
                infoWindowText: InfoWindowText(result.name, "0.5 miles away"),
              )
            ),
            print(result.name),
            print(result.location)
          });
           
        },
      ),
    );
  }


  
}