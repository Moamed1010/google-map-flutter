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
      zoom: 12,
      target: LatLng(30.010284030934173, 31.204708198362987),
    );
    initMarkers();
  }

  Set<Marker> markers = {};
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      onMapCreated: (controller) {
        mapController = controller;
        initMapStyle();
      },
      zoomControlsEnabled: false,
      // *** CameraTargetBounds***
      // cameraTargetBounds: CameraTargetBounds(
      //   LatLngBounds(
      //     northeast: LatLng(30.06091404944784, 31.3292252647428),
      //     southwest: LatLng(29.936414685428527, 31.040941321004098),
      //   ),
      // ),
      initialCameraPosition: initialCameraPosition,
    );
  }

  void initMapStyle() async {
    var nightStyle = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/map_styles/night_map_style.json');
    // ignore: deprecated_member_use
    mapController.setMapStyle(nightStyle);
  }

  void initMarkers() {
    var marker = Marker(
      markerId: MarkerId('1'),
      position: LatLng(29.986151492725668, 31.229272891534052),
    );
    markers.add(marker);
  }
}
