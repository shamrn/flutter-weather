import 'dart:convert';
import 'dart:io';

import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/exceptions.dart';
import 'package:http/http.dart' as http;

class WeatherClient {
  // Weather client

  static const String url = AppApi.weatherUrl;
  static const String endpoint =
      AppApi.weatherApiVersion + AppApi.weatherApiEndpoint;
  static const String apiKey = AppApi.weatherApiKey;

  final String city;
  final int? days;

  Map<dynamic, dynamic>? _result;

  Map<dynamic, dynamic>? get result => _result;

  WeatherClient({required this.city, this.days});

  Future request() async {
    // The method implements an http request

    Uri uri = Uri.https(url, endpoint, _params);
    final response = await http.get(uri);
    if (response.statusCode == HttpStatus.ok) {
      _result = json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw WeatherBadRequestException();
    }
  }

  Map<String, dynamic> get _params => {
        'key': apiKey,
        'q': city,
        'days': days.toString(),
      };
}
