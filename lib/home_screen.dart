import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller =
      Completer(); //access features in fururre
  static const LatLng showLocation = LatLng(25.9,68.097);

  final List<Marker> _markers = <Marker>[]; //marker implementation
  //final List _markers = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('SomeId'),
      position: LatLng(24.9180271, 67.0970916),
      // infoWindow: InfoWindow(
      //     title: 'The title of the marker'
      // )
    ),
    Marker(  //second marker
        markerId: MarkerId('SomeId2'),
        position: LatLng(25.9,68.097),
        // infoWindow: InfoWindow(
        //     title: 'The title of the marker'
        // )
    ),
  ];
  static const CameraPosition _campostion = CameraPosition(
    target: showLocation, //LatLng(24.9180271, 67.0970916),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(_list);
    // _markers.add(
    //     Marker(
    //         markerId: MarkerId('SomeId'),
    //         position: LatLng(37.42796133580664, -122.085749655962),
    //         infoWindow: InfoWindow(
    //             title: 'The title of the marker'
    //         )
    //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _campostion,
          mapType: MapType.hybrid,
          // zoomControlsEnabled: true,
          // zoomGesturesEnabled: true,
          // myLocationButtonEnabled: true,
          compassEnabled: true,
          // mapToolbarEnabled: true,
          // myLocationButtonEnabled: true,
          // rotateGesturesEnabled: true,
          myLocationEnabled: true,
          //markers: getmarkers(), //markers to show on map
          // trafficEnabled: false,
          // buildingsEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller){  //enable CameraUpdate position to use it
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_disabled_outlined),
          onPressed: () async {
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(
                 const CameraPosition(
                  target: LatLng(24.9180271, 67.0970916),
                  zoom: 14,
                ),
              ),
            );
            setState(() {
              
            });
          },
          ),
    );
  }
}

// List<Marker> list = const [
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng(33.6844, 73.0479),
//       infoWindow: InfoWindow(
//           title: 'The title of the marker'
//       )
//   ),
//   Marker(
//       markerId: MarkerId('SomeId'),
//       position: LatLng( 33.738045,73.084488),
//       infoWindow: InfoWindow(
//           title: 'e-11 islamabd'
//       )
//   ),
// ];
//
// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _markers.addAll(
//       list);
// }
