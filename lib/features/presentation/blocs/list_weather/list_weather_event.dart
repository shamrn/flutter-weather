// The file contains a set of events for a weather list

abstract class WeatherListEvent {}

class WeatherListLoadEvent extends WeatherListEvent {
  String city;

  WeatherListLoadEvent({required this.city});
}
