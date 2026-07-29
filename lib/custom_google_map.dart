import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:training_google_map/google_map_services/map_style.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late Location location;
  MapStyle mapStyle = MapStyle();

  Set<Marker> markers = {};
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    location = Location();

    initialCameraPosition = const CameraPosition(
      zoom: 11.5,
      target: LatLng(30.010284030934173, 31.204708198362987),
    );

    // استدعاء دالة تحديث الموقع بمجرد فتح الشاشة
    updateMyLocation();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      onMapCreated: (controller) {
        mapController = controller;
        mapStyle.initMapStyle(controller);
      },
      zoomControlsEnabled: false,
      initialCameraPosition: initialCameraPosition,
    );
  }

  Future<void> checkAndRequestLocationService() async {
    bool isLocationServiceEnabled = await location.serviceEnabled();
    if (!isLocationServiceEnabled) {
      await location.requestService();
    }
  }

  Future<bool> checkAndRequestLocationPermission() async {
    var permission = await location.hasPermission();
    if (permission == PermissionStatus.deniedForever) {
      return false;
    }
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      // تم تعديل اللوجيك هنا
      if (permission == PermissionStatus.granted ||
          permission == PermissionStatus.grantedLimited) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }

  void getLocationData() {
    location.changeSettings(distanceFilter: 3);
    location.onLocationChanged.listen((event) {

      var cameraPosition = CameraPosition(
        zoom: 17,
        target: LatLng(event.latitude!, event.longitude!),
      );

      var myLocationMarker = Marker(
        markerId: const MarkerId('my_location'),
        position: LatLng(event.latitude!, event.longitude!),
      );

      setState(() {
        markers.add(myLocationMarker);
      });

      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(cameraPosition),
      );
    });
  }

  void updateMyLocation() async {
    await checkAndRequestLocationService();
    var hasPermission = await checkAndRequestLocationPermission();

    if (hasPermission) {
      getLocationData();
    }
  }
}
