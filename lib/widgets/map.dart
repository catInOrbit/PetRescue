import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;

    final LatLng _center = const LatLng(10.828056, 106.703324);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Bản đồ"),
      ),

      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 16,
        ),

        mapType: MapType.normal,
        tiltGesturesEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        myLocationEnabled: true,
      ),
    );
  }
}
