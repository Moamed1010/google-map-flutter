import 'package:flutter/services.dart' show rootBundle; // ضفنا الـ services هنا
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStyle {
  void initMapStyle(GoogleMapController mapController) async {
    
    var nightStyle = await rootBundle.loadString(
      'assets/map_styles/night_map_style.json',
    );

    // ignore: deprecated_member_use
    mapController.setMapStyle(nightStyle);
  }
}
