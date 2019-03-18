import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/mosque_bloc.dart';
import '../helpers/utils.dart';
import '../models/mosque_model.dart';

class MapView extends StatefulWidget {
  MapView({Key key, this.title, this.mosqueModel}) : super(key: key);

  final String title;
  final MosqueModel mosqueModel;
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
   Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
   
  }

  
  
  @override
  Widget build(BuildContext context) {
    //bloc.fetchNearestMosques();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(32.080664, 34.9563837),
      zoom:11
    );

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        gestureRecognizers: Set()..add(Factory<OneSequenceGestureRecognizer>(() => PanGestureRecognizer())),
        onMapCreated: googleMapsController ,
      ),
    );
  }
  
  void googleMapsController(GoogleMapController controller) async {
      _controller.complete(controller);

      mosqueBloc.fetchNearestMosques();
      var sub = await mosqueBloc.allNearestMosques.first;
      var currentLocation = await Utils.locateUser() ;
      final latLong = LatLng(currentLocation.latitude, currentLocation.longitude);
      CameraUpdate cameraUpdate = CameraUpdate.newLatLngZoom(latLong, 15);
      
      await controller.animateCamera(cameraUpdate);

      for (var i = 0; i < sub.results.length; i++) {
        final mosque = sub.results[i];
        controller.addMarker(
          MarkerOptions(
            position: LatLng(mosque.location[1], mosque.location[0]),
            infoWindowText: InfoWindowText(mosque.name, "${mosque.distanceFromUserLocation} Kilometers away"),
          )
        );
      }
      
    }
}