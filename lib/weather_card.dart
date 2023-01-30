import 'package:flutter/material.dart';
import 'constants.dart' as constants;

class WeatherCard extends StatelessWidget {
  final IconData iconData;
  final String description;
  final String data;
  final Color cardColor;
  final Color iconColor;
  final TextStyle descriptionTextStyle;
  final TextStyle mainTextStyle;

  const WeatherCard(
      {super.key,
      required this.iconData,
      required this.description,
      required this.data,
      required this.cardColor,
      required this.iconColor,
      required this.descriptionTextStyle,
      required this.mainTextStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(description, style: descriptionTextStyle),
            ),
            Text(data, style: mainTextStyle)
          ],
        ),
      ),
    );
  }
}
