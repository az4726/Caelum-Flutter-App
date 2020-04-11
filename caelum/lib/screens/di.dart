import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class DisplayWeather extends StatefulWidget {
//  DisplayWeather(this.displayWeather);
//
//  final displayWeather;

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
        systemNavigationBarColor: Color(
            0xFFFDA53D), //TODO: Change this to match Container's background
      ),
    );
  }

  static var date = new DateTime.now();
  String formattedDate = formatDate(date, [DD, ', ', d, ' ', MM, ' ', yyyy]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            color: Color(
                0xFFFDA53D)), //TODO: Dynamic background colour based on current weather
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // TODO: Change to location variable
                      'Birmingham',
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
                        color: Color(0xAAFFFFFF),
                      ),
                    ),
                  ],
                ), //City name, Long date
                Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(OMIcons.myLocation),
                      tooltip: 'Get Your Location',
                      onPressed: () {
                        // TODO: Update to get location info
                        setState(() {});
                      },
                    ),
                  ],
                ), //'Locate me' button
              ],
            ), //City name, Long date, 'Locate me' button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      // TODO: Add functionality to have dynamic icon
                      OMIcons.cloudUpload,
                      size: 42,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // TODO: Update to a variable
                          '13',
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
                      // TODO: Update to get info from API
                      'Rather Cloudy',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xAAFFFFFF),
                      ),
                    ),
                  ],
                )
              ],
            ), //Weather icon, temperature, short description
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // TODO: Replace with day from API (Will need to convert the given format into a day)
                        Text(
                          'Fri',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //Day
                    Row(
                      children: <Widget>[
                        //TODO: Replace with the matching icon for the forecasted weather
                        Icon(
                          OMIcons.cloud,
                        ),
                      ],
                    ), //Icon
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '17',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //High temperature
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xAAFFFFFF),
                          ),
                        )
                      ],
                    ), //Low temperature
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // TODO: Replace with day from API (Will need to convert the given format into a day)
                        Text(
                          'Fri',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //Day
                    Row(
                      children: <Widget>[
                        //TODO: Replace with the matching icon for the forecasted weather
                        Icon(
                          OMIcons.cloud,
                        ),
                      ],
                    ), //Icon
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '17',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //High temperature
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xAAFFFFFF),
                          ),
                        )
                      ],
                    ), //Low temperature
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // TODO: Replace with day from API (Will need to convert the given format into a day)
                        Text(
                          'Fri',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //Day
                    Row(
                      children: <Widget>[
                        //TODO: Replace with the matching icon for the forecasted weather
                        Icon(
                          OMIcons.cloud,
                        ),
                      ],
                    ), //Icon
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '17',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //High temperature
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xAAFFFFFF),
                          ),
                        )
                      ],
                    ), //Low temperature
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // TODO: Replace with day from API (Will need to convert the given format into a day)
                        Text(
                          'Fri',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //Day
                    Row(
                      children: <Widget>[
                        //TODO: Replace with the matching icon for the forecasted weather
                        Icon(
                          OMIcons.cloud,
                        ),
                      ],
                    ), //Icon
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '17',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //High temperature
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xAAFFFFFF),
                          ),
                        )
                      ],
                    ), //Low temperature
                  ],
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // TODO: Replace with day from API (Will need to convert the given format into a day)
                        Text(
                          'Fri',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //Day
                    Row(
                      children: <Widget>[
                        //TODO: Replace with the matching icon for the forecasted weather
                        Icon(
                          OMIcons.cloud,
                        ),
                      ],
                    ), //Icon
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '17',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ), //High temperature
                    Row(
                      children: <Widget>[
                        //TODO: Replace with data from API
                        Text(
                          '9',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xAAFFFFFF),
                          ),
                        )
                      ],
                    ), //Low temperature
                  ],
                ),
              ],
            ), //5 days showing icons, highs and lows for each day
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ), //'Search for a location' button
          ],
        ),
      ),
    );
  }
}
