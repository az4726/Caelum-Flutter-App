import 'package:caelum/services/location.dart';
import 'package:caelum/services/network.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const apiKey = '';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const openWeatherMapForecastURL =
    'https://api.openweathermap.org/data/2.5/forecast';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Network networkHelper =
        Network('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Network networkHelper = Network(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeatherForecast() async {
    Location location = Location();
    await location.getCurrentLocation();

    Network networkHelper = Network(
        '$openWeatherMapForecastURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

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

  String getBackgroundColor(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
