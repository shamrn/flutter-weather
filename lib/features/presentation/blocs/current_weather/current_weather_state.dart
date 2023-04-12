import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';

abstract class CurrentWeatherState {}

class CurrentWeatherInitialState extends CurrentWeatherState {}

class CurrentWeatherLoadingState extends CurrentWeatherState {}

class CurrentWeatherLoadedState extends CurrentWeatherState {
  final CurrentWeatherModel weather;

  CurrentWeatherLoadedState({required this.weather});
}

class CurrentWeatherErrorState extends CurrentWeatherState {
  final errorMessage = AppTexts.errorNetworkMessage;
}
