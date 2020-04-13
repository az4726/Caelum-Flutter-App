import 'package:caelum/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:caelum/services/weather.dart';
import 'package:caelum/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_helper/icons_helper.dart';

class DisplayWeather extends StatefulWidget {
  DisplayWeather(this.displayWeather);

  final displayWeather;

  @override
  _DisplayWeatherState createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment =
        false; //<--
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: backgroundColor,
      ),
    );
    print(widget.displayWeather);
    updateUI(widget.displayWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData != null) {
        cityName = weatherData['city']['name'];
        //--------------------------------//
        var condition = weatherData['list'][0]['weather'][0]['id'];
        var weatherIconName = WeatherModel.getWeatherIcon(condition);
        print(weatherIconName);
        weatherIcon = FaIcon(
            WeatherModel.fontAwesomeIconFromString(weatherIconName),
            size: 42);
        backgroundColor = WeatherModel.getBackgroundColor(condition);
        double tempDouble = weatherData['list'][0]['main']['temp'];
        mainTemperature = (tempDouble.toInt()).toString();
        weatherDescription = weatherData['list'][0]['weather'][0]['main'];
        //----------------CURRENT DAY----------------//
        weatherIconOne =
            FaIcon(WeatherModel.fontAwesomeIconFromString(weatherIconName));
        tempDouble = weatherData['list'][0]['main']['temp_max'];
        highTemperatureOne = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][0]['main']['temp_min'];
        lowTemperatureOne = (tempDouble.toInt()).toString();

        //---------------DAY 2-----------------//
        condition = weatherData['list'][8]['weather'][0]['id'];
        weatherIconName = WeatherModel.getWeatherIcon(condition);
        print(weatherIconName);
        weatherIconTwo =
            FaIcon(WeatherModel.fontAwesomeIconFromString(weatherIconName));
        dayTwo =
            formatDate(DateTime.parse(weatherData['list'][8]['dt_txt']), [D]);
        tempDouble = weatherData['list'][8]['main']['temp_max'];
        highTemperatureTwo = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][8]['main']['temp_min'];
        lowTemperatureTwo = (tempDouble.toInt()).toString();

        //---------------DAY 3-----------------//
        condition = weatherData['list'][16]['weather'][0]['id'];
        weatherIconName = WeatherModel.getWeatherIcon(condition);
        print(weatherIconName);
        weatherIconThree =
            FaIcon(WeatherModel.fontAwesomeIconFromString(weatherIconName));
        dayThree =
            formatDate(DateTime.parse(weatherData['list'][16]['dt_txt']), [D]);
        tempDouble = weatherData['list'][16]['main']['temp_max'];
        highTemperatureThree = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][16]['main']['temp_min'];
        lowTemperatureThree = (tempDouble.toInt()).toString();

        //---------------DAY 4-----------------//
        condition = weatherData['list'][24]['weather'][0]['id'];
        weatherIconName = WeatherModel.getWeatherIcon(condition);
        print(weatherIconName);
        weatherIconFour =
            FaIcon(WeatherModel.fontAwesomeIconFromString(weatherIconName));
        dayFour =
            formatDate(DateTime.parse(weatherData['list'][24]['dt_txt']), [D]);
        tempDouble = weatherData['list'][24]['main']['temp_max'];
        highTemperatureFour = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][24]['main']['temp_min'];
        lowTemperatureFour = (tempDouble.toInt()).toString();

        //---------------DAY 5-----------------//
        condition = weatherData['list'][33]['weather'][0]['id'];
        weatherIconName = WeatherModel.getWeatherIcon(condition);
        print(weatherIconName);
        weatherIconFive =
            FaIcon(WeatherModel.fontAwesomeIconFromString(weatherIconName));
        dayFive =
            formatDate(DateTime.parse(weatherData['list'][32]['dt_txt']), [D]);
        tempDouble = weatherData['list'][32]['main']['temp_max'];
        highTemperatureFive = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][32]['main']['temp_min'];
        lowTemperatureFive = (tempDouble.toInt()).toString();
      } else {
        // TODO: Add default values to prevent null errors
        mainTemperature = 0.toString();
        cityName = 'ERROR';
//        weatherHeader = 'ERROR';
//        weatherIcon = '';
        return;
      }
    });
  }

  static var date = new DateTime.now();
  Color backgroundColor;
  String cityName;
  String formattedDate = formatDate(date, [DD, ', ', d, ' ', MM, ' ', yyyy]);
  //--------------------------//
  FaIcon weatherIcon;
  String mainTemperature;
  String weatherDescription;
  //--------------------------//
  String dayOne = formatDate(date, [D]);
  FaIcon weatherIconOne;
  String highTemperatureOne;
  String lowTemperatureOne;
  //--------------------------//
  String dayTwo;
  FaIcon weatherIconTwo;
  String highTemperatureTwo;
  String lowTemperatureTwo;
  //--------------------------//
  String dayThree;
  FaIcon weatherIconThree;
  String highTemperatureThree;
  String lowTemperatureThree;
  //--------------------------//
  String dayFour;
  FaIcon weatherIconFour;
  String highTemperatureFour;
  String lowTemperatureFour;
  //--------------------------//
  String dayFive;
  FaIcon weatherIconFive;
  String highTemperatureFive;
  String lowTemperatureFive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cityName,
                        style: TextStyle(
                          fontSize: 42,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 20,
                          color: semiTransparent,
                        ),
                      ),
                    ],
                  ), //City name, Long date
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          OMIcons.myLocation,
                          size: 36,
                        ),
                        tooltip: 'Get Your Location',
                        onPressed: () async {
                          var weatherData =
                              await weather.getLocationWeatherForecast();
                          updateUI(weatherData);
                        },
                      ),
                    ],
                  ), //'Locate me' button
                ],
              ),
            ), //City name, Long date, 'Locate me' button
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      weatherIcon,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mainTemperature,
                            style: TextStyle(
                              fontSize: 136,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '°',
                            style: TextStyle(
                              fontSize: 108,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        weatherDescription,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xAAFFFFFF),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ), //Weather icon, temperature, short description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  CurrentDayColumn(
                      day: dayOne,
                      weatherIcon: weatherIconOne,
                      highTemperature: highTemperatureOne,
                      lowTemperature: lowTemperatureOne),
                  ForecastColumn(
                      day: dayTwo,
                      weatherIcon: weatherIconTwo,
                      highTemperature: highTemperatureTwo,
                      lowTemperature: lowTemperatureTwo),
                  ForecastColumn(
                      day: dayThree,
                      weatherIcon: weatherIconThree,
                      highTemperature: highTemperatureThree,
                      lowTemperature: lowTemperatureThree),
                  ForecastColumn(
                      day: dayFour,
                      weatherIcon: weatherIconFour,
                      highTemperature: highTemperatureFour,
                      lowTemperature: lowTemperatureFour),
                  ForecastColumn(
                      day: dayFive,
                      weatherIcon: weatherIconFive,
                      highTemperature: highTemperatureFive,
                      lowTemperature: lowTemperatureFive),
                ],
              ),
            ), //5 days showing icons, highs and lows for each day
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width - 75,
                    height: 65.0,
                    child: RaisedButton.icon(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(500.0),
                          side: BorderSide(color: Colors.white)),
                      //TODO: Add button functionality
                      onPressed: () {},
                      color: Colors.white,
                      textColor: backgroundColor,
                      label: Text(
                        "Search for a city",
                        style: TextStyle(fontSize: 18),
                      ),
                      icon: Icon(
                        OMIcons.locationOn,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ), //'Search for a location' button
          ],
        ),
      ),
    );
  }
}
