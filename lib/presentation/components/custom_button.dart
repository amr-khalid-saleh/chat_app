import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
