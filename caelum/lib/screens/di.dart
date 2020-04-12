import 'package:caelum/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:caelum/services/weather.dart';
import 'package:caelum/constants.dart';

class DisplayWeather extends StatefulWidget {
  DisplayWeather(this.displayWeather);

  final displayWeather;

  @override
  _DisplayWeatherState createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment =
        false; //<--
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            warm, //TODO: Change this to match Container's background
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
//        var condition = weatherData['weather'][0]['id'];  //TODO: Add functionality for correct weather icons
//        weatherIcon = weather.getWeatherIcon(condition);
        double tempDouble = weatherData['list'][0]['main']['temp'];
        mainTemperature = (tempDouble.toInt()).toString();
        weatherDescription = weatherData['list'][0]['weather'][0]['main'];
        //----------------CURRENT DAY----------------//
//        var condition = weatherData['weather'][0]['id'];
//        weatherIcon = weather.getWeatherIcon(condition);
        tempDouble = weatherData['list'][0]['main']['temp_max'];
        highTemperatureOne = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][0]['main']['temp_min'];
        lowTemperatureOne = (tempDouble.toInt()).toString();

        //---------------DAY 2-----------------//
//      var condition = weatherData['weather'][0]['id'];
//      weatherIcon = weather.getWeatherIcon(condition);
        dayTwo =
            formatDate(DateTime.parse(weatherData['list'][8]['dt_txt']), [D]);
        tempDouble = weatherData['list'][8]['main']['temp_max'];
        highTemperatureTwo = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][8]['main']['temp_min'];
        lowTemperatureTwo = (tempDouble.toInt()).toString();

        //---------------DAY 3-----------------//
//      var condition = weatherData['weather'][0]['id'];
//      weatherIcon = weather.getWeatherIcon(condition);
        dayThree =
            formatDate(DateTime.parse(weatherData['list'][16]['dt_txt']), [D]);
        tempDouble = weatherData['list'][16]['main']['temp_max'];
        highTemperatureThree = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][16]['main']['temp_min'];
        lowTemperatureThree = (tempDouble.toInt()).toString();

        //---------------DAY 4-----------------//
//      var condition = weatherData['weather'][0]['id'];
//      weatherIcon = weather.getWeatherIcon(condition);
        dayFour =
            formatDate(DateTime.parse(weatherData['list'][24]['dt_txt']), [D]);
        tempDouble = weatherData['list'][24]['main']['temp_max'];
        highTemperatureFour = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][24]['main']['temp_min'];
        lowTemperatureFour = (tempDouble.toInt()).toString();

        //---------------DAY 5-----------------//
//      var condition = weatherData['weather'][0]['id'];
//      weatherIcon = weather.getWeatherIcon(condition);
        dayFive =
            formatDate(DateTime.parse(weatherData['list'][32]['dt_txt']), [D]);
        tempDouble = weatherData['list'][32]['main']['temp_max'];
        highTemperatureFive = (tempDouble.toInt()).toString();
        tempDouble = weatherData['list'][32]['main']['temp_min'];
        lowTemperatureFive = (tempDouble.toInt()).toString();
      } else {
        mainTemperature = 0.toString();
        cityName = 'ERROR';
//        weatherHeader = 'ERROR';
//        weatherIcon = '';
        return;
      }
    });
  }

  static var date = new DateTime.now();

  String cityName;
  String formattedDate = formatDate(date, [DD, ', ', d, ' ', MM, ' ', yyyy]);
  //--------------------------//
  Icon weatherIcon = Icon(OMIcons.brightness5);
  String mainTemperature;
  String weatherDescription;
  //--------------------------//
  String dayOne = formatDate(date, [D]);
  String highTemperatureOne;
  String lowTemperatureOne;
  //--------------------------//
  String dayTwo;
  Icon weatherIconTwo = Icon(OMIcons.cloud);
  String highTemperatureTwo;
  String lowTemperatureTwo;
  //--------------------------//
  String dayThree;
  Icon weatherIconThree = Icon(OMIcons.cloud);
  String highTemperatureThree;
  String lowTemperatureThree;
  //--------------------------//
  String dayFour;
  Icon weatherIconFour = Icon(OMIcons.cloud);
  String highTemperatureFour;
  String lowTemperatureFour;
  //--------------------------//
  String dayFive;
  Icon weatherIconFive = Icon(OMIcons.cloud);
  String highTemperatureFive;
  String lowTemperatureFive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            color:
                warm), //TODO: Dynamic background colour based on current weather
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        onPressed: () {
                          // TODO: Update to get location info
                          setState(() {});
                        },
                      ),
                    ],
                  ), //'Locate me' button
                ],
              ),
            ), //City name, Long date, 'Locate me' button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        // TODO: Add functionality to have dynamic icon
                        OMIcons.brightness5,
                        size: 42,
                      ),
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
                  ForecastColumn(
                      day: dayOne,
                      highTemperature: highTemperatureOne,
                      lowTemperature: lowTemperatureOne),
                  ForecastColumn(
                      day: dayTwo,
                      highTemperature: highTemperatureTwo,
                      lowTemperature: lowTemperatureTwo),
                  ForecastColumn(
                      day: dayThree,
                      highTemperature: highTemperatureThree,
                      lowTemperature: lowTemperatureThree),
                  ForecastColumn(
                      day: dayFour,
                      highTemperature: highTemperatureFour,
                      lowTemperature: lowTemperatureFour),
                  ForecastColumn(
                      day: dayFive,
                      highTemperature: highTemperatureFive,
                      lowTemperature: lowTemperatureFive),
                ],
              ),
            ), //5 days showing icons, highs and lows for each day
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
                      textColor:
                          warm, //TODO: Replace with the background colour once dynamic colour is implemented
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
