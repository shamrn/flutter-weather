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

class ListWeatherModel {
  String name;
  DateTime datetime;
  double temp;
  double wind;
  double humidity;

  ListWeatherModel(
      {required this.name,
      required this.datetime,
      required this.temp,
      required this.wind,
      required this.humidity});
}
