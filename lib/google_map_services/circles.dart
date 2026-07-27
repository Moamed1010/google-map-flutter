import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Circles {
  Set<Circle> circles = {}; 
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