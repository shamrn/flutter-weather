// The file implements a detailed weather screen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_state.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_bloc.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_event.dart';
import 'package:flutter_weather/features/presentation/widgets/network_error_widget.dart';
import 'package:flutter_weather/features/presentation/widgets/snack_bar_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
          IconButton(
              onPressed: () {
                CurrentWeatherState currentWeatherState =
                    context.read<CurrentWeatherBloc>().state;

                // If the current weather data is loaded, open the screen with the list of
                if (currentWeatherState is CurrentWeatherLoadedState) {
                  context.read<WeatherListBloc>().add(WeatherListLoadEvent(
                      city: currentWeatherState.weather.name));
                  Navigator.pushNamed(context, '/list');
                }

                // If the current weather data could not be loaded.
                // Pressing the button shows the snack bar
                else if (currentWeatherState is CurrentWeatherErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      errorSnackBarWidget(
                          context: context,
                          errorMessage: currentWeatherState.errorMessage));
                }
              },
              icon: const Icon(Icons.list)),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: AppStyles.primaryPadding,
        child: BlocConsumer<CurrentWeatherBloc, CurrentWeatherState>(

          listenWhen: (prevState, state) {
            return prevState is! CurrentWeatherErrorState &&
                state is CurrentWeatherErrorState;
          },
          listener: (context, state) {
            if (state is CurrentWeatherErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  errorSnackBarWidget(
                      context: context,
                      errorMessage: state.errorMessage));
            }
          },

          builder: (context, state) {
            if (state is CurrentWeatherErrorState) {
              return NetworkErrorWidget(errorMessage: state.errorMessage);
            } else if (state is CurrentWeatherLoadedState) {
              return _sectionCurrentWeather(
                weather: state.weather,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )),
    );
  }

  Widget _sectionCurrentWeather({required CurrentWeatherModel weather}) {
    return Column(
      children: [
        Text(
          weather.name,
          style: AppStyles.boldTextStyle.copyWith(fontSize: 32),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${weather.temp}°C',
          style: AppStyles.boldTextStyle
              .copyWith(fontSize: 62, color: AppColors.primaryColor),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Влажность: ${weather.humidity}%',
              style: AppStyles.mediumTextStyle
                  .copyWith(fontSize: 12, color: AppColors.secondTextColor),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Скорость ветра: ${weather.wind}мс',
              style: AppStyles.mediumTextStyle
                  .copyWith(fontSize: 12, color: AppColors.secondTextColor),
            ),
          ],
        ),
      ],
    );
  }
}
