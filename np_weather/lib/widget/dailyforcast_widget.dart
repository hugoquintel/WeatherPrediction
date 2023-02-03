import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:np_weather/api/fetch_weather.dart';
import 'package:np_weather/model/weatherdaily_data.dart';
import 'package:np_weather/utils/app_colors.dart';
import 'package:np_weather/utils/app_textstyle.dart';
import 'package:np_weather/widget/prediction_widget.dart';

class DailyDataForecast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;
  const DailyDataForecast({Key? key, required this.weatherDataDaily})
      : super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE, MMM d').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      //padding: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 0),
      decoration: BoxDecoration(
        color: AppColors.dividerLine.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              "Next Days",
              style: AppTextstyle.h3Bold,
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDataDaily.daily.length > 7
            ? 8
            : weatherDataDaily.daily.length,
        itemBuilder: ((context, index) {
          int tmax = weatherDataDaily.daily[index].temp!.max!;
          int tmin = weatherDataDaily.daily[index].temp!.min!;
          double windSpeed = weatherDataDaily.daily[index].windSpeed!;
          double? precipitation = weatherDataDaily.daily[index].rain;
          if (precipitation == null) {
            precipitation = 0;
          }
          String tempmax = "${weatherDataDaily.daily[index].temp!.max}°/";
          String tempmin = "${weatherDataDaily.daily[index].temp!.min}°";
          String getday = getDay(weatherDataDaily.daily[index].dt);
          return Column(
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        getday,
                        style: AppTextstyle.b2Medium,
                      ),
                    ),
                    /*
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                          "assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"),
                    ),
                    */
                    SizedBox(
                      width: 70,
                      height: 30,
                      child: PredictionWidget(
                        precipitation: precipitation,
                        windspeed: windSpeed,
                        tempmax: tmax,
                        tempmin: tmin,
                      ),
                    ),
                    Text(
                      tempmax + tempmin,
                      style: AppTextstyle.b2Medium,
                    ),
                  ],
                ),
              ),
              /*Text(
                "${precipitation} + "
                " + ${windSpeed} + "
                " + ${tmax} + "
                " + ${tmin} + "
                "",
                style: AppTextstyle.b2Medium,
              )
              */
            ],
          );
        }),
      ),
    );
  }
}
