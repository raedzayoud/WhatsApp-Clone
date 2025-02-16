
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/core/widget/custom_loading.dart';
import 'package:whatsappclone/feature/home/presentation/view/widget/message_bubble.dart';

class MessageStreem extends StatelessWidget {
  final String chatId;
  const MessageStreem({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(chatId)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CustomLoading();
          }
          final messages = snapshot.data!.docs;
          List<MessageBubble> MessageWidgets= [];
          for (var message in messages) {
            final messageData = message.data() as Map<String, dynamic>;
            final messageText = messageData['message'];
            final messageSender = messageData['senderId'];
            final Timestamp =
                messageData['timestamp'] ?? FieldValue.serverTimestamp();

            final currentUser = FirebaseAuth.instance.currentUser!.uid;
            MessageBubble MessageWidget = MessageBubble(
              isMe: currentUser == messageSender,
              sender: messageSender,
              text: messageText,
              timestamp: Timestamp,
            );
            MessageWidgets.add(MessageWidget);
          }
          return ListView(
            reverse: true,
            children: MessageWidgets,
          );
        });
  }
}
