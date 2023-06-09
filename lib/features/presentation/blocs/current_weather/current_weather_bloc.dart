// The file contains the implementation of the state management for current weather

import 'package:bloc/bloc.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/exceptions.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';
import 'package:flutter_weather/features/data/repositories/weather_repository.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_event.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  // Implementation state management for current weather

  CurrentWeatherBloc() : super(CurrentWeatherInitialState()) {
    on<CurrentWeatherLoadEvent>(_currentWeatherLoad);
  }

  void _currentWeatherLoad(
      CurrentWeatherLoadEvent event, Emitter<CurrentWeatherState> state) async {
    // Handling a data load event

    emit(CurrentWeatherLoadingState());
    try {
      CurrentWeatherModel weather =
          await CurrentWeatherRepository().getWeather(city: event.city);
      emit(CurrentWeatherLoadedState(weather: weather));
    } on WeatherBaseException {
      emit(CurrentWeatherErrorState());
    }
  }
}
