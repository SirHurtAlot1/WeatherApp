import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/weather.dart';
import 'package:http/http.dart' as http;
import 'constants.dart' as constants;
import 'weather_grid.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late bool isDay;
  late Future<Weather> forecast = getWeather();
  late Timer timer;
  @override
  initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        forecast = getWeather();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return FutureBuilder(
      future: forecast,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          isDay = snapshot.data!.condition.isDay;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(isDay
                              ? constants.dayBackgroundImagePath
                              : constants.nightBackgroundImagePath),
                          fit: BoxFit.cover)),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  extendBodyBehindAppBar: false,
                  appBar: _buildAppBar(),
                  body: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(top: 25, bottom: 20),
                              child: Text(
                                  snapshot.data!.locationData.locationName,
                                  style: isDay
                                      ? constants.dayLocationTextStl
                                      : constants.nightLocationTextStl),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(top: 250, bottom: 20),
                              child: Text(
                                '${snapshot.data!.condition.temp.toInt()} °',
                                style: isDay
                                    ? constants.dayMainTempTextStl
                                    : constants.nightMainTempTextStl,
                              ),
                            ),
                            WeatherGrid(snapshot: snapshot)
                          ],
                        ),
                      )),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      leadingWidth: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              size: 35,
              color: isDay
                  ? constants.dayTextAndIconColor
                  : constants.nightTextAndIconColor,
            )),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.centerRight,
            child: RichText(
                text: TextSpan(
                    text: 'About',
                    style: isDay
                        ? constants.dayAppBarLeadingTextStl
                        : constants.nightAppBarLeadingTextStl)),
          ),
        )
      ],
    );
  }
}

Future<Weather> getWeather() async {
  final response = await http.get(Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=439bcec77514469aa64133111230901&q=Chicago&aqi=no'));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Something went wrong');
  }
}
