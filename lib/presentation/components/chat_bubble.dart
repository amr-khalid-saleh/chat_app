import 'package:chat_app/data/models/message_model.dart';
import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/text_style_manager.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key,required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //alignment: Alignment.centerLeft,بتعمل مساحه حول النص وبتاخد العرض بتاع الشاشه كله
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorManager.background_color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Text(messageModel.body, style: TextStyleManager.White18SemiBold),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({super.key,required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        //alignment: Alignment.centerLeft,بتعمل مساحه حول النص وبتاخد العرض بتاع الشاشه كله
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Text(messageModel.body, style: TextStyleManager.White18SemiBold),
      ),
    );
  }
}
