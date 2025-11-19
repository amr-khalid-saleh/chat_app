import '../../models/message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  List<MessageModel> messagesList;

  ChatSuccessState({required this.messagesList});
}
