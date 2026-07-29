import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:training_google_map/google_map_services/location_services.dart';
import 'package:training_google_map/google_map_services/map_style.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  late LocationServices locationServices;
  MapStyle mapStyle = MapStyle();

  Set<Marker> markers = {};
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();

    locationServices = LocationServices();
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


  void updateMyLocation() async {
    await locationServices.checkAndRequestLocationService();
    var hasPermission = await locationServices
        .checkAndRequestLocationPermission();

    if (hasPermission) {
      locationServices.getRealTimeLocationData((event) {
        CameraPosition cameraPosition = setMyCameraPosition(event);

        setMyLocationMarker(event);

        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(cameraPosition),
        );
      });
    }
  }

  CameraPosition setMyCameraPosition(LocationData event) {
     var cameraPosition = CameraPosition(
      zoom: 17,
      target: LatLng(event.latitude, event.longitude),
    );
    return cameraPosition;
  }

  void setMyLocationMarker(LocationData event) {
    
    var myLocationMarker = Marker(
      markerId: const MarkerId('my_location'),
      position: LatLng(event.latitude, event.longitude),
    );
    
    setState(() {
      markers.add(myLocationMarker);
    });
  }
}
