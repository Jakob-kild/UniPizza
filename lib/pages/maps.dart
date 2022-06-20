import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var _latitude = "";
  var _longitude = "";

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> _updatePosition() async{
    Position position = await _determinePosition();
    setState(() {
      _latitude = position.latitude.toString();
      _longitude = position.longitude.toString();
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static const _initalCameraPosition = CameraPosition(
    target: LatLng(55.7856,12.5214),
    zoom: 14,
  );

  GoogleMapController _googleMapController;

  List<Marker> _marker =[];
  static const List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(55.768860,12.505070),
        infoWindow: InfoWindow(
        title: 'Pizzeria Luca',
        snippet: 'Gammel Jernbanevej 20,\n2800 Kongens Lyngby',
          //snippet: '${calculateDistance(_latitude, _longitude, 55.768860, 12.505070)}',
          //snippet: '$Id1',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(55.797050,12.523720),
      infoWindow: InfoWindow(
          title: 'Lyngby Pizza',
          snippet: 'Lundtoftevej 197,\n2800 Kongens Lyngby'
      ),
        icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(55.797050,12.523720),
      infoWindow: InfoWindow(
          title: 'Lyngby Pizza',
          snippet: 'Lundtoftevej 197,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(55.795380,12.536150),
      infoWindow: InfoWindow(
          title: 'La Vida Stenovns Pizza',
          snippet: 'Eremitageparken 315,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(55.797539,12.513710),
      infoWindow: InfoWindow(
          title: 'Il Mondo',
          snippet: 'Egegårdsvej 1,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(55.768211,12.504030),
      infoWindow: InfoWindow(
          title: 'Jernbane Pizza House',
          snippet: 'Jernbanepladsen 33,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('7'),
      position: LatLng(55.778690,12.510310),
      infoWindow: InfoWindow(
          title: 'Alunas Pizza',
          snippet: 'Sorgenfrigårdsvej 80B,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('8'),
      position: LatLng(55.778570,12.515550),
      infoWindow: InfoWindow(
          title: 'La Sosta Pizza & Bøfhus',
          snippet: 'Carlshøjvej 49,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('9'),
      position: LatLng(55.778220,12.511000),
      infoWindow: InfoWindow(
          title: 'Miss Pizza',
          snippet: 'Baunehøjvej 24,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
    Marker(
      markerId: MarkerId('10'),
      position: LatLng(55.795680,12.528540),
      infoWindow: InfoWindow(
          title: 'Saras Pizza & Burger House',
          snippet: 'Lundtofteparken 67,\n2800 Kongens Lyngby'
      ),
      icon: BitmapDescriptor.defaultMarker,
    ),
  ];

  void initState() {
    super.initState();
    _marker.addAll(_list);
    _updatePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        initialCameraPosition: _initalCameraPosition,
        mapType: MapType.normal,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
      ),

      floatingActionButton: Stack(
        children: [
          Positioned(
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                splashColor: Colors.orange,
                enableFeedback: true,
                hoverColor: Colors.orange,
                onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(_initalCameraPosition),
                ),
                child: const Icon(Icons.center_focus_strong),
              ),
          ),
        ],
      ),
    );
  }
}




