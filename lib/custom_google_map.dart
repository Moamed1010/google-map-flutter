import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:training_google_map/google_map_services/circles.dart';
import 'package:training_google_map/google_map_services/map_style.dart';
import 'package:training_google_map/google_map_services/markers.dart';
import 'package:training_google_map/google_map_services/poly_lines.dart';
import 'package:training_google_map/google_map_services/polygons.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  Markers markers = Markers();
  Circles circles = Circles();
  Polygons polygons = Polygons();
  PolyLines polyLines = PolyLines();
  MapStyle mapStyle = MapStyle();
  @override
  void initState() {
    super.initState();

    initialCameraPosition = CameraPosition(
      zoom: 11.5,
      target: LatLng(30.010284030934173, 31.204708198362987),
    );
    markers.initMarkers();
    polyLines.initPolyLines();
    polygons.initPolygons();
    circles.initCircles();
  }
  late GoogleMapController mapController;
  @override

  Widget build(BuildContext context) {
    return GoogleMap(
      circles: circles.circles,
      polygons: polygons.polygons,
      polylines: polyLines.polyLines,
      markers: markers.markers,
      onMapCreated: (controller) {
        mapController = controller;
        mapStyle.initMapStyle(controller);
      },
      zoomControlsEnabled: false,
      initialCameraPosition: initialCameraPosition,
    );
  }
}
