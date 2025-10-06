import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({this.hintText, this.onChange});

  String? hintText;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'field is required';
        }
        return null;
      },
      onChanged: onChange,
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
