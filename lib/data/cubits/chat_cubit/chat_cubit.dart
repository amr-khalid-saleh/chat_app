import 'package:chat_app/presentation/resources/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());
  CollectionReference messages = FirebaseFirestore.instance.collection(
    kMessageCollection,
  );

  void sendMessage({required String message, required String email}) {
    messages.add({kBody: message, kCreatedAt: DateTime.now(), "id": email});
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      emit(ChatSuccessState());
    });
  }
}
