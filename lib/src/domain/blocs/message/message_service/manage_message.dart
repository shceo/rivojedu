import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu/src/domain/entity/message_model.dart';

Future<void> addMessage(MessageModel message) async {
  await FirebaseFirestore.instance.collection('chats').add(
        message.toJson(),
      );
}

Stream<List<MessageModel>> getMessages(String from, String to) {
  return FirebaseFirestore.instance
      .collection('chats')
      .where('address', whereIn: [
        '$from|$to',
        '$to|$from'
      ])
      .orderBy('timestamp', descending: false)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => MessageModel.fromJson(doc.data()))
          .toList());
}
