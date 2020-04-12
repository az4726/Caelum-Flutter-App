import 'package:flutter/material.dart';
import 'package:caelum/screens/load_weather.dart';
import 'package:caelum/services/location.dart';

import 'package:caelum/screens/di.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: lo(),
      //home: DisplayWeather(),
    );
  }
}
