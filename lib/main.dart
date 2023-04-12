import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/common/utils.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:flutter_weather/features/presentation/screens/city_input_screen.dart';
import 'package:flutter_weather/features/presentation/screens/detail_screen.dart';
import 'package:flutter_weather/features/presentation/screens/list_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrentWeatherBloc>(
            create: (context) => CurrentWeatherBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            canvasColor: AppColors.canvasColor,
            primarySwatch: convertHexToMaterialColor(AppColors.primaryColor)),
        initialRoute: '/',
        routes: {
          '/': (context) => CityInputScreen(),
          '/detail': (context) => const DetailScreen(),
          '/list': (context) => const ListScreen(),
        },
      ),
    );
  }
}
