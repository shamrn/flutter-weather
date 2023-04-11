import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/common/utils.dart';
import 'package:flutter_weather/features/presentation/screens/city_input_screen.dart';
import 'package:flutter_weather/features/presentation/screens/detail_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: AppColors.canvasColor,
          primarySwatch: convertHexToMaterialColor(AppColors.primaryColor)),
      initialRoute: '/',
      routes: {
        '/': (context) => const CityInputScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
