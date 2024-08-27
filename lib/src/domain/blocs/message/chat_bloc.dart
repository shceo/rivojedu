import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edu/src/domain/entity/message_model.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<FetchMessages>(_onFetchMessages);
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onFetchMessages(
      FetchMessages event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('chats')
          .where('address', whereIn: [
            '${event.from}|${event.to}',
            '${event.to}|${event.from}'
          ])
          .orderBy('timestamp', descending: false)
          .get();
      print("Yozildi ..........................................");

      List<MessageModel> messages = snapshot.docs
          .map((doc) =>
              MessageModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      emit(ChatLoaded(messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  } 

  Future<void> _onSendMessage(
      SendMessage event, Emitter<ChatState> emit) async {
    try {
      await FirebaseFirestore.instance
          .collection('chats')
          .add(event.message.toJson())
          .then((_) {
        print("Message added successfully ");
      });
    } catch (e) {
      emit(ChatError(e.toString()));
      print("Failed to add message_____________: $e");
    }
  }
}
