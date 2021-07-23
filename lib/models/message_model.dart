import 'user_model.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: doris,
    time: '5:30 PM',
    text: 'Hello',
    unread: true,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: doris,
    time: '5:30 PM',
    text: 'Remember to get all A\'s this semester',
    unread: true,
  ),
  Message(
    sender: doris,
    time: '5:30 PM',
    text: 'Remember to get all A\'s this semester',
    unread: true,
  ),
];
