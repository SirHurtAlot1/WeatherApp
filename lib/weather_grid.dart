import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'weather.dart';
import 'weather_card.dart';
import 'constants.dart' as constants;

class WeatherGrid extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;
  const WeatherGrid({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDay = snapshot.data!.condition.isDay;
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
            data: '${snapshot.data!.condition.feelsLikeTemp.toInt()} °',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
          WeatherCard(
            iconData: WeatherIcons.windy,
            description: 'Wind speed',
            data: '${snapshot.data!.condition.windSpeed.toInt()} km/h',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
          WeatherCard(
            iconData: WeatherIcons.humidity,
            description: 'Humidity',
            data: '${snapshot.data!.condition.humidity} %',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
          WeatherCard(
            iconData: WeatherIcons.day_sunny,
            description: 'Ultraviolet',
            data: '${snapshot.data!.condition.ultraviolet.toInt()}',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
          WeatherCard(
            iconData: Icons.remove_red_eye_outlined,
            description: 'Vision',
            data: '${snapshot.data!.condition.vision.toInt()} km',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
          WeatherCard(
            iconData: WeatherIcons.barometer,
            description: 'Pressure',
            data: '${snapshot.data!.condition.pressure.toInt()} mm.',
            cardColor:
                isDay ? constants.dayCardColor : constants.nightCardColor,
            descriptionTextStyle: isDay
                ? constants.dayDescCardTextStl
                : constants.nightDescCardTextStl,
            iconColor: isDay
                ? constants.dayTextAndIconColor
                : constants.nightTextAndIconColor,
            mainTextStyle: isDay
                ? constants.dayMainCardTextStl
                : constants.nightMainCardTextStl,
          ),
        ],
      ),
    );
  }
}
