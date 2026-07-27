

import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final int id;
  final String name;
  final LatLng position;

  PlaceModel({required this.id, required this.name, required this.position});
}

List<PlaceModel> placesList = [
  PlaceModel(
    id: 1,
    name: 'متحف القومي للحضارة المصرية',
    position: LatLng(30.012435015484797, 31.24736579223232),
  ),
  PlaceModel(
    id: 2,
    name: 'قلعة صلاح الدين',
    position: LatLng(30.030458790824664, 31.25884408407316),
  ),
  PlaceModel(
    id: 3,
    name: 'القرية الفرعونية',
    position: LatLng(29.999631091900408, 31.213514558667814),
  ),
];
