// The file implements DTO models

import 'dart:core';

import 'package:flutter_weather/common/utils.dart';

class CurrentWeatherDTO {
  late String name;
  late double temp;
  late double wind;
  late double humidity;

  CurrentWeatherDTO(
      {required this.name,
      required this.temp,
      required this.wind,
      required this.humidity});

  CurrentWeatherDTO.fromJson(Map<dynamic, dynamic> json) {
    Map<dynamic, dynamic> current = json['current'];

    name = json['location']['name'];
    temp = current['temp_c'];
    wind = kilometerPerHourToMeterPerSecond(current['wind_kph']);
    humidity = (current['humidity'] as int).toDouble();
  }
}

class WeatherListDTO {
  late String name;
  late DateTime datetime;
  late double temp;
  late double wind;
  late double humidity;

  WeatherListDTO(
      {required this.name,
      required this.datetime,
      required this.temp,
      required this.wind,
      required this.humidity});

  static List<WeatherListDTO> bulkMakeFromJson(Map<dynamic, dynamic> json) {
    String name = json['location']['name'];
    List<dynamic> weatherByDays = json['forecast']['forecastday'];
    return weatherByDays
        .map((day) => WeatherListDTO._fromJson(day, name))
        .toList();
  }

  factory WeatherListDTO._fromJson(Map<dynamic, dynamic> json, String name) {
    Map<dynamic, dynamic> dayData = json['day'];

    return WeatherListDTO(
        name: name,
        datetime: DateTime.parse(json['date']),
        temp: dayData['avgtemp_c'],
        wind: kilometerPerHourToMeterPerSecond(dayData['maxwind_kph']),
        humidity: dayData['avghumidity']);
  }
}
