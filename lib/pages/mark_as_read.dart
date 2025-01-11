//It didn't work, but I will figure out how to fix it later. ;)

import 'package:chat_app/pages/app_services.dart';
import 'package:chat_app/pages/message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarkAsRead extends StatelessWidget {
  final Message message;
  const MarkAsRead({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    const markRead = Icon(
      Icons.mark_chat_read,
      color: Colors.indigo,
      size: 18.0,
    );

    const markUnRead = Icon(
      Icons.mark_chat_unread,
      color: Colors.grey,
      size: 18.0,
    );

    // Mark as read if the message is not mine and not already read
    if (!message.isMine && !message.markAsRead) {
      final appService = context.read<AppService>();
      appService.markAsRead(message.id); // Trigger marking as read
    }

    // Display appropriate icon for the message
    if (message.isMine) {
      return message.markAsRead ? markRead : markUnRead;
    }

    return const SizedBox
        .shrink(); // Nothing to show for messages that are not mine
  }
}
