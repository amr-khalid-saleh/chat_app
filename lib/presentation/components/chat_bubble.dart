import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //alignment: Alignment.centerLeft,بتعمل مساحه حول النص وبتاخد العرض بتاع الشاشه كله
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Text("i'm amr saleh.", style: TextStyleManager.White16Medium),
      ),
    );
  }
}
