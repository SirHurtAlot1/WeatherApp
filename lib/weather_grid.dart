import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'weather.dart';
import 'weather_card.dart';

class WeatherGrid extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;
  const WeatherGrid({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          WeatherCard(
              iconData: WeatherIcons.thermometer,
              description: 'Feels like',
              data: '${snapshot.data!.condition.feelsLikeTemp.toInt()} °'),
          WeatherCard(
              iconData: WeatherIcons.windy,
              description: 'Wind speed',
              data: '${snapshot.data!.condition.windSpeed.toInt()} km/h'),
          WeatherCard(
              iconData: WeatherIcons.humidity,
              description: 'Humidity',
              data: '${snapshot.data!.condition.humidity} %'),
          WeatherCard(
              iconData: WeatherIcons.day_sunny,
              description: 'Ultraviolet',
              data: '${snapshot.data!.condition.ultraviolet.toInt()}'),
          WeatherCard(
              iconData: Icons.remove_red_eye_outlined,
              description: 'Vision',
              data: '${snapshot.data!.condition.vision.toInt()} km'),
          WeatherCard(
              iconData: WeatherIcons.barometer,
              description: 'Pressure',
              data: '${snapshot.data!.condition.pressure.toInt()} mm.'),
        ],
      ),
    );
  }
}
