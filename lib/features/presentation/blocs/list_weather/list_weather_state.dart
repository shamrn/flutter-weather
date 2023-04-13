// The file contains a set of states for a weather list

import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';

abstract class WeatherListState {}

class WeatherListInitialState extends WeatherListState {}

class WeatherListLoadingState extends WeatherListState {}

class WeatherListLoadedState extends WeatherListState {
  final List<WeatherListModel> weathers;

  WeatherListLoadedState({required this.weathers});
}

class WeatherListErrorState extends WeatherListState {
  final errorMessage = AppTexts.errorNetworkMessage;
}
