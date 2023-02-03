import 'dart:convert';

import 'package:np_weather/model/predict_data.dart';
import 'package:http/http.dart' as http;

class FetchPrediction {
  PredictionData? predictionData;

  Future<PredictionData> processData(
      precipitation, windspeed, tempmax, tempmin) async {
    var response = await http
        .get(Uri.parse(apiURL(precipitation, windspeed, tempmax, tempmin)));
    var jsonString = jsonDecode(response.body);
    predictionData = PredictionData.fromJson(jsonString);
    return predictionData!;
  }
}

String apiURL(var precipitation, var windspeed, var tempmax, var tempmin) {
  String url;

  url =
      "http://20.78.62.44:8080/predict-weather/query_parameters/?precipitation=$precipitation&wind_speed=$windspeed&temperature_highest=$tempmax&temperature_lowest=$tempmin";
  return url;
}
