import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color warm = Color(0xFFFDA53D);
const Color cool = Color(0xFF38AECC);
const Color neutral = Color(0xFFA5B1A7);
const Color rain = Color(0xFF455561);
const Color storm = Color(0xFF282937);
const Color semiTransparent = Color(0xAAFFFFFF);

class ForecastColumn extends StatelessWidget {
  const ForecastColumn(
      {Key key,
      @required this.day,
      @required this.highTemperature,
      @required this.lowTemperature,
      @required this.weatherIcon})
      : super(key: key);

  final String day;
  final String highTemperature;
  final String lowTemperature;
  final FaIcon weatherIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              Text(
                day,
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
              weatherIcon,
            ],
          ),
        ), //Icon
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              Text(
                highTemperature,
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
              Text(
                lowTemperature,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xAAFFFFFF),
                ),
              )
            ],
          ),
        ), //Low temperature
      ],
    );
  }
}
