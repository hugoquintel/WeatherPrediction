import 'dart:convert';

import 'package:np_weather/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:np_weather/model/weathercurrent_data.dart';
import 'package:np_weather/model/weatherdaily_data.dart';
import 'package:np_weather/model/weatherhourly_data.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
      WeatherDataHourly.fromJson(jsonString),
      WeatherDataDaily.fromJson(jsonString),
    );

    return weatherData!;
  }
}

String apiURL(var lat, var lon) {
  String url;

  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=apiKey&units=metric&exclude=minutely";
  return url;
}
