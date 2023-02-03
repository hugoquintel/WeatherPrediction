import 'package:flutter/material.dart';
import 'package:np_weather/api/fetch_prediction.dart';
import 'package:np_weather/model/predict_data.dart';
import 'package:np_weather/utils/app_colors.dart';
import 'package:np_weather/utils/app_textstyle.dart';

class PredictionWidget extends StatelessWidget {
  double? precipitation;
  double windspeed;
  int tempmax;
  int tempmin;

  PredictionWidget({
    Key? key,
    required this.precipitation,
    required this.windspeed,
    required this.tempmax,
    required this.tempmin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 30,
        height: 30,
        child: icon(precipitation, windspeed, tempmax, tempmin),
        //child: Image.asset(getIcon("drizzle")),
      ),
    );
  }

  Widget icon(var precipitation, var windspeed, var tempmax, var tempmin) {
    return Container(
        child: FutureBuilder<PredictionData>(
      future: FetchPrediction()
          .processData(precipitation, windspeed, tempmax, tempmin),
      builder: (context, snapshot) {
        PredictionData predictionData = snapshot.data!;
        String content = predictionData.content!.weatherCondition!;
        //return Text(predictionData.content!.weatherCondition!);
        //return Image.asset(getIcon("rain"));
        return Row(
          children: [
            Image.asset(getIcon(content)),
            SizedBox(
              width: 5,
            ),
            Text(
              content,
              style: AppTextstyle.b2Medium,
            )
          ],
        );
      },
    ));
  }
}

String getIcon(String content) {
  String x;
  String icon = "01d.png";
  switch (content) {
    case "sun":
      icon = "01d.png";
      break;
    case "rain":
      icon = "10d.png";
      break;
    case "snow":
      icon = "13d.png";
      break;
    case "drizzle":
      icon = "09d.png";
      break;
    case "fog":
      icon = "50d.png";
      break;
  }
  x = "assets/weather/" + icon;
  print(x);
  return x;
}
