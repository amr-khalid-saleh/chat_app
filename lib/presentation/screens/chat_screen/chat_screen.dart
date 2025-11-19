import 'package:chat_app/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/data/cubits/chat_cubit/chat_state.dart';
import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/constant.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'ChatScreen';

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessageCollection,
  );

  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorManager.background_color,
        title: Text("chat app", style: TextStyleManager.White24ExtraBold),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                List<MessageModel> messagesList = BlocProvider.of<ChatCubit>(
                  context,
                ).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBubble(messageModel: messagesList[index])
                        : ChatBubbleForFriend(
                            messageModel: messagesList[index],
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: textEditingController, //للتحكم في مجال الكتابه
              onSubmitted: (value) {
                messages.add({
                  kBody: value,
                  kCreatedAt: DateTime.now(),
                  "id": email,
                });
                textEditingController.clear(); //لافراغ مكان الكتابه
                scrollController.animateTo(
                  0, //scrollController.position.maxScrollExtent + 74,
                  duration: Duration(seconds: 3),
                  curve: Curves.fastOutSlowIn,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send message...',
                suffixIcon: Icon(
                  Icons.message_outlined,
                  color: ColorManager.background_color,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ColorManager.background_color.withValues(alpha: 0.4),
                    width: 2.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: ColorManager.background_color,
                    width: 2.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
