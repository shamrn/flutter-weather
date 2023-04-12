// The file implements base form widget

import 'package:flutter/material.dart';
import 'package:flutter_weather/common/app_constants.dart';

class FormWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final TextInputType keyboardType;

  const FormWidget({
    Key? key,
    required this.labelText,
    required this.textController,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textController,
      decoration: InputDecoration(
        fillColor: AppColors.darkenedBackgroundColor,
        filled: true,
        labelText: labelText,
        labelStyle: AppStyles.mediumTextStyle,
        enabledBorder: _underlineInputBorder,
        focusedBorder: _underlineInputBorder,
        errorBorder: _underlineInputBorder,
        focusedErrorBorder: _underlineInputBorder,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppTexts.validationRequiredFieldText;
        }
        return null;
      },
    );
  }

  UnderlineInputBorder get _underlineInputBorder {
    // The method returns a common `UnderlineInputBorder`

    return const UnderlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    );
  }
}
