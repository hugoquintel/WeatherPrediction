import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:np_weather/controller/global_controller.dart';
import 'package:np_weather/model/weatherhourly_data.dart';
import 'package:np_weather/utils/app_colors.dart';
import 'package:np_weather/utils/app_textstyle.dart';

class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({Key? key, required this.weatherDataHourly})
      : super(key: key);

  RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          width: 300,
          color: AppColors.dividerLine,
        ),
        SizedBox(height: 5),
        Container(
          child: Text(
            "Today",
            style: AppTextstyle.h3Bold,
          ),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 20
            : weatherDataHourly.hourly.length,
        itemBuilder: ((context, index) {
          return Obx((() => GestureDetector(
                onTap: () {
                  cardIndex.value = index;
                },
                child: Container(
                  width: 80,
                  margin: EdgeInsets.only(left: 20, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0.5, 0),
                          blurRadius: 30,
                          spreadRadius: 1,
                          color: AppColors.dividerLine.withAlpha(150),
                        )
                      ],
                      gradient: cardIndex.value == index
                          ? const LinearGradient(colors: [
                              //AppColors.primary,
                              //AppColors.secondary,
                              AppColors.firstGradientColor,
                              AppColors.secondGradientColor,
                            ])
                          : null),
                  child: HourlyDetails(
                    index: index,
                    cardIndex: cardIndex.toInt(),
                    temp: weatherDataHourly.hourly[index].temp!,
                    timeStamp: weatherDataHourly.hourly[index].dt!,
                    weatherIcon:
                        weatherDataHourly.hourly[index].weather![0].icon!,
                  ),
                ),
              )));
        }),
      ),
    );
  }
}

//Detail hourly weather
class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  int index;
  int cardIndex;
  String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  HourlyDetails({
    Key? key,
    required this.index,
    required this.cardIndex,
    required this.timeStamp,
    required this.temp,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            getTime(timeStamp),
            style: cardIndex == index
                ? AppTextstyle.b1RegularW
                : AppTextstyle.b1Regular,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 40,
            width: 40,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            "$temp°C",
            style:
                cardIndex == index ? AppTextstyle.b1BoldW : AppTextstyle.b1Bold,
          ),
        ),
      ],
    );
  }
}
