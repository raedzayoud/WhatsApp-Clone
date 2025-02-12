import 'package:flutter/material.dart';
import 'package:whatsappclone/core/utlis/assets.dart';

class chatTitle extends StatelessWidget {
  final String chatId;
  final String lastMessage;
  final DateTime timestamp;
  final Map<String, dynamic> receiverData;
  const chatTitle({
    super.key,
    required this.chatId,
    required this.lastMessage,
    required this.timestamp,
    required this.receiverData,
  });

  @override
  Widget build(BuildContext context) {
    return lastMessage != ""
        ? Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AssetsImage.man),
              ),
              Expanded(
                child: ListTile(
                  title: Text(receiverData['name']),
                  subtitle: Text(lastMessage),
                  trailing: Text('${timestamp.hour}:${timestamp.minute}'),
                ),
              ),
            ],
          )
        : Container();
  }
}
