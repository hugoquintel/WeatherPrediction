import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:np_weather/model/weathercurrent_data.dart';
import 'package:np_weather/utils/app_colors.dart';
import 'package:np_weather/utils/app_textstyle.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Temperature
        TemperatureWidget(),
        Feellike(),
        SizedBox(height: 10),
        //More details: wind, clouds, humidity
        MoreDetailsWidget(),
      ],
    );
  }

  Widget TemperatureWidget() {
    String temp = "${weatherDataCurrent.current.temp!.toInt()}°C";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: AppColors.dividerLine,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: temp,
                style: AppTextstyle.h1Bold,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Feellike() {
    String feellike = "${weatherDataCurrent.current.feelsLike!.toInt()}°C";
    String description =
        "${weatherDataCurrent.current.weather![0].description}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: description.toUpperCase(),
                style: AppTextstyle.h5Regular,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Feel like: ",
                style: AppTextstyle.h5Regular,
              ),
              TextSpan(
                text: feellike,
                style: AppTextstyle.h5Regular,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget MoreDetailsWidget() {
    double heigthtext = 20;
    double widthtext = 100;
    double iconsize = 30;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.wind5,
                size: iconsize,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.cloud,
                size: iconsize,
              ),
            ),
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Iconsax.drop3,
                size: iconsize,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "Wind speed",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "Clouds",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "Humidity",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "${weatherDataCurrent.current.windSpeed} km/h",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "${weatherDataCurrent.current.clouds} %",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: heigthtext,
              width: widthtext,
              child: Text(
                "${weatherDataCurrent.current.humidity} %",
                style: AppTextstyle.b3Regular,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//Text('${weatherDataCurrent.current.weather![0].description}'),