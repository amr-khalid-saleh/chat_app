import 'dart:developer';

import 'package:chat_app/data/models/message_model.dart';
import 'package:chat_app/presentation/resources/color_manager.dart';
import 'package:chat_app/presentation/resources/text_style_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String id = 'ChatScreen';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );

  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      //DocumentSnapshot
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      //.doc('a6lHVZVYt1Wxyga2VCrx')
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
          }
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
                  child: ListView.builder(
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
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textEditingController, //للتحكم في مجال الكتابه
                    onSubmitted: (value) {
                      messages.add({
                        "body": value,
                        "createdAt": DateTime.now(),
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
                          color: ColorManager.background_color.withOpacity(0.4),
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
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                constraints: BoxConstraints(
                  maxWidth: 60,
                  maxHeight: 60,
                  minWidth: 45,
                  minHeight: 45,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
