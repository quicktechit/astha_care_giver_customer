import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jatri_app/src/configs/app_texts.dart';

import '../../configs/appColors.dart';

class MapWithDirections extends StatefulWidget {
  final double pickUpLat;
  final double pickUpLng;
  final double dropUpLat;
  final double dropUpLng;

  const MapWithDirections(
      {super.key,
      required this.pickUpLat,
      required this.pickUpLng,
      required this.dropUpLat,
      required this.dropUpLng});

  @override
  _MapWithDirectionsState createState() => _MapWithDirectionsState();
}

class _MapWithDirectionsState extends State<MapWithDirections> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  Widget build(BuildContext context) {
    //var  pickUpLatLng.replaceAll(" ", ",");
    return Scaffold(
      appBar: AppBar(
          title: Text('Map with Directions',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 22, color: white))),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.pickUpLat, widget.pickUpLng),
          zoom: 12.0,
        ),
        markers: markers,
        polylines: polylines,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;

      // Add markers for start and end points
      markers.add(
        Marker(
          markerId: MarkerId('Start'),
          position: LatLng(widget.pickUpLat, widget.pickUpLng),
          infoWindow: InfoWindow(title: 'Start'),
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('End'),
          position: LatLng(widget.dropUpLat, widget.dropUpLng),
          infoWindow: InfoWindow(title: 'End'),
        ),
      );
    });

    getDirections();
  }

  void getDirections() async {
    final start = LatLng(widget.pickUpLat, widget.pickUpLng);
    final end = LatLng(widget.dropUpLat, widget.dropUpLng);

    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=${AppTexts.googleMapKey}'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final points = decoded['routes'][0]['overview_polyline']['points'];
      List<LatLng> decodedPoints = decodePolyline(points);

      // Draw the route on the map
      setState(() {
        polylines.add(Polyline(
          polylineId: PolylineId('route'),
          points: decodedPoints,
          width: 5,
          color: Colors.blue,
        ));
      });
    } else {
      throw Exception('Failed to load directions');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }
}
