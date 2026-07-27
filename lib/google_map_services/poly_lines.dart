import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolyLines {
   Set<Polyline> polyLines = {};
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
}