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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
            ), //Weather icon, temperature, short description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Replace with day from API (Will need to convert the given format into a day)
                            Text(
                              'Fri', //TODO: Today's date
                              style: TextStyle(
                                fontSize:
                                    22, //TODO: The other columns need to have a thinner font weight
                              ),
                            ),
                          ],
                        ),
                      ), //Day
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with the matching icon for the forecasted weather
                            Icon(
                              OMIcons.cloud,
                            ),
                          ],
                        ),
                      ), //Icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with data from API
                            Text(
                              '17',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //High temperature
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
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
                        ),
                      ), //Low temperature
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Replace with day from API (Will need to convert the given format into a day)
                            Text(
                              'Fri',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //Day
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with the matching icon for the forecasted weather
                            Icon(
                              OMIcons.cloud,
                            ),
                          ],
                        ),
                      ), //Icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with data from API
                            Text(
                              '17',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //High temperature
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
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
                        ),
                      ), //Low temperature
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Replace with day from API (Will need to convert the given format into a day)
                            Text(
                              'Fri',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //Day
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with the matching icon for the forecasted weather
                            Icon(
                              OMIcons.cloud,
                            ),
                          ],
                        ),
                      ), //Icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with data from API
                            Text(
                              '17',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //High temperature
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
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
                        ),
                      ), //Low temperature
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Replace with day from API (Will need to convert the given format into a day)
                            Text(
                              'Fri',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //Day
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with the matching icon for the forecasted weather
                            Icon(
                              OMIcons.cloud,
                            ),
                          ],
                        ),
                      ), //Icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with data from API
                            Text(
                              '17',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //High temperature
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
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
                        ),
                      ), //Low temperature
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            // TODO: Replace with day from API (Will need to convert the given format into a day)
                            Text(
                              'Fri',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //Day
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with the matching icon for the forecasted weather
                            Icon(
                              OMIcons.cloud,
                            ),
                          ],
                        ),
                      ), //Icon
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: <Widget>[
                            //TODO: Replace with data from API
                            Text(
                              '17',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ), //High temperature
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
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
                        ),
                      ), //Low temperature
                    ],
                  ),
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
                      textColor: Color(
                          0xFFFDA53D), //TODO: Replace with the background colour once dynamic colour is implemented
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
