import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'locate_weather.dart';
import 'package:caelum/services/weather.dart';
import 'package:caelum/constants.dart';
import 'package:date_format/date_format.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        _showDialog(context);
        cityName = 'Unknown';
        //--------------------------------//
        weatherIcon = FaIcon(FontAwesomeIcons.exclamation, size: 42);
        backgroundColor = storm;
        mainTemperature = 'X';
        weatherDescription = 'Error finding weather in that location';
        //----------------CURRENT DAY----------------//
        weatherIconOne = FaIcon(FontAwesomeIcons.exclamation);
        highTemperatureOne = 'N/A';
        lowTemperatureOne = 'N/A';

        //---------------DAY 2-----------------//
        weatherIconTwo = FaIcon(FontAwesomeIcons.exclamation);
        dayTwo = 'N/A';
        highTemperatureTwo = 'N/A';
        lowTemperatureTwo = 'N/A';

        //---------------DAY 3-----------------//
        weatherIconThree = FaIcon(FontAwesomeIcons.exclamation);
        dayThree = 'N/A';
        highTemperatureThree = 'N/A';
        lowTemperatureThree = 'N/A';

        //---------------DAY 4-----------------//
        weatherIconFour = FaIcon(FontAwesomeIcons.exclamation);
        dayFour = 'N/A';
        highTemperatureFour = 'N/A';
        lowTemperatureFour = 'N/A';

        //---------------DAY 5-----------------//
        weatherIconFive = FaIcon(FontAwesomeIcons.exclamation);
        dayFive = 'N/A';
        highTemperatureFive = 'N/A';
        lowTemperatureFive = 'N/A';

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

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Oh no!"),
          content: new Text("Unable to retrieve weather information"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  new Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          cityName,
                          style: kCityNameTextStyle,
                        ),
                        Text(
                          formattedDate,
                          style: kFormattedDateTextStyle,
                        ),
                      ],
                    ),
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
                            style: kTemperatureTextStyle,
                          ),
                          Text(
                            '°',
                            style: kDegreeTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        weatherDescription,
                        style: kWeatherDescriptionTextStyle,
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
                  Hero(
                    tag: 'Search',
                    child: ButtonTheme(
                      minWidth: MediaQuery.of(context).size.width - 75,
                      height: 65.0,
                      child: RaisedButton.icon(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(500.0),
                            side: BorderSide(color: Colors.white)),
                        onPressed: () async {
                          var cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LocateCityScreen();
                              },
                            ),
                          );
                          if (cityName != null) {
                            var weatherData =
                                await weather.getCityWeatherForecast(cityName);
                            updateUI(weatherData);
                          }
                        },
                        color: Colors.white,
                        textColor: backgroundColor,
                        label: Text(
                          "Search for a city",
                          style: TextStyle(fontSize: 18),
                        ),
                        icon: Icon(
                          OMIcons.place,
                          size: 28,
                        ),
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
