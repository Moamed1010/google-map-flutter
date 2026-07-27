import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polygons {
  Set<Polygon> polygons = {};
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
}
