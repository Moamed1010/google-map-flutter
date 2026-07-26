import 'package:flutter/material.dart';
import 'package:training_google_map/custom_google_map.dart';

void main() {
  runApp(const TestGoogleMapWithFlutter());
}

class TestGoogleMapWithFlutter extends StatelessWidget {
  const TestGoogleMapWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMap(),
    );
  }
}
