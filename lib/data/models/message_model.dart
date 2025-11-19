class MessageModel {
  final String body;
  final String id;

  MessageModel({required this.body, required this.id});

  factory MessageModel.fromJson(json) {
    return MessageModel(body: json['body'],id: json['id']);
  }
}
