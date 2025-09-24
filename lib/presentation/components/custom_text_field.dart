import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({this.hintText});
String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white, width: 2),
        ),
        hintText: hintText,
        hintStyle: TextStyleManager.White16Medium,
      ),
    );
  }
}
