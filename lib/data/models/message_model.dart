class MessageModel {
  final String body;
  final String id;

  MessageModel({required this.body, required this.id});

  factory MessageModel.fromjson(json) {
    return MessageModel(body: json['body'],id: json['id']);
  }
}
