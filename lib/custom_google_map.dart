import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:training_google_map/models/place_model.dart';

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
      zoom: 11.5,
      target: LatLng(30.010284030934173, 31.204708198362987),
    );
    initMarkers();
    initPolyLines();
    initPolygons();
    initCircles();
  }

  Set<Marker> markers = {};
  Set<Polyline> polyLines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {}; // <== Circle
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      circles: circles,
      polygons: polygons,
      polylines: polyLines,
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
    markers = placesList
        .map(
          (place) => Marker(
            markerId: MarkerId(place.id.toString()),
            position: place.position,
            infoWindow: InfoWindow(title: place.name),
          ),
        )
        .toSet();
    markers.addAll(markers);
  }

  void initPolyLines() {
    Polyline polyline = Polyline(
      startCap: Cap.roundCap,
      polylineId: PolylineId('1'),
      points: [
        LatLng(29.97894461223206, 31.136203765896152),
        LatLng(29.9881632521542, 31.22684097005303),
        LatLng(30.03335064263194, 31.259234315351417),
        LatLng(30.049448859586853, 31.20332749059026),
      ],
      color: Colors.red,
      width: 4,
    );

    polyLines.add(polyline);
  }
  
  void initPolygons() {
    Polygon polygon = Polygon(
      polygonId: PolygonId('1'),
      points: [
        LatLng(29.969733157675243, 31.211438586822805),
        LatLng(29.97774817696117, 31.244905075042578),
        LatLng(29.96674867678075, 31.238999224180258),
        
      ],
      strokeColor: Colors.white,
      strokeWidth: 4,
      fillColor: Colors.white38,
    );
    polygons.add(polygon);
  }
  
  void initCircles() {
    Circle circle = Circle(
      circleId: CircleId('1'),
      center: LatLng(29.97894461223206, 31.136203765896152),
      radius: 1000,
      strokeWidth: 4,
      strokeColor: Colors.white,
      fillColor: Colors.white38,
    );
    circles.add(circle);
  }
}
