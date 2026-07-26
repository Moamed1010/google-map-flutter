import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    super.initState();
    initialCameraPosition = CameraPosition(
      target: LatLng(30.010284030934173, 31.204708198362987),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(initialCameraPosition: initialCameraPosition);
  }
}
