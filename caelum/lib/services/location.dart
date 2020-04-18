import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch (e) {
      print(e);
    }
  }
}
