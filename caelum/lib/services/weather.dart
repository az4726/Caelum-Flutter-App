import 'package:caelum/services/location.dart';
import 'package:caelum/services/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:caelum/constants.dart';

const apiKey = '';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherMapForecastURL =
    'https://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getLocationWeatherForecast() async {
    Location location = Location();
    await location.getCurrentLocation();

    Network networkHelper = Network(
        '$openWeatherMapForecastURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeatherForecast(String cityName) async {
    Network networkHelper = Network(
        '$openWeatherMapForecastURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'bolt';
    } else if (condition < 400) {
      return 'cloud-rain';
    } else if (condition < 600) {
      return 'cloud-showers-heavy';
    } else if (condition < 700) {
      return 'snowflake️';
    } else if (condition < 800) {
      return 'wind';
    } else if (condition == 800) {
      return 'sun️';
    } else if (condition <= 804) {
      return 'cloud️';
    } else {
      return 'exclamation';
    }
  }

  static IconData fontAwesomeIconFromString(String name) {
    switch (name) {
      case 'bolt':
        return FontAwesomeIcons.bolt;
      case 'cloud-rain':
        return FontAwesomeIcons.cloudRain;
      case 'cloud-showers-heavy':
        return FontAwesomeIcons.cloudShowersHeavy;
      case 'snowflake️':
        return FontAwesomeIcons.snowflake;
      case 'wind':
        return FontAwesomeIcons.wind;
      case 'sun️':
        return FontAwesomeIcons.sun;
      case 'cloud️':
        return FontAwesomeIcons.cloud;
      case 'exclamation':
        return FontAwesomeIcons.exclamation;
    }
  }

  static Color getBackgroundColor(int condition) {
    if (condition < 300) {
      return storm;
    } else if (condition < 400) {
      return rain;
    } else if (condition < 600) {
      return storm;
    } else if (condition < 800) {
      return neutral;
    } else if (condition == 800) {
      return warm;
    } else if (condition <= 804) {
      return cool;
    } else {
      return neutral;
    }
  }
}
