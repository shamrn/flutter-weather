// The file contains the implementation of the state management for weather list

import 'package:bloc/bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/exceptions.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';
import 'package:flutter_weather/features/data/repositories/weather_repository.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_event.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_state.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  // Implementation state management for weather list

  static const numberListWeather = AppSettings.numberListWeather;

  WeatherListBloc() : super(WeatherListInitialState()) {
    on<WeatherListLoadEvent>(_weatherListLoad);
  }

  void _weatherListLoad(
      WeatherListLoadEvent event, Emitter<WeatherListState> state) async {
    // Handling a data load event

    emit(WeatherListLoadingState());
    try {
      List<WeatherListModel> weathers = await WeatherListRepository()
          .getWeathers(city: event.city, days: numberListWeather);

      // The result is sorted by the `temp` field
      weathers.sort((a, b) => a.temp.compareTo(b.temp));

      emit(WeatherListLoadedState(weathers: weathers));
    } on WeatherBaseException {
      emit(WeatherListErrorState());
    }
  }
}
