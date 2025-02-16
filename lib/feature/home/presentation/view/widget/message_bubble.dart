import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final bool isMe;
  final String text;
  final dynamic timestamp;
  const MessageBubble(
      {super.key,
      required this.sender,
      required this.isMe,
      required this.text,
      this.timestamp});

  @override
  Widget build(BuildContext context) {
    final DateTime messageTiime =
        (timestamp is Timestamp) ? timestamp.toDate() : DateTime.now();
    return Column(
      crossAxisAlignment:
          isMe == true ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
           // height: 1000,
            decoration: BoxDecoration(
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                    : BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                color: isMe ? Colors.blue : Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 15, color: isMe ? Colors.white : Colors.black),
                  ),
                  Text(
                    '${messageTiime.hour}:${messageTiime.minute}',
                    style: TextStyle(
                        fontSize: 12, color: isMe ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
