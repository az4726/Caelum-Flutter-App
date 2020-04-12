import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:caelum/services/weather.dart';

class LoadWeather extends StatefulWidget {
  @override
  _LoadWeatherState createState() => _LoadWeatherState();
}

class _LoadWeatherState extends State<LoadWeather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getLocationData() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SpinKitRing(color: Colors.grey),
      ),
    );
  }
}
