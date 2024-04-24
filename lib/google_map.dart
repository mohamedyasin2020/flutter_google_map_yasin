import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapLocation extends StatefulWidget {


  @override
  State<GoogleMapLocation> createState() => _GoogleMapLocationState();
}

class _GoogleMapLocationState extends State<GoogleMapLocation> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> markers ={
    Marker(
      markerId: MarkerId('marker'),
      position:LatLng(10.7870,79.1378),
      infoWindow: InfoWindow(
        title: 'Thanjavur',
        snippet: 'place',
      ),),
    Marker(
      markerId: MarkerId('marker'),
      position:LatLng(13.067439, 80.237617),
      infoWindow: InfoWindow(
        title: 'chennai',
        snippet: 'place',
      ),),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Maps'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
          markers: markers,
        ),
      ),
    );
  }

}

