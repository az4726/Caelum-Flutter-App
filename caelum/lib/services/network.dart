import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
