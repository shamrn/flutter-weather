// The file implements a list weather screen

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/presentation/widgets/card_widget.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Краснодар',
                style: AppStyles.boldTextStyle.copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 10,
              ),
              CardWidget(
                height: cardHeight,
                date: '27.04',
                temp: '22',
                humidity: '30',
                wind: '4',
              ),
              CardWidget(
                height: cardHeight,
                date: '27.04',
                temp: '22',
                humidity: '30',
                wind: '4',
              ),
              CardWidget(
                height: cardHeight,
                date: '27.04',
                temp: '22',
                humidity: '30',
                wind: '4',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
