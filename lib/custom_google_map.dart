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
      zoom: 11,
      target: LatLng(30.010284030934173, 31.204708198362987),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          northeast: LatLng(30.06091404944784, 31.3292252647428),
          southwest: LatLng(29.936414685428527, 31.040941321004098),
        ),
      ),
      initialCameraPosition: initialCameraPosition,
    );
  }
}
