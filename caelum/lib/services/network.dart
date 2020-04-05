import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const weatherAPIURL = '';
const apiKey = '';

class WeatherData {
  Future getCoinData(String currency) async {
    //TODO 4: Update the URL to use the selectedCurrency input.
    String requestURL = '$weatherAPIURL/BTC/$currency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
