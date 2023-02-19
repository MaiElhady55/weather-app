import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/Weather_Model.dart';

class WeatherService {
  Future<WeatherModel> getWeaher({required String cityName}) async {
    String baseUrl = 'https://api.weatherapi.com/v1';
    String keyApi = 'a3c6fceab6b0486ab4431723223010';

    try {
      String url = '$baseUrl/forecast.json?key=$keyApi&q=$cityName&aqi=no';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 400) {
        Map<String, dynamic> data = json.decode(res.body);
        throw Exception(data['error']['message']);
      }
      Map<String, dynamic> data = json.decode(res.body);
    
      WeatherModel weather = WeatherModel.fromJson(data);
      return weather;
    } catch (e) {
      throw e;
    }
  }
}
