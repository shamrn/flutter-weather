abstract class CurrentWeatherEvent {}

class CurrentWeatherLoadEvent extends CurrentWeatherEvent {
  String city;

  CurrentWeatherLoadEvent({required this.city});
}
