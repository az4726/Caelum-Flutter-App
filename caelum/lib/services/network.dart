import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
//      String data = response.body;
//      print(data);

      String data =
          '{coord: {lon: -1.9, lat: 52.51}, weather: [{id: 801, main: Clouds, description: few clouds, icon: 02d}], base: stations, main: {temp: 18.29, feels_like: 16.63, temp_min: 15.56, temp_max: 20, pressure: 1013, humidity: 55}, visibility: 10000, wind: {speed: 2.1}, clouds: {all: 20}, dt: 1586690380, sys: {type: 1, id: 1375, country: GB, sunrise: 1586668533, sunset: 1586718035}, timezone: 3600, id: 2646814, name: Hockley, cod: 200}';
      print(data);

      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
