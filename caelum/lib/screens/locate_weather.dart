import 'package:flutter/material.dart';
import 'package:caelum/constants.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class LocateCityScreen extends StatefulWidget {
  @override
  _LocateCityScreenState createState() => _LocateCityScreenState();
}

class _LocateCityScreenState extends State<LocateCityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: neutral),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                width: MediaQuery.of(context).size.width - 75,
                child: new Theme(
                  data: new ThemeData(
                    primaryColor: Colors.white70,
                    primaryColorDark: Colors.white,
                  ),
                  child: TextField(
                    decoration: new InputDecoration(
                      labelText: "Enter City Name",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(width: 2, color: Colors.white),
                      ),
//                      disabledBorder: OutlineInputBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
//                        borderSide: BorderSide(width: 2, color: Colors.white30),
//                      ),
                      //fillColor: Colors.green
                    ),
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 75,
                height: 65.0,
                child: RaisedButton.icon(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(500.0),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  color: Colors.white,
                  textColor: neutral,
                  label: Text(
                    "Get Weather",
                    style: TextStyle(fontSize: 18),
                  ),
                  icon: Icon(
                    OMIcons.place,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
