// The file implements the user's input of the city

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/presentation/widgets/form_widget.dart';

class CityInputScreen extends StatelessWidget {
  static final TextEditingController _cityController = TextEditingController();

  const CityInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppStyles.primaryPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormWidget(
                  labelText: 'Введите город', textController: _cityController),
              const SizedBox(
                height: 30,
              ),
              _confirmButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    // The method implements the value input confirmation button from the user

    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/detail');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.canvasColor,
        backgroundColor: AppColors.primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
      ),
      child: const Text(
        'Подтвердить',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      ),
    );
  }
}
