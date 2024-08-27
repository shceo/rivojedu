import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu/src/domain/blocs/message/chat_bloc.dart';
import 'package:edu/src/domain/blocs/message/chat_event.dart';
import 'package:edu/src/domain/blocs/message/chat_state.dart';
import 'package:edu/src/domain/entity/message_model.dart';
import 'package:edu/src/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ChatLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return ListTile(
                        title: Text(message.message),
                        subtitle: Text(
                            "From: ${message.admin} To: ${message.senderName}"),
                      );
                    },
                  ),
                ),
                InputField(hintText: "hintText"),
              ],
            );
          } else if (state is ChatError) {
            return Center(child: Text(state.error));
          } else {
            return Center(child: _ChatInput());
          }
        },
      ),
    );
  }
}

class _ChatInput extends StatefulWidget {
  @override
  __ChatInputState createState() => __ChatInputState();
}

class __ChatInputState extends State<_ChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isSendButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isSendButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: _isSendButtonEnabled
                ? () {
                    final message = MessageModel(
                      admin: false,
                      messageId: DateTime.now().toString(),
                      senderId: "user123", //
                      senderName: "User", //
                      message: _controller.text,
                      timestamp: Timestamp.now().toDate(),
                    );

                    context.read<ChatBloc>().add(SendMessage(message));
                    _controller.clear();
                    setState(() {
                      _isSendButtonEnabled = false;
                    });
                  }
                : null,
            child: Text("Send"),
          ),
        ],
      ),
    );
  }
}
