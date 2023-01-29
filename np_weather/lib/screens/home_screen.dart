import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:np_weather/controller/global_controller.dart';
import 'package:np_weather/widget/currentweather_widget.dart';
import 'package:np_weather/widget/dailyforcast_widget.dart';
import 'package:np_weather/widget/header_widget.dart';
import 'package:np_weather/widget/hourlydata_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 10),
                  const HeaderWidget(),
                  //for our current temp
                  CurrentWeatherWidget(
                      weatherDataCurrent:
                          globalController.getData().getCurrentWeather()),
                  //const SizedBox(height: 20),
                  //list hourly weather data
                  HourlyDataWidget(
                      weatherDataHourly:
                          globalController.getData().getHourlyWeather()),
                  //const SizedBox(height: 20),
                  //List daity weather forecast data
                  DailyDataForecast(
                      weatherDataDaily:
                          globalController.getData().getDailyWeather()),
                ],
              )),
      ),
    );
  }
}
