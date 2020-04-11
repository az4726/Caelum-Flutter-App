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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment =
        false; //<--
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  static var date = new DateTime.now();
  String formattedDate = formatDate(date, [DD, ', ', d, ' ', MM, ' ', yyyy]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      'Birmingham',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontSize: 18,
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
                        setState(() {});
                      },
                    ),
                  ],
                ), //'Locate me' button
              ],
            ), //City name, Long date, 'Locate me' button
            Row(), //Weather icon, temperature, short description
            Row(), //5 days showing icons, highs and lows for each day
            Row(), //'Search for a location' button
          ],
        ),
      ),
    );
  }
}
