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
    name: ' أهرامات الجيزة',
    position: LatLng(29.97894461223206, 31.136203765896152),
  ),
  PlaceModel(
    id: 2,
    name: 'مستشفى السلام الدولى',
    position: LatLng(29.9881632521542, 31.22684097005303),
  ),
  PlaceModel(
    id: 3,
    name: 'قلعة صلاح الدين',
    position: LatLng(30.03335064263194, 31.259234315351417),
  ),
  PlaceModel(
    id: 4,
    name: 'نادي الصيد - الدقي',
    position: LatLng(30.049448859586853, 31.20332749059026),
  ),
];
