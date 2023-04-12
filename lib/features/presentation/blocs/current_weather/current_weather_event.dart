// The file contains a set of events for a current weather

abstract class CurrentWeatherEvent {}

class CurrentWeatherLoadEvent extends CurrentWeatherEvent {
  String city;

  CurrentWeatherLoadEvent({required this.city});
}
