import 'package:bloc/bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/datasource/weather_client/exceptions.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';
import 'package:flutter_weather/features/data/repositories/weather_repository.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_event.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_state.dart';

class WeatherListBloc extends Bloc<WeatherListEvent, WeatherListState> {
  static const numberListWeather = AppSettings.numberListWeather;

  WeatherListBloc() : super(WeatherListInitialState()) {
    on<WeatherListLoadEvent>(_weatherListLoad);
  }

  void _weatherListLoad(
      WeatherListLoadEvent event, Emitter<WeatherListState> state) async {
    emit(WeatherListLoadingState());
    try {
      List<WeatherListModel> weathers = await WeatherListRepository()
          .getWeathers(city: event.city, days: numberListWeather);
      weathers.sort((a, b) => b.temp.compareTo(a.temp));
      emit(WeatherListLoadedState(weathers: weathers));
    } on WeatherBaseException {
      emit(WeatherListErrorState());
    }
  }
}
