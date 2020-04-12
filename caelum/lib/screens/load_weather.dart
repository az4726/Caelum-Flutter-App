import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:caelum/services/weather.dart';
import 'package:caelum/screens/di.dart';

class LoadWeather extends StatefulWidget {
  @override
  _LoadWeatherState createState() => _LoadWeatherState();
}

class _LoadWeatherState extends State<LoadWeather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weather = WeatherModel();
    var weatherData = await weather.getLocationWeatherForecast();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DisplayWeather(weatherData);
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
