import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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
  );

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(32.080664, 34.9563837),
  );
  
  @override
  void initState() {
    super.initState();
    //_tabController = TabController(vsync: this, length: 2);
  }

  
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        //gestureRecognizers: Set()..add(Factory<OneSequenceGestureRecognizer>(() => PanGestureRecognizer())),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_walk),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}