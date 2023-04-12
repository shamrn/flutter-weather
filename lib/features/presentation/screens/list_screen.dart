// The file implements a list weather screen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/data/models/weather_models.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_bloc.dart';
import 'package:flutter_weather/features/presentation/blocs/list_weather/list_weather_state.dart';
import 'package:flutter_weather/features/presentation/widgets/card_widget.dart';
import 'package:flutter_weather/features/presentation/widgets/network_error_widget.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardHeight = MediaQuery.of(context).size.height / 4.4;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: AppStyles.primaryPadding,
          child: BlocBuilder<WeatherListBloc, WeatherListState>(
            builder: (context, state) {
              if (state is WeatherListErrorState) {
                return NetworkErrorWidget(errorMessage: state.errorMessage);
              } else if (state is WeatherListLoadedState) {
                List<WeatherListModel> weathers = state.weathers;
                return Column(
                  children: [
                    Text(
                      weathers.first.name,
                      style: AppStyles.boldTextStyle.copyWith(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => CardWidget(
                                height: cardHeight,
                                weather: weathers[index],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: weathers.length),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
