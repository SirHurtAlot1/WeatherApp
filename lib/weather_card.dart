import 'package:flutter/material.dart';
import 'constants.dart' as Constants;

class WeatherCard extends StatelessWidget {
  final IconData iconData;
  final String description;
  final String data;
  const WeatherCard(
      {super.key,
      required this.iconData,
      required this.description,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.cardNightColor,
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
              color: Constants.textAndIconNightColor,
              size: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                description,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              data,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
