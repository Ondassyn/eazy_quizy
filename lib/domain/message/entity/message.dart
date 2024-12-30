class MessageEntity {
  final String id;
  final String author;
  final String text;
  final DateTime createdAt;

  MessageEntity(
      {required this.id,
      required this.author,
      required this.text,
      required this.createdAt});
}
