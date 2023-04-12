import 'package:flutter_weather/features/data/datasource/weather_client/client.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/exceptions.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/models.dart';

Future<CurrentWeatherDTO> getCurrentWeather({required String city}) async {
  // The function returns the current weather

  WeatherClient weatherClient = WeatherClient(city: city);
  await weatherClient.request();
  var result = weatherClient.result;

  if (result != null) {
    return CurrentWeatherDTO.fromJson(result);
  } else {
    throw WeatherFailedReceiveException();
  }
}

Future<List<WeatherListDTO>> getWeatherList({required String city}) async {
  // The function returns the list weather

  WeatherClient weatherClient = WeatherClient(city: city, days: 3); // mock days
  await weatherClient.request();
  var result = weatherClient.result;

  if (result != null) {
    List<WeatherListDTO> weathers = WeatherListDTO.factoryFromJson(result);
    return weathers;
  } else {
    throw WeatherFailedReceiveException();
  }
}
