// The file contains the models


class CurrentWeatherModel {
  String name;
  double temp;
  double wind;
  double humidity;

  CurrentWeatherModel(
      {required this.name,
      required this.temp,
      required this.wind,
      required this.humidity});
}

class WeatherListModel {
  String name;
  DateTime datetime;
  double temp;
  double wind;
  double humidity;

  WeatherListModel(
      {required this.name,
      required this.datetime,
      required this.temp,
      required this.wind,
      required this.humidity});
}
