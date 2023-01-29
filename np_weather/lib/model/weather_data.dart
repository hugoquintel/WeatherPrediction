import 'package:np_weather/model/weathercurrent_data.dart';
import 'package:np_weather/model/weatherdaily_data.dart';
import 'package:np_weather/model/weatherhourly_data.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
