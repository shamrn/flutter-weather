abstract class WeatherListEvent {}

class WeatherListLoadEvent extends WeatherListEvent {
  String city;

  WeatherListLoadEvent({required this.city});
}
