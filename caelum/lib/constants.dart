import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color warm = Color(0xFFFDA53D);
const Color cool = Color(0xFF38AECC);
const Color neutral = Color(0xFFA5B1A7);
const Color rain = Color(0xFF455561);
const Color storm = Color(0xFF282937);
const Color semiTransparent = Color(0xAAFFFFFF);

const kForecastDayTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w200,
);

const kCityNameTextStyle = TextStyle(
  fontSize: 42,
  color: Colors.white,
  fontWeight: FontWeight.w700,
);

const kFormattedDateTextStyle = TextStyle(
  fontSize: 20,
  color: semiTransparent,
);

const kTemperatureTextStyle = TextStyle(
  fontSize: 136,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kDegreeTextStyle = TextStyle(
  fontSize: 108,
  fontWeight: FontWeight.w200,
  color: Colors.white,
);

const kWeatherDescriptionTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xAAFFFFFF),
);

const kTemperatureInfoTextStyle = TextStyle(
  fontSize: 22,
);

const kThinTemperatureInfoTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w200,
);

class CurrentDayColumn extends StatelessWidget {
  const CurrentDayColumn(
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
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                day,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ), //Day
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              weatherIcon,
            ],
          ),
        ), //Icon
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                highTemperature,
                style: kTemperatureInfoTextStyle,
              ),
            ],
          ),
        ), //High temperature
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                lowTemperature,
                style: kThinTemperatureInfoTextStyle,
              )
            ],
          ),
        ), //Low temperature
      ],
    );
  }
}

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
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                day,
                style: kForecastDayTextStyle,
              ),
            ],
          ),
        ), //Day
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              weatherIcon,
            ],
          ),
        ), //Icon
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                highTemperature,
                style: kTemperatureInfoTextStyle,
              ),
            ],
          ),
        ), //High temperature
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                lowTemperature,
                style: kThinTemperatureInfoTextStyle,
              )
            ],
          ),
        ), //Low temperature
      ],
    );
  }
}
