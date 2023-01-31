// ignore_for_file: public_member_api_docs, sort_constructors_first
class Weather {
  LocationData locationData;
  CurrentConditionData condition;

  Weather({
    required this.locationData,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      locationData: LocationData.fromJson(json['location']),
      condition: CurrentConditionData.fromJson(json['current']),
    );
  }
}

class LocationData {
  String locationName;

  LocationData({required this.locationName});

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      locationName: json['name'] as String,
    );
  }
}

class CurrentConditionData {
  double temp; //celsium
  double feelsLikeTemp;
  bool isDay;
  double windSpeed; //kph
  String windDirection;
  double pressure; //make converter from inches to mm
  int humidity; //percent?
  double vision; //km
  double ultraviolet;
  ConditionDescriptionData description;

  CurrentConditionData(
      {required this.temp,
      required this.feelsLikeTemp,
      required this.isDay,
      required this.windSpeed,
      required this.windDirection,
      required this.pressure,
      required this.humidity,
      required this.vision,
      required this.ultraviolet,
      required this.description});

  factory CurrentConditionData.fromJson(Map<String, dynamic> json) {
    return CurrentConditionData(
      temp: json['temp_c'] as double,
      isDay: json['is_day'] == 1 ? true : false,
      description: ConditionDescriptionData.fromJson(json['condition']),
      windSpeed: json['wind_kph'] as double,
      windDirection: json['wind_dir'] as String,
      pressure: convertInchesToMillimetres(json['pressure_in'] as double),
      humidity: json['humidity'] as int,
      feelsLikeTemp: json['feelslike_c'] as double,
      vision: json['vis_km'] as double,
      ultraviolet: json['uv'] as double,
    );
  }
}

class ConditionDescriptionData {
  String conditionDesc;
  String conditionIcon;

  ConditionDescriptionData({
    required this.conditionDesc,
    required this.conditionIcon,
  });

  factory ConditionDescriptionData.fromJson(Map<String, dynamic> json) {
    return ConditionDescriptionData(
      conditionDesc: json['text'] as String,
      conditionIcon: json['icon'] as String,
    );
  }
}

double convertInchesToMillimetres(double inch) {
  return inch * 25.4;
}
