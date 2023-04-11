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
        labelStyle:
            const TextStyle(fontSize: 14, color: AppColors.primaryColor),
        enabledBorder: _underlineInputBorder,
        focusedBorder: _underlineInputBorder,
      ),
      onFieldSubmitted: (_) {},
    );
  }

  UnderlineInputBorder get _underlineInputBorder {
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
