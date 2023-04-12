import 'package:flutter_weather/features/data/datasource/weather_client/models.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/services.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';

class CurrentWeatherRepository {
  // Class for get current weather

  Future<CurrentWeatherModel> getWeather({required String city}) async {
    CurrentWeatherDTO weather = await getCurrentWeather(city: city);

    return CurrentWeatherModel(
        name: weather.name,
        temp: weather.temp,
        wind: weather.wind,
        humidity: weather.humidity);
  }
}

class WeatherListRepository {
  // Class for get weather list

  Future<List<WeatherListModel>> getWeathers(
      {required String city, required int days}) async {
    List<WeatherListDTO> weathers =
        await getWeatherList(city: city, days: days);

    List<WeatherListModel> resultWeather = [];

    for (var weather in weathers) {
      resultWeather.add(WeatherListModel(
          name: weather.name,
          datetime: weather.datetime,
          temp: weather.temp,
          wind: weather.wind,
          humidity: weather.humidity));
    }

    return resultWeather;
  }
}
