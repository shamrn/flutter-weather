// The file implements the user's input of the city

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/common/app_constants.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_bloc.dart';
import 'package:flutter_weather/features/presentation/blocs/current_weather/current_weather_event.dart';
import 'package:flutter_weather/features/presentation/widgets/form_widget.dart';


class CityInputScreen extends StatefulWidget {
  const CityInputScreen({Key? key}) : super(key: key);

  @override
  State<CityInputScreen> createState() => _CityInputScreenState();
}

class _CityInputScreenState extends State<CityInputScreen> {

  final TextEditingController _cityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppStyles.primaryPadding,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormWidget(
                    labelText: 'Введите город',
                    textController: _cityController),
                const SizedBox(
                  height: 30,
                ),
                _confirmButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _confirmButton(BuildContext context) {
    // The method implements the value input confirmation button from the user

    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context
              .read<CurrentWeatherBloc>()
              .add(CurrentWeatherLoadEvent(city: _cityController.text));
          Navigator.pushNamed(context, '/detail');
        }
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
