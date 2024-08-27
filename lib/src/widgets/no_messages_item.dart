import 'package:flutter/material.dart';

class NoMessagesItem extends StatelessWidget {
  const NoMessagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error, size: 20),
        Text("No messages yet",
            style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.black45)),
      ],
    );
  }
}
