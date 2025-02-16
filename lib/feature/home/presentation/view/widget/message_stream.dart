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

          return ListView.builder(
            reverse: true, // Newest messages at the bottom
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final messageData = messages[index].data() as Map<String, dynamic>;
              final messageText = messageData['message'];
              final messageSender = messageData['senderId'];
              final timestamp = messageData['timestamp'] ?? FieldValue.serverTimestamp();

              final currentUser = FirebaseAuth.instance.currentUser!.uid;
              return MessageBubble(
                isMe: currentUser == messageSender,
                sender: messageSender,
                text: messageText,
                timestamp: timestamp,
              );
            },
          );
        });
  }
}
