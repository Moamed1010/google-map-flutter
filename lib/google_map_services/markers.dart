import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:training_google_map/models/place_model.dart';

class Markers {
  Set<Marker> markers = {};
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

} 