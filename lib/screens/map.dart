import 'dart:async';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  double lng = 31.3785;
  double lat = 31.040931;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.040931, 31.3785),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: LatLng(lat, lng),
            draggable: true,

            // To do: custom marker icon
          ),
        },
        onTap: (LatLng latLng) {
          setState(() {
            GetStorage getStorage = GetStorage();
            getStorage.write('long', latLng.longitude);
            getStorage.write('lat', latLng.latitude);
            lat = latLng.latitude;
            lng = latLng.longitude;
          });
          Navigator.of(context).pop();
          print(latLng.latitude);
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
