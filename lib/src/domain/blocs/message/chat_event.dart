import 'package:edu/src/domain/entity/message_model.dart';

abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final MessageModel message;
  SendMessage(this.message);
}


class FetchMessages extends ChatEvent {
  final String from;
  final String to;

  FetchMessages({required this.from, required this.to});
}
